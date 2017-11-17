package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.my.sql.MyConnection;
import com.my.vo.Reserve;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

public class ReserveDAO {
    public ReserveDAO() {}
    
    
    //예약 추가
    public Reserve addReserve(Reserve r) throws SQLException  {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        int insertId=0;
        Reserve re=new Reserve();
        
        String insertSQL="INSERT INTO book (book_email, book_name, book_hotel, book_room, check_in, check_out, book_price, reserve_date, status) VALUES(?,?,?,?,?,?,?, now(), 2)";
        String lastSQL="SELECT last_insert_id()";
        String selectSQL="SELECT book.no, hotel.name, book.book_price, check_in, check_out FROM book " + 
                "JOIN hotel " + 
                "ON book.book_hotel = hotel.no " + 
                "JOIN rooms " + 
                "ON book.book_room = rooms.no " + 
                "WHERE book.no=?";
        try {
            con=MyConnection.getConnection();
            con.setAutoCommit(false);   //자동커밋 해제
            
            pstmt=con.prepareStatement(insertSQL);
            pstmt.setString(1, r.getBookemail());   //예약자 이메일
            pstmt.setString(2, r.getBookname());    //예약자 이름
            pstmt.setInt(3, r.getHotelno());    //예약 호텔번호
            pstmt.setInt(4, r.getRoomno()); //예약 방번호
            pstmt.setString(5, r.getCheckIn()); //예약 체크인
            pstmt.setString(6, r.getCheckOut());    //예약 체크아웃
            pstmt.setInt(7, r.getPrice());  //예약 금액
            pstmt.executeUpdate();
            
            pstmt=con.prepareStatement(lastSQL);  //방금 들어간놈 아이디 받아오기
            rs=pstmt.executeQuery();
            rs.next();
            insertId=rs.getInt(1);
            
            pstmt=con.prepareStatement(selectSQL);  //방금 추가한 예약객체 생성?설정?
            pstmt.setInt(1, insertId);
            rs=pstmt.executeQuery();
            rs.next();
            re.setBookno(rs.getInt("book.no"));
            re.setHotelname(rs.getString("hotel.name"));
            re.setPrice(rs.getInt("book.book_price"));
            re.setCheckIn(rs.getString("check_in"));
            re.setCheckOut(rs.getString("check_out"));
            
            con.commit();
        } catch (MySQLIntegrityConstraintViolationException e) {
            con.rollback();
            throw new MySQLIntegrityConstraintViolationException();
        } catch (Exception e) {
            e.printStackTrace();
            con.rollback();
        } finally {
            MyConnection.close(pstmt, con);
        }
        return re;   //방금 예약한 객체 반환
        
    }
    
    //사용자 email로 예약확인
    public List<Reserve> selectReserve(String email) {
    	Connection con=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	
    	List<Reserve> rList=new ArrayList<Reserve>();
    	
    	String selectSQL="SELECT book.no, hotel.no, hotel.name, check_in, check_out, reserve_date, book.status, book_status.status FROM book" + 
    			" JOIN hotel" + 
    			" ON book.book_hotel = hotel.no" + 
    			" JOIN book_status" + 
    			" ON book.status = book_status.num" +
    			" WHERE book.book_email = ?" + 
    			" ORDER BY check_in";
    	
    	try {
			con=MyConnection.getConnection();
			pstmt=con.prepareStatement(selectSQL);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reserve r=new Reserve();
				r.setBookno(rs.getInt("book.no"));
				r.setHotelname(rs.getString("hotel.name"));   //예약 호텔이름
				r.setHotelno(rs.getInt("hotel.no"));	//예약 호텔 번호
				r.setCheckIn(rs.getString("check_in"));	//체크인 날짜
				r.setCheckOut(rs.getString("check_out"));	//체크아웃 날짜
				r.setReservedate(rs.getDate("reserve_date"));
				r.setStatus(rs.getInt("book.status"));
				r.setString_status(rs.getString("book_status.status")); //예약상태
				rList.add(r);
			}
			/*if(rList == null) {
				throw new Exception();
			}*/
			
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
    	return rList;	
    }
    
    //예약번호로 예약리턴
    public Reserve getReserve(int bookno) {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        Reserve r=new Reserve();
        
        String selectSQL="SELECT b.book_name, r.name, b.book_hotel, b.book_room FROM rooms r " + 
                "JOIN book b " + 
                "ON b.book_room = r.no " + 
                "WHERE b.no=?";
        try {
            con=MyConnection.getConnection();
            pstmt=con.prepareStatement(selectSQL);
            pstmt.setInt(1, bookno);
            rs=pstmt.executeQuery();
            rs.next();
            r.setBookname(rs.getString("b.book_name")); //예약자이름
            r.setHotelname(rs.getString("r.name")); //예약방이름, 임시방편..ㅎ    
            r.setHotelno(rs.getInt("b.book_hotel"));    //예약호텔번호
            r.setRoomno(rs.getInt("b.book_room"));  //예약방번호
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }
}
