import com.my.dao.UserDAO;
import com.my.vo.User;

public class test01 {

    public static void main(String[] args) {
        UserDAO userDAO=new UserDAO();
        try {
            userDAO.addUser(new User("bbc@ccc.d", "1234", "test2", "01022223333"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("a들어갔냐?");
    }
}
