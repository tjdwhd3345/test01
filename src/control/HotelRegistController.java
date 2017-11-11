package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.dao.HotelDAO;
import com.my.vo.Hotel;

public class HotelRegistController implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //파일 경로
        String path=request.getSession().getServletContext().getRealPath("");
        
        request.setCharacterEncoding("utf-8");
        
        String name=request.getParameter("name");
        String location=request.getParameter("location");
        String info=request.getParameter("info");
        String service="";
        
        System.out.println(name);
        System.out.println(location);
        System.out.println(info);
        
        if(request.getParameterValues("sv") != null) {
            String[] sv=request.getParameterValues("sv");
            for(int i=0; i<sv.length; i++) {
                //System.out.println(sv[i]);
                service+=sv[i];
                if(i != sv.length-1) {
                    service+=",";
                }
            }
        }
        System.out.println(service);
        
        HotelDAO hDAO=new HotelDAO();
        try {
            hDAO.addHotel(new Hotel(0, name, location, info, service));
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return "registHotel.jsp";
    }
}
