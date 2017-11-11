package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.dao.UserDAO;
import com.my.exception.DuplicatedException;
import com.my.vo.User;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

/**
 * Servlet implementation class SignupServlet
 */
public class SignupServlet extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
        
	    //혹시나 이미 로그인한 상태에서 가입을 했을 경우 로그인정보 없애라.
	    HttpSession session=request.getSession();
	    session.removeAttribute("loginInfo");
	    
	    
        String emailValue=request.getParameter("email");
        String pwdValue=request.getParameter("pwd");
        String nameValue=request.getParameter("name");
        String telValue=request.getParameter("tel");
        
        UserDAO userDAO=new UserDAO();
        
        try {
            userDAO.addUser(new User(emailValue, pwdValue, nameValue, telValue));
            request.setAttribute("msg", "가입성공");
        } catch(MySQLIntegrityConstraintViolationException e) {
            //mysql primary key 중복 예외
            e.printStackTrace();
            request.setAttribute("msg", "이미 사용중인 아이디입니다.");
        } catch (Exception e) {
            //그외 다른 예외
            e.printStackTrace();
            request.setAttribute("msg", "가입실패");
        }
        
        RequestDispatcher rd=request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
	}

}
