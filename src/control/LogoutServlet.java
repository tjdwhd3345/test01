package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		HttpSession session=request.getSession();
        session.removeAttribute("loginInfo");
        //request.setAttribute("msg", "1"); //?이거 왜 해줌?
        
        //RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
        //rd.forward(request, response);
	}

}
