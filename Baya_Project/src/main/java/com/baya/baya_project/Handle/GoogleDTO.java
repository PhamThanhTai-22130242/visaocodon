package com.baya.baya_project.Handle;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.hc.client5.http.ClientProtocolException;
import org.apache.hc.client5.http.fluent.Request;
import org.apache.hc.client5.http.fluent.Form;
import java.io.IOException;


public class GoogleDTO {


//    public  String getToken(String code) throws ClientProtocolException, IOException {
//        // call api to get token
//        String response = Request.post(Constants.GOOGLE_LINK_GET_TOKEN)
//                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
//                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
//                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
//                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
//                .execute().returnContent().asString();
//
//        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
//        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
//        return accessToken;
//    }
//    public static GoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
//        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
//        String response = Request.get(link).execute().returnContent().asString();
//
//        GoogleDTO googlePojo = new Gson().fromJson(response, GoogleDTO.class);
//
//        return googlePojo;
//    }
    public  AccountGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {

        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;

        String response = Request.get(link).execute().returnContent().asString();

        AccountGoogle googlePojo = new Gson().fromJson(response, AccountGoogle.class);

        return googlePojo;

    }
    public  String getToken(String code) throws ClientProtocolException, IOException {

        String response = Request.post(Constants.GOOGLE_LINK_GET_TOKEN)

                .bodyForm(

                        Form.form()

                                .add("client_id", Constants.GOOGLE_CLIENT_ID)

                                .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)

                                .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI)

                                .add("code", code)

                                .add("grant_type", Constants.GOOGLE_GRANT_TYPE)

                                .build()

                )

                .execute().returnContent().asString();



        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);

        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");

        return accessToken;

    }




}
