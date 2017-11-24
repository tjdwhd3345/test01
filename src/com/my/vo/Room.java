package com.my.vo;

public class Room {
    private int no;
    private int hotel_no;
    private String name;
    private int beds;
    private String price;
    private String img;
    
    
    
    public Room() {
        
    }
    public Room(int no, int hotel_no, String name, int beds, String price) {
        super();
        this.no = no;
        this.hotel_no = hotel_no;
        this.name = name;
        this.beds = beds;
        this.price = price;
    }
    
    
    public String getImg() {
        return img;
    }
    public void setImg(String img) {
        this.img = img;
    }
    public int getNo() {
        return no;
    }
    public void setNo(int no) {
        this.no = no;
    }
    public int getHotel_no() {
        return hotel_no;
    }
    public void setHotel_no(int hotel_no) {
        this.hotel_no = hotel_no;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getBeds() {
        return beds;
    }
    public void setBeds(int beds) {
        this.beds = beds;
    }
    public String getPrice() {
        return price;
    }
    public void setPrice(String price) {
        this.price = price;
    }
    
    
}
