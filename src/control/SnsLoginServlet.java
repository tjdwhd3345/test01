package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.dao.UserDAO;
import com.my.vo.User;

/**
 * Servlet implementation class SnsLoginServlet
 */
public class SnsLoginServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //인코딩 설정
	    request.setCharacterEncoding("utf-8");
	    
	    String sns_email=request.getParameter("se");
	    String sns_name=request.getParameter("sn");
	    String sns_id=request.getParameter("si");
	    
	    User u=new User(sns_email, sns_name, sns_id);
	    UserDAO uDAO=new UserDAO();
	    
	    User u2=uDAO.selectUserByNaver(u); //sns아이디 객체로 검색
	    
	    RequestDispatcher rd=null;
	    
	    //System.out.println("SnsLoginServlet");
	    //System.out.println(sns_email+", "+sns_name+", "+sns_id);
	    
	    if(u2 == null) {   //sns로 로그인한 적이 없다면
	        try {
                uDAO.addUserByNaver(u);
                //System.out.println("SNS 회원가입 실행");
                rd=request.getRequestDispatcher("sns.do");
                rd.forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
	    } else {
	        HttpSession session=request.getSession();
	        session.removeAttribute("loginInfo"); //이 전에 있던 세션속성 제거->초기화작업
	        
	        session.setAttribute("loginInfo", u);  //네이버 회원 정보를 세션에 추가
	        //System.out.println(u.getEmail()+", "+u.getName()+", "+u.getId());
	        
	        rd=request.getRequestDispatcher("index.jsp");
	        rd.forward(request, response);
	    }
	}
}
