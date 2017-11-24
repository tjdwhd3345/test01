package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.dao.ReserveDAO;
import com.my.vo.Reserve;

/**
 * Servlet implementation class ReserveServlet
 */
public class ReserveServlet extends HttpServlet {
    ReserveDAO reDAO=new ReserveDAO();
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    request.setCharacterEncoding("utf-8"); //한글인코딩
	    
	    //HttpSession session=request.getSession();
	    // 고유한 세션 객체의 ID를 되돌려준다.
	    //String id_str = session.getId();

	    // 세션에 마지막으로 엑세스한 시간을 되돌려 준다.
	    //long lasttime = session.getLastAccessedTime();
	    
	    // 세션이 생성된 시간을 되돌려 준다.
	    //long createdtime = session.getCreationTime();
	    
	    // 세션에 마지막으로 액세스한 시간에서 세션이 생성된 시간을 빼면 웹 사이트에 머문 시간이 계산된다.
	    //long time_used = (lasttime - createdtime) / 60000;
	    
	    // 세션의 유효 시간 얻어오기
	    //int inactive = session.getMaxInactiveInterval() / 60;
	    
	    // 세션이 새로 만들어졌는지를 알려준다.
	    //boolean b_new = session.isNew();
	    
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
	    
	    System.out.println(bookemail+", "+bookname+", "+hotelno+", "+roomno+", "+checkIn+", "+checkOut+", "+price);
	    
	    String nexturl="";
	    try {
	        Reserve red=new Reserve();
            red=reDAO.addReserve(r);    //book테이블에 예약추가
            request.setAttribute("reserved", red);
            nexturl="reserveSuccess.jsp";   //추가 성공시
            
        } catch (SQLException e) {
            System.out.println("예약추가하다가 DAO에서 예외발생함. 데이터는 롤백됨");
            //response.sendRedirect("reserveForm.jsp");
            nexturl="reserveForm.jsp";  //추가 실패시
            e.printStackTrace();
        }
	    
	    //response.sendRedirect("reserveSuccess.jsp");
	    RequestDispatcher rd=request.getRequestDispatcher(nexturl);
	    rd.forward(request, response);
	    
	}

}
