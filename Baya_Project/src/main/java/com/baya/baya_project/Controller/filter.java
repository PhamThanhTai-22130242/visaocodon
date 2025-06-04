package com.baya.baya_project.Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;



import java.io.IOException;

@WebFilter("/yourServletPath")  // Định nghĩa URL mà filter sẽ áp dụng
public class filter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo filter nếu cần
        System.out.println("Filter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // Trước khi tiếp tục với servlet, có thể xử lý yêu cầu
        System.out.println("Before servlet execution");

        // Tiến hành tiếp tục chuỗi filter hoặc gọi servlet
        chain.doFilter(request, response);

        // Sau khi servlet thực hiện, có thể xử lý kết quả phản hồi
        System.out.println("After servlet execution");
    }

    @Override
    public void destroy() {
        // Giải phóng tài nguyên khi filter bị hủy
        System.out.println("Filter destroyed");
    }
}
