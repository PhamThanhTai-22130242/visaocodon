package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ResourceDao;
import com.baya.baya_project.Dao.mapper.PermissionsDao;
import com.baya.baya_project.service.ResponseStatus;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "RemoveResourceAdmin", value = "/removeResource")
public class RemoveResourceAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        try{
            System.out.println(sb.toString());
            String jsonString = sb.toString();
            JSONObject json = new JSONObject(jsonString);
            int featureID = json.getInt("featureID");
            System.out.println(featureID);
            ResourceDao dao = new ResourceDao();
            PermissionsDao permissionsDao = new PermissionsDao();
            if( permissionsDao.delete(featureID)>0 && dao.delete(featureID)>0){
                ResponseStatus.successResponse(response);
                return;


            }else{
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi khi xóa.");

            }


        }catch (Exception e){

            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình xóa");

        }



    }


}