package com.my.vo;

import java.math.BigDecimal;
import java.util.Date;

public class Review {
    private String reviewname;
    private int hotelnum;
    private int roomnum;
    private String content;
    private String score;
    private Date reviewdate;
    private String reviewemail;
    private String roomname;
    
    public Review() { }
    
    public Review(String reviewemail,String reviewname, int hotelnum, int roomnum, String content, String score) {
        this.reviewemail = reviewemail;
        this.reviewname = reviewname;
        this.hotelnum = hotelnum;
        this.roomnum = roomnum;
        this.content = content;
        this.score = score;
    }
    public Review(String reviewname, String roomname, String content, String score, Date reviewdate) {
        this.reviewname = reviewname;
        this.roomname = roomname;
        this.content = content;
        this.score = score;
        this.reviewdate = reviewdate;
    }
    public Review(String reviewname, int hotelnum, int roomnum, String content, String score, Date reviewdate, String reviewemail, String roomname) {
        this.reviewname = reviewname;
        this.hotelnum = hotelnum;
        this.roomnum = roomnum;
        this.content = content;
        this.score = score;
        this.reviewdate = reviewdate;
        this.reviewemail = reviewemail;
        this.roomname = roomname;
    }

    public String getReviewname() {
        return reviewname;
    }
    public void setReviewname(String reviewname) {
        this.reviewname = reviewname;
    }
    public String getReviewemail() {
        return reviewemail;
    }
    public void setReviewemail(String reviewemail) {
        this.reviewemail = reviewemail;
    }
    public String getRoomname() {
        return roomname;
    }
    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }
    public String getScore() {
        return score;
    }
    public void setScore(String score) {
        this.score = score;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Date getReviewdate() {
        return reviewdate;
    }
    public void setReviewdate(Date reviewdate) {
        this.reviewdate = reviewdate;
    }
    public int getHotelnum() {
        return hotelnum;
    }
    public void setHotelnum(int hotelnum) {
        this.hotelnum = hotelnum;
    }
    public int getRoomnum() {
        return roomnum;
    }
    public void setRoomnum(int roomnum) {
        this.roomnum = roomnum;
    }
    
    
}
