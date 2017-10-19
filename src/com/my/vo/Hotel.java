package com.my.vo;

public class Hotel {
    private int no;
    private String name;
    private String location;
    private float score;
    private String info;
    private String service;
    
    public Hotel(int no, String name, String location, String info, String service) {
        this.no = no;
        this.name = name;
        this.location = location;
        this.score = 0;
        this.info = info;
        this.service = service;
    }
    public Hotel(int no, String name, String location, String info) {
        this.no = no;
        this.name = name;
        this.location = location;
        this.score=0;
        this.info=info;
    }
    public Hotel(int no, String name, String location, float score, String info) {
        this(no, name, location, info);
        this.score = score;
    }
    
    public String getService() {
        return service;
    }
    public void setService(String service) {
        this.service = service;
    }
    public String getInfo() {
        return info;
    }
    public void setInfo(String info) {
        this.info = info;
    }
    public int getNo() {
        return no;
    }
    public void setNo(int no) {
        this.no = no;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
    public float getScore() {
        return score;
    }
    public void setScore(float score) {
        this.score = score;
    }
}
