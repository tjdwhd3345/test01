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
        
        String insertSQL="insert into users (email, pwd, name, tel) values(?, ?, ?, ?)";
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
            /*System.out.println(rs.getString("email"));
            System.out.println(rs.getString("pwd"));
            System.out.println(rs.getString("name"));
            System.out.println(rs.getString("tel"));*/
            User user=new User(
                rs.getString("email"),
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
    
    public User selectUserByNaver(User u) {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        User user=null;
        
        String selectSQL="SELECT u.email, u.name, su.sns_email, su.sns_name " + 
                "FROM users u, sns_users su " + 
                "WHERE u.id=su.id " + 
                "AND su.sns_email=?"; 
        try {
            con=MyConnection.getConnection();
            pstmt=con.prepareStatement(selectSQL);
            pstmt.setString(1, u.getEmail());   //sns email로 검색
            rs=pstmt.executeQuery();
            if(rs.next()) {    //검색된 결과가 있으면=sns로 로그인한 적이 있으면
                user=new User(rs.getString("su.sns_email"), rs.getString("su.sns_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MyConnection.close(pstmt, con, rs);
        }
        return user;
    }
    
    public void addUserByNaver(User u) throws SQLException{
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        String insertUsersSQL="INSERT INTO users (email, name) VALUES (?,?)";
        String selectLastSQL="SELECT LAST_INSERT_ID()";
        String insertSQL="INSERT INTO sns_users (id, sns_id, sns_email, sns_name, sns_con_date) VALUES (?,?,?,?, now())";
        try {
            con=MyConnection.getConnection();
            con.setAutoCommit(false);
            
            pstmt=con.prepareStatement(insertUsersSQL);
            pstmt.setString(1, u.getEmail());
            pstmt.setString(2, u.getName());
            pstmt.executeUpdate();
            
            pstmt=con.prepareStatement(selectLastSQL);
            rs=pstmt.executeQuery();
            rs.next();
            
            pstmt=con.prepareStatement(insertSQL);
            pstmt.setString(1, rs.getString(1));
            pstmt.setString(2, u.getId());
            pstmt.setString(3, u.getEmail());
            pstmt.setString(4, u.getName());
            pstmt.executeUpdate();
            
            con.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            con.rollback();
        } finally {
            MyConnection.close(pstmt, con, rs);
        }
    }
}