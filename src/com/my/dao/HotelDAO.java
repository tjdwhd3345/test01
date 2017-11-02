package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.my.sql.MyConnection;
import com.my.vo.Hotel;

public class HotelDAO {
    public HotelDAO() {}
    
    public void addHotel(Hotel hotel) throws Exception {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        String insertSQL="insert into hotel (name, location, score) values(?, ?, ?)";
        String selectSQL="select last_insert_id()";
        String insertInfoSQL="insert into hotel_info values(?, ?)";
        String insertServiceSQL="insert into hotel_service values(?,?)";
        try {
            con=MyConnection.getConnection();
            //con.setAutoCommit(false);   //오토커밋 해제
            
            pstmt=con.prepareStatement(insertSQL);
            pstmt.setString(1, hotel.getName());
            pstmt.setString(2, hotel.getLocation());
            pstmt.setFloat(3, hotel.getScore());
            pstmt.executeUpdate();
            
            /*
            pstmt=con.prepareStatement(selectSQL);
            rs=pstmt.executeQuery();
            rs.next();
            int num=rs.getInt(1);
            
            pstmt=con.prepareStatement(insertInfoSQL);
            pstmt.setInt(1, num);
            pstmt.setString(2, hotel.getInfo());
            pstmt.executeUpdate();
            
            pstmt=con.prepareStatement(insertServiceSQL);
            pstmt.setInt(1, num);
            pstmt.setString(2, hotel.getService());
            pstmt.executeUpdate();
            */
            
            //con.commit();
        } catch (Exception e) {
            e.printStackTrace();
            //con.rollback();
        } finally {
            MyConnection.close(pstmt, con);
        }
    }
    public Hotel selectByNo(String hotelno) {
        
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        Hotel h=new Hotel();
        
        String selectNo="select * from hotel where no=?";
        
        try {
            con=MyConnection.getConnection();
            pstmt=con.prepareStatement(selectNo);
            pstmt.setString(1, hotelno);
            rs=pstmt.executeQuery();
            if(rs.next()) {
                h.setScore(rs.getFloat("score"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MyConnection.close(pstmt, con, rs);
        }
        
        
        return h;
    }
}
