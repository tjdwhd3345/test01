package com.my.vo;

public class User {
    
    private String email;
    private String pwd;
    private String name;
    private String tel;
    private String id;
    
    public User(String email, String name) {
        this.email = email;
        this.name = name;
    }
    public User(String email, String name, String id) {
        this.email = email;
        this.name = name;
        this.id = id;
    }
    public User(String email, String pwd, String name, String tel) {
        this.email = email;
        this.pwd = pwd;
        this.name = name;
        this.tel = tel;
    }

    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPwd() {
        return pwd;
    }
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getTel() {
        return tel;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }
     
}
