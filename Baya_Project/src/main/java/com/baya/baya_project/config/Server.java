package com.baya.baya_project.config;

public class Server {
    private String serverName;
    public Server() {
        serverName = "http://localhost:8080";
    }

    public String getServerName() {
        return serverName;
    }

    public void setServerName(String serverName) {
        this.serverName = serverName;
    }

    @Override
    public String toString() {
        return "Server{" +
                "serverName='" + serverName + '\'' +
                '}';
    }

    public static void main(String[] args) {
        Server serverName = new Server();
        System.out.println(serverName.getServerName());
    }
}
