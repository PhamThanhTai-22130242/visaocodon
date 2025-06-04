package com.baya.baya_project.service;

import com.baya.baya_project.Dao.RoleDao;
import com.baya.baya_project.Dao.RolePermissionDao;
import com.baya.baya_project.Dao.mapper.PermissionsDao;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class RolePermissionService {
    RolePermissionDao dao = new RolePermissionDao();
    PermissionsDao permissionsDao;
    RoleDao roleDao = new RoleDao();
    public RolePermissionService() {
        dao = new RolePermissionDao();
        permissionsDao = new PermissionsDao();
    }

    public int insertRolePermission(HashMap<Integer, List<Integer>> map, String roleName) {
        int result = 0;
        for (Integer key : map.keySet()) {
            System.out.println("key: " + key + " value: " + map.get(key));

            List<Integer> list = map.get(key);
            for (int value : list) {
                int permissionID = permissionsDao.getPermissionID(key, value);
                if (permissionID == -1) {
                    return -1;
                }
                result+= dao.insert(roleDao.getRoleIdByName(roleName), permissionID);

            }
        }
        return result;
    }

    public HashMap<Integer, List<Integer>> loadMap( JSONObject json) {
        HashMap<Integer, List<Integer>> map = new HashMap<>();
        for (String key : json.keySet()) {
            JSONArray array = json.getJSONArray(key);
            List<Integer> list = new ArrayList<>();
            for (int i = 0; i < array.length(); i++) {
                list.add(array.getInt(i));
            }
            map.put(Integer.parseInt(key), list);
        }
        return map;
    }



    public static void main(String[] args) {

        RolePermissionService service = new RolePermissionService();

    }


}
