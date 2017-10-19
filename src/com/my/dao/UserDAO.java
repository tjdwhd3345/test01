package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.my.exception.DuplicatedException;
import com.my.exception.FindException;
import com.my.sql.MyConnection;
import com.my.vo.User;

public class UserDAO {

    public UserDAO() {}
    
    public void addUser(User user) throws Exception {
        Connection con=null;
        PreparedStatement pstmt=null;
        
        try {
        con=MyConnection.getConnection();
        
        String insertSQL="insert into users values(?, ?, ?, ?)";
        pstmt=con.prepareStatement(insertSQL);
        pstmt.setString(1, user.getEmail());
        pstmt.setString(2, user.getPwd());
        pstmt.setString(3, user.getName());
        pstmt.setString(4, user.getTel());
        System.out.println("들어가라");
        
        pstmt.executeUpdate();
        } finally {
            MyConnection.close(pstmt, con);
        }
    }
    public User selectUser(String email) throws FindException {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        try {
            con=MyConnection.getConnection();
            
            String selectSQL="select * from users where email=?";
            pstmt=con.prepareStatement(selectSQL);
            pstmt.setString(1, email);
            rs=pstmt.executeQuery();
            System.out.println(rs.next());
            //if(rs.next()) {
            //rs.next();
            System.out.println(rs.getString("email"));
            System.out.println(rs.getString("pwd"));
            System.out.println(rs.getString("name"));
            System.out.println(rs.getString("tel"));
            User user=new User(
                rs.getString("email"),
                rs.getString("pwd"),
                rs.getString("name")
                //rs.getString("tel")
            );
            return user; 
            //}
        } catch(Exception e) {
            e.printStackTrace();
            throw new FindException("아이디 또는 비밀번호를 확인해주세요.");
        } finally {
            MyConnection.close(pstmt, con, rs);
        }
    }
}