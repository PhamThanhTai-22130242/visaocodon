package com.baya.baya_project.Model;

import org.mindrot.jbcrypt.BCrypt;

public class HashTokens {

    public static String hashTokens(String tokens){
        return BCrypt.hashpw(tokens, BCrypt.gensalt());
    }
    public static boolean checkTokens(String pass, String hash){
        return BCrypt.checkpw(pass, hash);
    }

    public static void main(String[] args) {


    }
}
