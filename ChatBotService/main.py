from flask import Flask, request, jsonify, render_template_string
from chatbot_service import ChatbotService

app = Flask(__name__)
service = ChatbotService()


@app.route('/')
def home():
    return 'Helloo'

@app.route('/chat', methods=['POST'])
def ask():
    try:
        data = request.get_json()
        question = data.get('question', '')
        userid = data.get('userID', 0)
        answer = service.post(question,userid)
        return jsonify({"question": question, "answer": answer})
    except Exception as e:
        return jsonify({"error": str(e)}), 500




if __name__ == '__main__':
    app.run(debug=True)