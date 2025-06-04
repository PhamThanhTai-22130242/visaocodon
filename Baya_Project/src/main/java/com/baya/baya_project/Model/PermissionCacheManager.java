package com.baya.baya_project.Model;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ConcurrentSkipListSet;

public class PermissionCacheManager {

    private static final ConcurrentMap<Integer, Set<String>> userPermissionsMap = new ConcurrentHashMap<>();

    private static final Set<Integer> invalidatedUsers = new ConcurrentSkipListSet<>();
    //Gán danh sách quyền permissions cho người dùng userId khi đăng nhập
    public static void setPermissionsForUser(int userId, Set<String> permissions) {
        userPermissionsMap.put(userId, permissions);
    }
    //Trả về danh sách quyền của userId. Nếu không có, trả về Set.of() (tập rỗng, immutable).

    public static Set<String> getPermissionsForUser(int userId) {
        return userPermissionsMap.getOrDefault(userId, Set.of());
    }
//Đánh dấu người dùng là đã bị vô hiệu hóa cache quyền và xóa quyền của họ khỏi userPermissionsMap
    public static void invalidateUser(int userId) {
        invalidatedUsers.add(userId);
        userPermissionsMap.remove(userId);
    }
//Kiểm tra xem userId có bị đánh dấu cần cập nhật lại quyền hay không.
    public static boolean isUserInvalidated(int userId) {
        return invalidatedUsers.contains(userId);
    }
//Gỡ bỏ trạng thái invalid của người dùng, nghĩa là họ đã được cập nhật quyền xong.
    public static void validateUser(int userId) {
        invalidatedUsers.remove(userId);
    }

}
