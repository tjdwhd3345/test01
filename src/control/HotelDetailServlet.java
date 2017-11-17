package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.dao.HotelDAO;
import com.my.dao.HotelServiceDAO;
import com.my.dao.ReviewDAO;
import com.my.dao.RoomDAO;
import com.my.dao.TotalServiceDAO;
import com.my.vo.Hotel;
import com.my.vo.HotelService;
import com.my.vo.Review;
import com.my.vo.Room;
import com.my.vo.TotalService;

/**
 * Servlet implementation class HotelDetailServlet
 */
public class HotelDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HotelDAO hDAO=new HotelDAO();
	RoomDAO rDAO=new RoomDAO();
	HotelServiceDAO hsDAO=new HotelServiceDAO();
	TotalServiceDAO tsDAO=new TotalServiceDAO();
	ReviewDAO rvDAO=new ReviewDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    System.out.println("get");
	    String num=request.getParameter("num");
	    String name=request.getParameter("name");
	    String x=request.getParameter("x");
	    String y=request.getParameter("y");
	    
	    //선택된 호텔의 번호로 조회한다.
	    Hotel h=hDAO.selectByNo(num);
	    request.setAttribute("ho", h);
	    //호텔의 객실들을 list로 받아온다.
	    List<Room> rList=rDAO.selectRoom(num);
	    request.setAttribute("ro", rList);
	    
	    //각 방의 이미지경로를 list로 받아온다.
	    List<Room> rimgList=rDAO.getImg(num);
	    request.setAttribute("roomimg", rimgList);
	    
	    //호텔 제공서비스들을 HotelService 객체로 받아온다.
	    //HotelService hs=hsDAO.selectService(num);
	    List<HotelService> hs=hsDAO.selectService(num);
	    request.setAttribute("hs", hs);
	    
	    //모든 제공서비스를 객체로 받아온다.
	    List<TotalService> ts=tsDAO.selectAllService();
	    request.setAttribute("ts", ts);
	    
	    //해당 호텔의 이용후기들을 받아온다.
	    List<Review> rvList=rvDAO.selectAllReview(num);
	    request.setAttribute("rvList", rvList);
	    
	    RequestDispatcher rd=request.getRequestDispatcher("detail.jsp");
	    rd.forward(request, response);
	}

}
