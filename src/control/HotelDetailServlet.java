package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.dao.HotelDAO;
import com.my.dao.RoomDAO;
import com.my.vo.Hotel;
import com.my.vo.Room;

/**
 * Servlet implementation class HotelDetailServlet
 */
public class HotelDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HotelDAO hDAO=new HotelDAO();
	RoomDAO rDAO=new RoomDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    System.out.println("get");
	    String num=request.getParameter("num");
	    String name=request.getParameter("name");
	    String x=request.getParameter("x");
	    String y=request.getParameter("y");
	    
	    Hotel h=hDAO.selectByNo(num);
	    request.setAttribute("ho", h);
	    List<Room> rList=rDAO.selectRoom(num);
	    request.setAttribute("ro", rList);
	    
	    
	    RequestDispatcher rd=request.getRequestDispatcher("detail.jsp");
	    rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    System.out.println("post");
	    System.out.println(request.getParameter("num"));
	}

}
