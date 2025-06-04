package com.baya.baya_project.service;

import java.util.Random;

public class RandomTokens {
    private static int LENGHT = 60;
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    public String generateToken() {
        Random rand = new Random();
        StringBuilder token = new StringBuilder(LENGHT);
        for (int i = 0; i < LENGHT; i++) {
            token.append(CHARACTERS.charAt(rand.nextInt(CHARACTERS.length())));
        }
        return token.toString();
    }

    public static void main(String[] args) {
        RandomTokens randomTokens = new RandomTokens();
        System.out.println(randomTokens.generateToken());

    }
}
