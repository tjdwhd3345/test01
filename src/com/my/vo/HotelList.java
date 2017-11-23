package com.my.vo;

public class HotelList {
    private String rowNum;
    private String bplcNm;
    private String siteWhlAddr;
    private String rdnWhlAddr;
    private String x;
    private String y;
    private String img;
    
    public HotelList() {
        
    }
    public HotelList(String rowNum, String bplcNm, String siteWhlAddr, String rdnWhlAddr) {
        this.rowNum = rowNum;
        this.bplcNm = bplcNm;
        this.siteWhlAddr = siteWhlAddr;
        this.rdnWhlAddr = rdnWhlAddr;
    }
    public HotelList(String rowNum, String bplcNm, String siteWhlAddr, String rdnWhlAddr, String x, String y) {
        this.rowNum = rowNum;
        this.bplcNm = bplcNm;
        this.siteWhlAddr = siteWhlAddr;
        this.rdnWhlAddr = rdnWhlAddr;
        this.x = x;
        this.y = y;
    }
    
    
    
    public String getImg() {
        return img;
    }
    public void setImg(String img) {
        this.img = img;
    }
    public String getX() {
        return x;
    }
    public void setX(String x) {
        this.x = x;
    }
    public String getY() {
        return y;
    }
    public void setY(String y) {
        this.y = y;
    }
    public String getRowNum() {
        return rowNum;
    }
    public void setRowNum(String rowNum) {
        this.rowNum = rowNum;
    }
    public String getBplcNm() {
        return bplcNm;
    }
    public void setBplcNm(String bplcNm) {
        this.bplcNm = bplcNm;
    }
    public String getSiteWhlAddr() {
        return siteWhlAddr;
    }
    public void setSiteWhlAddr(String siteWhlAddr) {
        this.siteWhlAddr = siteWhlAddr;
    }
    public String getRdnWhlAddr() {
        return rdnWhlAddr;
    }
    public void setRdnWhlAddr(String rdnWhlAddr) {
        this.rdnWhlAddr = rdnWhlAddr;
    }
    
    
}
