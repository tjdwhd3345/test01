package com.my.vo;

public class HotelList {
    private String rowNum;
    private String bplcNm;
    private String siteWhlAddr;
    private String rdnWhlAddr;
    
    
    public HotelList() {
        
    }
    public HotelList(String rowNum, String bplcNm, String siteWhlAddr, String rdnWhlAddr) {
        this.rowNum = rowNum;
        this.bplcNm = bplcNm;
        this.siteWhlAddr = siteWhlAddr;
        this.rdnWhlAddr = rdnWhlAddr;
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
