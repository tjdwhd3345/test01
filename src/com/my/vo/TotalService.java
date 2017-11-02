package com.my.vo;

public class TotalService {
    private int serviceno;
    private String name;
    private String service;
    
    
    public TotalService() {
    }
    public TotalService(int serviceno, String name, String service) {
        this.serviceno = serviceno;
        this.name = name;
        this.service = service;
    }


    public int getServiceno() {
        return serviceno;
    }
    public void setServiceno(int serviceno) {
        this.serviceno = serviceno;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getService() {
        return service;
    }
    public void setService(String service) {
        this.service = service;
    }
}
