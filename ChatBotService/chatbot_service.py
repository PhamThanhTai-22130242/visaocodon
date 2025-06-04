from sqlalchemy import create_engine, text, inspect
from sshtunnel import SSHTunnelForwarder
from dotenv import load_dotenv
import google.generativeai as genai
import os

class ChatbotService:
    def __init__(self):
        load_dotenv(dotenv_path='config.env')
        self.tunnel = self._setup_ssh_tunnel()
        self.engine = self._setup_database_connection()
        self.gemini_model = self._configure_gemini()

    def _setup_ssh_tunnel(self):
        try:
            tunnel = SSHTunnelForwarder(
                (os.getenv("SSH_HOST"), 22),
                ssh_username=os.getenv("SSH_USERNAME"),
                ssh_password=os.getenv("SSH_PASSWORD"),
                remote_bind_address=(os.getenv("SSH_HOST"), 3306)
            )
            tunnel.start()
            print("SSH Tunnel established successfully")
            return tunnel
        except Exception as e:
            print(f"Failed to establish SSH tunnel: {e}")
            raise

    def _setup_database_connection(self):
        try:
            engine = create_engine(
                f"mysql+pymysql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}"
                f"@127.0.0.1:{self.tunnel.local_bind_port}/csdl_noithat",
                pool_pre_ping=True,
                connect_args={'connect_timeout': 10, 'read_timeout': 20, 'write_timeout': 20}
            )
            print("Database connection established")
            return engine
        except Exception as e:
            print(f"Failed to connect to database: {e}")
            raise

    # def _setup_database_connection(self):
    #     try:
    #         engine = create_engine(
    #             f"mysql+pymysql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}"
    #             f"@localhost:3306/csdl_noithat",  # Hoặc 127.0.0.1
    #             pool_pre_ping=True,
    #             connect_args={'connect_timeout': 10, 'read_timeout': 20, 'write_timeout': 20}
    #         )
    #         print("Database connection kết nối")
    #         return engine
    #     except Exception as e:
    #         print(f"kết noiosi thất bại   database: {e}")
    #         raise

    def _configure_gemini(self):
        try:
            api_key = os.getenv("GEMINI_API_KEY")
            if not api_key:
                raise ValueError("GEMINI_API_KEY not set")
            genai.configure(api_key=api_key)
            print("Gemini model configured")
            return genai.GenerativeModel('gemini-2.0-flash')
        except Exception as e:
            print(f"Failed to configure Gemini: {e}")
            return None

    def get_database_schema(self):
        try:
            inspector = inspect(self.engine)
            schema = {}
            for table_name in inspector.get_table_names():
                columns = [
                    {
                        'name': col['name'],
                        'type': str(col['type']),
                        'nullable': col['nullable'],
                        'primary_key': col.get('primary_key', False)
                    }
                    for col in inspector.get_columns(table_name)
                ]
                schema[table_name] = {
                    'columns': columns,
                    'primary_key': inspector.get_pk_constraint(table_name)['constrained_columns'],
                    'foreign_keys': [
                        {
                            'constrained_columns': fk['constrained_columns'],
                            'referred_table': fk['referred_table'],
                            'referred_columns': fk['referred_columns']
                        }
                        for fk in inspector.get_foreign_keys(table_name)
                    ]
                }
            return schema
        except Exception as e:
            print(f"Lỗi schema: {e}")
            raise

    def generate_sql_prompt(self, question, schema):
        # List of tables to include
        included_tables = [
            'category',
            'inventory',
            'order_detail',
            'order_status',
            'orders',
            'payment',
            'product_reviews',
            'products',
            'return_request_order',
            'specifications',
            'subimages',
            'users',
            'voucher',
            'vouchertype'
        ]

        lines = []
        for table, info in schema.items():
            # Only process tables in our included list
            if table in included_tables:
                cols = ", ".join(f"{c['name']} ({c['type']})" for c in info['columns'])
                pk = ", ".join(info['primary_key'])
                fk = ", ".join(
                    f"{', '.join(fk['constrained_columns'])} -> {fk['referred_table']}({', '.join(fk['referred_columns'])})"
                    for fk in info['foreign_keys']
                ) or "Không có"
                lines.append(f"Bảng {table}:\n- Cột: {cols}\n- Khóa chính: {pk}\n- Khóa ngoại: {fk}")
        schema_text = "\n".join(lines)

        prompt = f"""\
        Bạn là chuyên gia chuyển câu hỏi tiếng Việt thành SQL. Dưới đây là schema CSDL:
        {schema_text}
        Câu hỏi: "{question}"
        Yêu cầu:
        - Trả về duy nhất câu lệnh SQL hợp lệ, bắt đầu bằng SELECT với các table có tên bắt đầu chữ thường.
        - Khi câu hỏi muốn select hơn 5 hàng chỉ lấy tối đa 5 bản ghi  .
        - Không giải thích.
        """

        return prompt

    def validate_sql(self, sql):
        sql = sql.strip()
        if not sql.lower().startswith("select"):
            raise ValueError("Chỉ cho phép câu lệnh SELECT")
        for kw in ['drop', 'truncate', 'alter', ';--']:
            if kw in sql.lower():
                raise ValueError(f"Câu lệnh chứa từ cấm: {kw}")
        return sql

    def fallback_sql(self, question):
        q = question.lower()
        if "5 sản phẩm" in q or "năm sản phẩm" in q:
            return "SELECT * FROM products LIMIT 5"
        elif "sản phẩm giá cao nhất" in q:
            return "SELECT * FROM products ORDER BY price DESC LIMIT 3"
        return None

    def text_to_sql(self, question, schema):
        def clean(raw):
            return raw.strip().removeprefix("```sql").removesuffix("```").strip()

        if not self.gemini_model:
            fallback = self.fallback_sql(question)
            if fallback:
                return self.validate_sql(fallback)
            raise ValueError("Gemini không khả dụng và không có fallback")

        try:
            prompt = self.generate_sql_prompt(question, schema)
            response = self.gemini_model.generate_content(prompt)
            return self.validate_sql(clean(response.text))
        except Exception as e:
            print(f"Gemini error: {e}")
            fallback = self.fallback_sql(question)
            if fallback:
                return self.validate_sql(fallback)
            raise

    def generate_natural_response(self, question, data):
        try:
            if self.gemini_model:
                prompt = f"""
                Bạn là một trợ lý AI thông minh của website nội thất tên là phúc đẹp trai. Dưới đây là một đoạn dữ liệu và một câu hỏi nếu không liên quan đến bảo mật của website hay thông tin cá nhân người dùng,admin nếu bị vấn đề hãy trả lời  xin lỗi 
                tôi không thể cung cấp bảo mật trên được còn về câu hỏi  đơn hàng không phải thông tin bảo mật nên trả lời bình thường . Hãy trả lời bằng tiếng Việt tự nhiên, rõ ràng, chính xác, chỉ dựa trên dữ liệu được cung cấp.
                Câu hỏi: {question}
                Dữ liệu: 
                {data}
                Yêu cầu định dạng câu trả lời:
                - Trả lời ngắn gọn, đúng ý, không thêm thông tin không có trong dữ liệu.
                - Nếu câu trả lời liên quan đến sản phẩm, **phải hiển thị link ảnh rõ ràng**, một link mỗi sản phẩm,thêm description ngắn nữa cho sản phẩm nếu có không thì khỏi, thêm giá của sản phẩm nếu có không thì khỏi.
                - Không dùng các ký tự định dạng như `**`, `*`, hoặc các ký hiệu markdown.
                - Dữ liệu phải được trình bày gọn gàng, dễ đọc, có thể xuống dòng nếu cần.
                - Tuyệt đối không bịa đặt thông tin không có trong dữ liệu đầu vào.
                """

                response = self.gemini_model.generate_content(prompt)
                return response.text
            else:
                return self.fallback_response(data)
        except Exception as e:
            print(f"Error generating response: {e}")
            return self.fallback_response(data)

    def fallback_response(self, data):
        response = "Dưới đây là danh sách sản phẩm:\n\n"
        for row in data:
            try:
                product_id, name, price, discount, desc, _, stock, sold, thumbnail, created = row
                desc_short = desc[:100] + "..." if len(desc) > 100 else desc
                response += (
                    f"- {name} (ID: {product_id})\n"
                    f"  Giá: {price:,} VND (Giảm: {discount}%)\n"
                    f"  Mô tả: {desc_short}\n"
                    f"  Kho: {stock}, Đã bán: {sold}\n"
                    f"  Ngày tạo: {created}\n\n"
                )
            except Exception:
                continue
        return response

    def post(self, user_question: str, userid: int) -> str:
        try:
            greetings = ["xin chào", "hi", "hello", "chào", "chào bạn", "hey"]

            if user_question.lower().strip() in greetings:
                return "Xin chào! Tôi là chatbot hỗ trợ website nội thất. Rất vui được giúp đỡ bạn! Bạn có câu hỏi nào không?"

            order_keywords = ["đơn hàng", "đơn của tôi", "order", "hóa đơn", "lịch sử mua hàng"]

            if  userid == 0:
                return "Vui lòng đăng nhập để xác thực được bạn là ai trước khi hỏi về đơn hàng của bạn nha!"

            user_question = f"câu hỏi : {user_question} và  userID hỏi là : {userid}"
            schema = self.get_database_schema()
            sql = self.text_to_sql(user_question, schema)
            print(f"\n[Tạo câu lệnh SQL] {sql}")

            with self.engine.connect() as conn:
                result = conn.execute(text(sql))
                data = result.fetchall()

            answer = self.generate_natural_response(user_question, data)
            return answer

        except Exception as e:
            return f"Lỗi xử lý: {str(e)}"

    def shutdown(self):
        if self.tunnel and self.tunnel.is_active:
            self.tunnel.stop()
            print("SSH tunnel đóng")
        if self.engine:
            self.engine.dispose()
            print("Database engine đóng")


