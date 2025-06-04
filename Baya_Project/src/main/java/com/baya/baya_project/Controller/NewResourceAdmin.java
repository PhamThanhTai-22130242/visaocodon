package com.baya.baya_project.Controller;

import com.baya.baya_project.Dao.ActionsDao;
import com.baya.baya_project.Dao.ResourceDao;
import com.baya.baya_project.Dao.mapper.PermissionsDao;
import com.baya.baya_project.Model.Actions;
import com.baya.baya_project.Model.Resource;
import com.baya.baya_project.service.ResponseStatus;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewResourceAdmin", value = "/newResource")
public class NewResourceAdmin extends HttpServlet {
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
        try {
            System.out.println(sb.toString());
            String jsonString = sb.toString();
            JSONObject json = new JSONObject(jsonString);


            String featureName = json.getString("featureName");


            System.out.println("Feature Name: " + featureName);
            ResourceDao resourceDao = new ResourceDao();
            List<Resource> list = resourceDao.selectAllResource();


            boolean exists = list.stream()
                    .anyMatch(r -> r.getFeatureName().toLowerCase().equals(featureName.toLowerCase()));
            System.out.println("exist là:" + exists);

            if (exists) {
                ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Tên Resoure đã tồn tại. Vui lòng đặt tên khác");
                return;
            } else {


                if (resourceDao.insert(featureName) > 0) {
                    try{
                        Resource res = resourceDao.selectResourceByName(featureName);
                        PermissionsDao permissionsDao = new PermissionsDao();
                        ActionsDao actionsDao = new ActionsDao();
                        List<Actions> listAction = actionsDao.selectAll();
                        for (Actions action : listAction) {
                            permissionsDao.insert(res.getFeatureID(),action.getActionID() );
                        }
                        ResponseStatus.successResponse(response);
                    }catch (Exception e){
                        ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi khi thêm dữ liệu vào Permission");

                    }

                } else {

                    ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật dữ liệu.");

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            ResponseStatus.sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống: ");
        }

    }
}