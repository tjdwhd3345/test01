package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.dao.ReserveDAO;
import com.my.vo.Reserve;
import com.my.vo.User;
import com.oracle.jrockit.jfr.RequestDelegate;

/**
 * Servlet implementation class ReservelistServlet
 */
public class ReservelistServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글 인코딩
		request.setCharacterEncoding("utf-8");
		
		//세션에서 로그인값 받기
		HttpSession session=request.getSession();
		User u=(User)session.getAttribute("loginInfo");
		RequestDispatcher rd=null;
		/*
		if(u == null) {   //로그인 속성이 없으면
		    rd=request.getRequestDispatcher("EJLogin.jsp");
		    rd.forward(request, response);
		}*/
		try {
    		ReserveDAO rDAO=new ReserveDAO();
    		List<Reserve> rList=new ArrayList<Reserve>();
    		rList=rDAO.selectReserve(u.getEmail());
    		request.setAttribute("reserveList", rList);	//예약 목록을 request영역에 저장
    		
    		rd=request.getRequestDispatcher("reserveList.jsp");   //forward로 페이지 이동
            rd.forward(request, response);
		} catch (NullPointerException e) {
		    /*
		     * 세션에 로그인 정보가 없는데도 위에 if 조건에 걸리지 않고
		     * getEmail()메서드에서 nullpointer 예외가 발생한다. 왜 그러지..
		     * 예외처리를 해준다.
		     */
		    rd=request.getRequestDispatcher("EJLogin.jsp");
            rd.forward(request, response);
		}
		
	}

}
