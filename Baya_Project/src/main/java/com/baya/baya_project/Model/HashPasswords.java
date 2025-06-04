package com.baya.baya_project.Model;


import org.mindrot.jbcrypt.BCrypt;

public class HashPasswords {
    public HashPasswords() {

    }
    public static String hashPassword(String pass){
        return BCrypt.hashpw(pass, BCrypt.gensalt());
    }

    public static boolean checkPassword(String pass, String hash){
        return BCrypt.checkpw(pass, hash);
    }

    public static void main(String[] args) {
        HashPasswords hp = new HashPasswords();

        System.out.println(hp.hashPassword("nguyenvanvang25122004"));
//         System.out.println(  hp.checkPassword("thanhtaipham113456", "$2a$10$gcXK.Q4Wr7Rne/kjZ0MuL.v2i5OQnqJFE8RW1YTA/0ReutHISHEF.")
//       );

    }

}
