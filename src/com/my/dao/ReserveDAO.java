package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.my.sql.MyConnection;
import com.my.vo.Reserve;

public class ReserveDAO {
    public ReserveDAO() {}
    
    public void addReserve(Reserve r) {
        Connection con=null;
        PreparedStatement pstmt=null;
        
        String insertSQL="insert into book (book_email, book_name, book_hotel, book_room, check_in, check)out, book_price) values(0, ?,?,?,?,?,?,?)";
        
        try {
            con=MyConnection.getConnection();
            pstmt=con.prepareStatement(insertSQL);
            pstmt.setString(1, r.getBookemail());   //예약자 이메일
            pstmt.setString(2, r.getBookname());    //예약자 이름
            pstmt.setInt(3, r.getHotelno());    //예약 호텔번호
            pstmt.setInt(4, r.getRoomno()); //예약 방번호
            pstmt.setString(5, r.getCheckIn()); //예약 체크인
            pstmt.setString(6, r.getCheckOut());    //예약 체크아웃
            pstmt.setInt(7, r.getPrice());  //예약 금액
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MyConnection.close(pstmt, con);
        }
    }
}
