package com.my.vo;

import java.util.Date;

public class Reserve {
    private int bookno;
    private String bookemail;
    private String bookname;
    private int hotelno;
    private int roomno;
    private String checkIn;
    private String checkOut;
    private int price;
    private String hotelname;
    private Date reservedate;
    private int status;
    private String string_status;
    
    public Reserve() {
        
    }
    public Reserve(String bookemail, String bookname, int hotelno, int roomno, String checkIn, String checkOut, int price) {
        this.bookemail = bookemail;
        this.bookname = bookname;
        this.hotelno = hotelno;
        this.roomno = roomno;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.price = price;
    }
    public Reserve(int bookno, String bookemail, String bookname, int hotelno, int roomno, String checkIn, String checkOut, int price) {
        this.bookno = bookno;
        this.bookemail = bookemail;
        this.bookname = bookname;
        this.hotelno = hotelno;
        this.roomno = roomno;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.price = price;
    }
    
    
    public String getString_status() {
        return string_status;
    }
    public void setString_status(String string_status) {
        this.string_status = string_status;
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public Date getReservedate() {
        return reservedate;
    }
    public void setReservedate(Date reservedate) {
        this.reservedate = reservedate;
    }
    public String getHotelname() {
        return hotelname;
    }
    public void setHotelname(String hotelname) {
        this.hotelname = hotelname;
    }
    public int getBookno() {
        return bookno;
    }
    public void setBookno(int bookno) {
        this.bookno = bookno;
    }
    public String getBookemail() {
        return bookemail;
    }
    public void setBookemail(String bookemail) {
        this.bookemail = bookemail;
    }
    public String getBookname() {
        return bookname;
    }
    public void setBookname(String bookname) {
        this.bookname = bookname;
    }
    public int getHotelno() {
        return hotelno;
    }
    public void setHotelno(int hotelno) {
        this.hotelno = hotelno;
    }
    public int getRoomno() {
        return roomno;
    }
    public void setRoomno(int roomno) {
        this.roomno = roomno;
    }
    public String getCheckIn() {
        return checkIn;
    }
    public void setCheckIn(String checkIn) {
        this.checkIn = checkIn;
    }
    public String getCheckOut() {
        return checkOut;
    }
    public void setCheckOut(String checkOut) {
        this.checkOut = checkOut;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    
    
}
