package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.dao.ReserveDAO;
import com.my.vo.Reserve;

/**
 * Servlet implementation class ReserveServlet
 */
public class ReserveServlet extends HttpServlet {
    ReserveDAO reDAO=new ReserveDAO();
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    request.setCharacterEncoding("utf-8"); //한글인코딩
	    
	    String bookemail=request.getParameter("useremail");
	    String bookname=request.getParameter("username");
	    String hotelno=request.getParameter("hotelno");
	    String roomno=request.getParameter("roomno");
	    String checkIn=request.getParameter("checkIn");
	    String checkOut=request.getParameter("checkOut");
	    String price=request.getParameter("price");
	    
	    Reserve r=new Reserve(
	            bookemail, 
	            bookname, 
	            Integer.parseInt(hotelno), 
	            Integer.parseInt(roomno), 
	            checkIn, 
	            checkOut, 
	            Integer.parseInt(price));
	    
	    reDAO.addReserve(r);
	    
	    RequestDispatcher rd=request.getRequestDispatcher("");
	    rd.forward(request, response);
	}

}
