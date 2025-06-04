package com.baya.baya_project.Handle;

public class AccountFB {
    private String id;
    private String name;
    private String email;

    public AccountFB(String id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }
    public AccountFB() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "AccountFB{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
