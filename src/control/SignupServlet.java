package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.dao.UserDAO;
import com.my.vo.User;

/**
 * Servlet implementation class SignupServlet
 */
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
        
        String emailValue=request.getParameter("email");
        String pwdValue=request.getParameter("pwd");
        String nameValue=request.getParameter("name");
        String telValue=request.getParameter("tel");
        
        UserDAO userDAO=new UserDAO();
        
        try {
            userDAO.addUser(new User(emailValue, pwdValue, nameValue, telValue));
            request.setAttribute("msg", "가입성공");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "가입실패");
        }
        
        RequestDispatcher rd=request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
	}

}
