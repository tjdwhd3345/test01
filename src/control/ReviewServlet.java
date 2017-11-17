package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.dao.ReviewDAO;
import com.my.vo.Review;

/**
 * Servlet implementation class ReviewServlet
 */
public class ReviewServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //한글인코딩
	    request.setCharacterEncoding("utf-8");
	    
	    String reviewname=request.getParameter("reviewname");    //작성자이름
	    String hotelnum=request.getParameter("reviewhotel");   //리뷰호텔번호
	    String roomnum=request.getParameter("reviewroom");    //리뷰방번호
	    String content=request.getParameter("content");   //리뷰내용
	    String score=request.getParameter("score"); //평점
	    
	    Review rv=new Review(
	            reviewname,
	            Integer.parseInt(hotelnum),
	            Integer.parseInt(roomnum),
	            content,
	            score);
	    ReviewDAO rvDAO=new ReviewDAO();
	    try {
            rvDAO.addReview(rv);
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}

}
