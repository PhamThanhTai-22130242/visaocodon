package com.baya.baya_project.Handle;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.hc.client5.http.ClientProtocolException;
import org.apache.hc.client5.http.fluent.Request;
import org.apache.hc.client5.http.fluent.Form;
import java.io.IOException;
public class FacebookDTO {
    public  String getToken(String code) throws ClientProtocolException, IOException
    {

        String response = Request.post(ConstantsFB.FACEBOOK_LINK_GET_TOKEN)

                .bodyForm(

                        Form.form()

                                .add("client_id", ConstantsFB.FACEBOOK_CLIENT_ID)

                                .add("client_secret", ConstantsFB.FACEBOOK_CLIENT_SECRET)

                                .add("redirect_uri", ConstantsFB.FACEBOOK_REDIRECT_URI)

                                .add("code", code)

                                .build()

                )

                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);

        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");

        return accessToken;

    }


    public  AccountFB getUserInfo(final String accessToken) throws ClientProtocolException,
            IOException {

        String link = ConstantsFB.FACEBOOK_LINK_GET_USER_INFO + accessToken;

        String response = Request.get(link).execute().returnContent().asString();

        AccountFB fbAccount= new Gson().fromJson(response, AccountFB .class);

        return fbAccount;

    }
}
