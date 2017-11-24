package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.my.sql.MyConnection;
import com.my.vo.Room;

public class RoomDAO {
    public RoomDAO() {
        
    }
    
    
    public List<Room> selectRoom(String hotelno) {
        Room r=null;
        List<Room> list=new ArrayList<Room>();
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        String select="select no, hotel_no, name, bed, FORMAT(price, 0) AS price from rooms where hotel_no=?";
        
        try {
            con=MyConnection.getConnection();
            pstmt=con.prepareStatement(select);
            pstmt.setInt(1, Integer.parseInt(hotelno));
            rs=pstmt.executeQuery();
            
            while(rs.next()) {
                r=new Room(
                rs.getInt("no"),
                rs.getInt("hotel_no"),
                rs.getString("name"),
                rs.getInt("bed"),
                rs.getString("price")
                );
                list.add(r);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MyConnection.close(pstmt, con, rs);
        }
        
        return list;
    }
    public List<Room> getImg(String hotelno) {
        List<Room> list=new ArrayList<Room>();
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        String selectSQL="select * from room_imgs where hotel_no=?";
        try {
            con=MyConnection.getConnection();
            pstmt=con.prepareStatement(selectSQL);
            pstmt.setInt(1, Integer.parseInt(hotelno));
            rs=pstmt.executeQuery();
            while(rs.next()) {
                Room r=new Room();
                r.setNo(rs.getInt("room_no"));
                r.setImg(rs.getString("img"));
                list.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MyConnection.close(pstmt, con, rs);
        }
        
        return list;
    }
}
