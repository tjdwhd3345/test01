package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.dao.UserDAO;
import com.my.vo.User;

public class SignupController implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        
        return "result.jsp";
    }

}
