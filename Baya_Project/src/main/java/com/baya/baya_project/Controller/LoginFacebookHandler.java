package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Handle.AccountFB;
import com.baya.baya_project.Handle.FacebookDTO;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.service.LogService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoginFacebookHandler", value = "/loginFacebookHandler")
public class LoginFacebookHandler extends HttpServlet {
    public final int undetermined =-1;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        LogService log = new LogService();
        String error = request.getParameter("error");
        if (error != null) {
            // Người dùng nhấn "Cancel" hoặc từ chối cấp quyền
            response.sendRedirect("/login");
            return;
        }

        String code = request.getParameter("code");

        FacebookDTO dto = new FacebookDTO();
        String tokens = dto.getToken(code);
        System.out.println(tokens);
        AccountFB acc = dto.getUserInfo(tokens);
        System.out.println(acc);
        UserDAO dao = new UserDAO();
        if(acc == null )
        {
            log.warning(undetermined, "Đăng nhập bằng Facebook", "Bắt đầu nhận data người dùng", "Không có kết quả nào được tìm thấy");

            response.sendRedirect("error-404.jsp");
            return;
        }
        String url=null;
        if(acc.getEmail() !=null){
          if(dao.checkEmail(acc.getEmail())) {
              User user = dao.findUserByEmail(acc.getEmail());
              if(dao.checkStatus(acc.getEmail()) == 1){
                  log.infor(user.getUserID(), "Đăng nhập bằng Facebook", "Nhận tokens", "Đăng nhập thành công");

                  session.setAttribute("user", user);
                  url = "/";
              }
              else if(dao.checkStatus(acc.getEmail()) == 2){
                  int type = 2;
                  log.infor(user.getUserID(), "Đăng nhập bằng Facebook", "Nhận tokens", "Tài khoaản này đang bị khóa");
                  request.setAttribute("type", type);
                  url = "resultRegister.jsp";
              }

          }
        }
        else{
            log.infor(undetermined, "Đăng nhập bằng Facebook", "Nhận tokens", "Bắt đầu tạo tài khoản User mới");
            request.setAttribute("acc", acc);
            url = "FormLoginFBHandler.jsp";
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
}