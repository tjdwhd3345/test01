package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HotelDetailServlet
 */
public class HotelDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    System.out.println("get");
	    String num=request.getParameter("num");
	    String name=request.getParameter("name");
	    String x=request.getParameter("x");
	    String y=request.getParameter("y");
	    
	    RequestDispatcher rd=request.getRequestDispatcher("detail.jsp");
	    rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    System.out.println("post");
	    System.out.println(request.getParameter("num"));
	}

}
