package com.baya.baya_project.Handle;

public class ConstantsFB {
    public static final String FACEBOOK_CLIENT_ID = "1107088940891688";

    public static final String FACEBOOK_CLIENT_SECRET =
            "525709f589cceb5e067bdbdd883451c2";


    public static final String FACEBOOK_REDIRECT_URI =
            "http://localhost:8080/loginFacebookHandler";

    public static final String FACEBOOK_LINK_GET_TOKEN =
            "https://graph.facebook.com/v20.0/oauth/access_token";

    public static final String FACEBOOK_LINK_GET_USER_INFO =
            "https://graph.facebook.com/me?fields=id,name,email,picture&access_token=";
}
