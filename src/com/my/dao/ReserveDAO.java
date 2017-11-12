package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.my.sql.MyConnection;
import com.my.vo.Reserve;

public class ReserveDAO {
    public ReserveDAO() {}
    
    public void addReserve(Reserve r) {
        Connection con=null;
        PreparedStatement pstmt=null;
        
        String insertSQL="insert into book (book_email, book_name, book_hotel, book_room, check_in, check_out, book_price) values(?,?,?,?,?,?,?)";
        
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
    
    public List<Reserve> selectReserve(String email) {
    	Connection con=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	
    	List<Reserve> rList=new ArrayList<Reserve>();
    	
    	String selectSQL="select hotel.no, hotel.name, check_in, check_out from book" + 
    			" join hotel" + 
    			" on book.book_hotel = hotel.no" + 
    			" where book.book_email = ?" + 
    			" order by check_in";
    	
    	try {
			con=MyConnection.getConnection();
			pstmt=con.prepareStatement(selectSQL);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reserve r=new Reserve();
				r.setHotelno(rs.getInt("no"));	//예약 호텔 번호
				r.setCheckIn(rs.getString("check_in"));	//체크인 날짜
				r.setCheckOut(rs.getString("check_out"));	//체크아웃 날짜
				rList.add(r);
			}
			/*if(rList == null) {
				throw new Exception();
			}*/
			return rList;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(pstmt, con, rs);
		}
    	/* 
    	 * return 타입이 있을 때 return null을 안 해주면 자꾸 컴파일 오류가 난다.
    	 * try안에서 예외가 발생할 수도 있기 때문에 그런 것 같은데
    	 * 이걸 내가 임의로 catch할 수 있지 않을까??
    	 */
    	return null;	
    }
}
