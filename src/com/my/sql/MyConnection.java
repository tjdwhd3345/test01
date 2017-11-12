package com.my.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MyConnection {
    public static Connection getConnection() throws SQLException{
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        
        Connection con=null;
        //url:"프로토콜:사용db:호스트:포트/DB명
        //user:사용자계정
        //password:계정 비밀번호
        //String url="jdbc:mysql://192.168.0.141:3306/mydb3?useUnicode=true&characterEncoding=utf8";
        String url="jdbc:mysql://218.153.215.249:3306/mydb3?useUnicode=true&characterEncoding=utf8";
        String user="mo";
        String password="1234";
        con=DriverManager.getConnection(url, user, password);
        
        return con;
    }
    
    public static void close(Statement stmt, Connection con){
        if(stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                
            }
        }
        if(con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                
            }
        }
    }
    public static void close(Statement stmt, Connection con, ResultSet rs) {
        if(rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
            
            }
        }
        close(stmt, con);
    }
}
