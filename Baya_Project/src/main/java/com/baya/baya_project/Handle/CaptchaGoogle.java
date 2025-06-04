package com.baya.baya_project.Handle;

import org.json.JSONObject;

import javax.net.ssl.HttpsURLConnection;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;

public class CaptchaGoogle {
    private static String  SESCETKEY = "6Lcg_gorAAAAAG2R8siHmJhxMmwJtw0Ih6igRg0O";

    private static String URL = "https://www.google.com/recaptcha/api/siteverify";

    public    boolean getCaptcha(String userResponse) throws IOException {
        String params = "secret=" + SESCETKEY + "&response=" + userResponse;
        URL obj = new URL(URL);
        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();


        con.setRequestMethod("POST");
        con.setDoOutput(true);
        OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
        writer.write(params);
        writer.flush();
        writer.close();

        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        JSONObject jsonObject = new JSONObject(response.toString());
        return jsonObject.getBoolean("success");

    }

    public static void main(String[] args) throws IOException {
        System.out.println(new CaptchaGoogle().getCaptcha("AauSC8ChPqbD5aOkGMRPqbXP1z4r2M1K3hgL9XQQXwdDywU0V"));
    }
}
