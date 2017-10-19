package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.dao.UserDAO;
import com.my.exception.FindException;
import com.my.vo.User;

public class LoginController implements Controller{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String emailValue=request.getParameter("email");
        String pwdValue=request.getParameter("pwd");
        
        //세션사용하기
        HttpSession session=request.getSession();
        session.removeAttribute("loginInfo"); //이 전에 있던 세션속성 제거->초기화작업
        
        UserDAO userDAO=new UserDAO();
        try {
            User u=userDAO.selectUser(emailValue);
            if(pwdValue.equals(u.getPwd())){    //로그인 성공시
                session.setAttribute("loginInfo", u);
                request.setAttribute("msg", "1");
            } else {    //로그인 실패시
                request.setAttribute("msg", "-1");
            }
        } catch (FindException e) { //아이디 또는 비밀번호가 없을 시
            e.printStackTrace();
            request.setAttribute("msg", "-1");
        }
        
        
        return "result.jsp";
    }
    
}
