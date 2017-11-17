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
 * Servlet implementation class ReviewFormServlet
 */
public class ReviewFormServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //한글 인코딩
	    request.setCharacterEncoding("utf-8");
	    String bookno=request.getParameter("bookno");
	    
	    ReserveDAO reDAO=new ReserveDAO();
	    Reserve r=reDAO.getReserve(Integer.parseInt(bookno));
	    request.setAttribute("reserve", r);
	    
	    RequestDispatcher rd=request.getRequestDispatcher("reviewForm.jsp");
	    rd.forward(request, response);
	}

}
