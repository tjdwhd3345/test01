package com.my.vo;

import java.util.List;

public class Hotel {
    private int no;
    private String name;
    private String location;
    private String score;
    private String info;
    private String service;
    private String img;
    private List<String> imgs;
    private String price;
    
    public Hotel() {
        
    }
    public Hotel(int no, String name, String location, String score) {
        this.no = no;
        this.name = name;
        this.location = location;
        this.score = score;
    }
    public Hotel(int no, String name, String location, String info, String service) {
        this.no = no;
        this.name = name;
        this.location = location;
        this.score = "";
        this.info = info;
        this.service = service;
    }
    
    
    public String getPrice() {
        return price;
    }
    public void setPrice(String price) {
        this.price = price;
    }
    public String getImg() {
        return img;
    }
    public void setImg(String img) {
        this.img = img;
    }
    public List<String> getImgs() {
        return imgs;
    }
    public void setImgs(List<String> imgs) {
        this.imgs = imgs;
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
    public String getScore() {
        return score;
    }
    public void setScore(String score) {
        this.score = score;
    }
}
