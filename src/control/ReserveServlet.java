package control;

import java.io.IOException;
import java.sql.SQLException;

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
	    String hotelno=request.getParameter("hotelnum");
	    String roomno=request.getParameter("roomnum");
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
	    
	    try {
	        Reserve red=new Reserve();
            red=reDAO.addReserve(r);
            request.setAttribute("reserved", red);
        } catch (SQLException e) {
            System.out.println("예약추가하다가 DAO에서 예외발생함 데이터는 롤백됨");
            e.printStackTrace();
        }
	    
	    RequestDispatcher rd=request.getRequestDispatcher("reserveSuccess.jsp");
	    rd.forward(request, response);
	}

}
