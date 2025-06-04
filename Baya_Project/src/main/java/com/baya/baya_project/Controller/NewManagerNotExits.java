package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.UserDAO;
import com.baya.baya_project.Dao.UserRoleDao;
import com.baya.baya_project.Model.HashTokens;
import com.baya.baya_project.Model.JavaMail;
import com.baya.baya_project.Model.User;
import com.baya.baya_project.config.Server;
import com.baya.baya_project.service.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@WebServlet(name = "NewManagerNotExits", value = "/admin/authorizations/create/newManagerNotExits")
public class NewManagerNotExits extends HttpServlet {
    Server server = new Server();
    public static String paramURL(String email, String tokens){
        return "/activateManager?tokens="+tokens+ "&email="+email+"";
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public String resultURL(String para){
        StringBuilder builder = new StringBuilder();
        builder.append(server.getServerName());
        builder.append(para);
        System.out.println(builder.toString());
        return builder.toString();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        try {
            LogService logService = new LogService();
            JSONObject json = new JSONObject(sb.toString());
            String email = json.getString("email");

            User user = new User();
            user.setFullName(json.getString("fullName"));
            user.setEmail(email);
            user.setPhoneNumber(json.getString("phoneNumber"));
            String roleTickString = json.getString("roleTick");
            JSONArray roleArray = new JSONArray(roleTickString);
            List<Integer> roleTickList = new ArrayList<>();
            for (int i = 0; i < roleArray.length(); i++) {
                roleTickList.add(Integer.parseInt(roleArray.getString(i)));
            }
            user.setStatusID(3);
            user.setCreateAt(LocalDateTime.now());
            user.setAccountType(1);
            System.out.println(user);
            UserDAO userDAO = new UserDAO();
            User us = userDAO.findUserByEmail(email);
            if(us !=null && us.getStatusID()==1){
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Email đã tồn tại trong hệ thống. Nhập Email khác");
                return;
            }
            if(us !=null && us.getStatusID()==4){

                UserRoleDao userRoleDao = new UserRoleDao();
                userDAO.deleteRolebyUserID(us.getUserID());
                System.out.println("us id"+us.getFullName());
               userDAO.deleteUserID(us.getUserID());
            }
            int insert = userDAO.insertManager(user);
            if(insert==0){
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi. Không thể thêm vào hệ thống.");
                return;
            }
            int userID = userDAO.findUserByEmail(email).getUserID();


            JSONObject jsonObject = new JSONObject();
            UserRoleService service = new UserRoleService();

                int count = service.insert(userID, roleTickList);
                if(count ==-1) {
                    ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình thêm vào hệ thống ");
                    return;
                }
                else {
                    String listRoleName = service.getRoleName(roleTickList).toString();
                    String res =  Base64.getUrlEncoder().withoutPadding().encodeToString(new RandomTokens().generateToken().getBytes());
                    String hashTokens =  HashTokens.hashTokens(res);
                    userDAO.updateActiveMail(email, hashTokens);
                    System.out.println("Tokens gửi đi: "+ res+"Độ dài: "+ res.length());
                    new JavaMail().sendEmail(email, "KÍCH HOẠT TÀI KHOẢN NGƯỜI QUẢN TRỊ BAYA-STORE",new ActiveAccount().sendEmailAdminActive(email,user.getFullName(),   resultURL(   paramURL(email,res)) ,  listRoleName));
                    jsonObject.put("success", true);
                    jsonObject.put("message", "Vui lòng kiểm tra email để kích hoạt tài khoản");
                }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonObject.toString());
            response.setStatus(HttpServletResponse.SC_OK);

        }catch (Exception e) {
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống");

        }



    }
}