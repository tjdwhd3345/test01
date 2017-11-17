package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.my.sql.MyConnection;
import com.my.vo.Review;

public class ReviewDAO {
    public ReviewDAO() {}
    
    //이용후기 추가
    public void addReview(Review rv) throws SQLException {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        String insertSQL="INSERT INTO hotel_review "
                + "(review_name, review_hotel, review_room, content, score, review_date) "
                + "VALUES (?,?,?,?,?,now())";
        
        String updateSQL="UPDATE hotel SET score = "
                + "(SELECT avg(score) AS avg FROM hotel_review WHERE review_hotel=?) "
                + "WHERE no=?";
        try {
            con=MyConnection.getConnection();
            con.setAutoCommit(false);
            
            pstmt=con.prepareStatement(insertSQL);
            pstmt.setString(1, rv.getReviewname());  //리뷰작성자 이름
            pstmt.setInt(2, rv.getHotelnum()); //리뷰호텔번호
            pstmt.setInt(3, rv.getRoomnum()); //리뷰방번호
            pstmt.setString(4, rv.getContent());  //리뷰내용
            pstmt.setString(5, rv.getScore());    //리뷰평점
            pstmt.executeUpdate();
            
            pstmt=con.prepareStatement(updateSQL);
            pstmt.setInt(1, rv.getHotelnum());
            pstmt.setInt(2, rv.getHotelnum());
            pstmt.executeUpdate();
            
            con.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            con.rollback();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyConnection.close(pstmt, con, rs);
        }
    }
    
    //호텔번호로 이용후기 가져오기
    public List<Review> selectAllReview(String hotelnum) {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        List<Review> rvList=new ArrayList<Review>();
        
        String selectSQL="SELECT re.review_name, b.book_email, ro.name, score, content, review_date FROM hotel_review re " + 
                "JOIN book b " + 
                "ON re.review_room = b.book_room " + 
                "JOIN rooms ro " + 
                "ON re.review_room = ro.no " + 
                "WHERE re.review_hotel = ? ";
        try {
            con=MyConnection.getConnection();
            pstmt=con.prepareStatement(selectSQL);
            pstmt.setString(1, hotelnum);
            rs=pstmt.executeQuery();
            while(rs.next()) {
                Review rv=new Review(
                        rs.getString("re.review_name"), 
                        rs.getString("b.book_email"),
                        rs.getString("ro.name"),
                        rs.getString("content"),
                        rs.getString("score"),
                        rs.getDate("review_date"));
                rvList.add(rv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return rvList;
    }
}
