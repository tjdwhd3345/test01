package control;

import java.io.IOException;
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글 인코딩
		request.setCharacterEncoding("utf-8");
		
		//세션에서 로그인값 받기
		HttpSession session=request.getSession();
		User u=(User)session.getAttribute("loginInfo");
		
		ReserveDAO rDAO=new ReserveDAO();
		List<Reserve> rList=new ArrayList<Reserve>();
		rList=rDAO.selectReserve(u.getEmail());
		request.setAttribute("reserveList", rList);	//예약 목록을 request영역에 저장
		
		RequestDispatcher rd=request.getRequestDispatcher("reserveList.jsp");	//페이지 이동
		rd.forward(request, response);
	}

}
