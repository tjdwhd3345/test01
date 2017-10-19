import com.my.dao.HotelDAO;
import com.my.dao.UserDAO;
import com.my.vo.Hotel;
import com.my.vo.User;

public class test01 {

    public static void main(String[] args) {
        UserDAO userDAO=new UserDAO();
        try {
            //userDAO.addUser(new User("bbc@ccc.d", "1234", "test2", "01022223333"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("a들어갔냐?");
        
        HotelDAO hDAO=new HotelDAO();
        try {
            hDAO.addHotel(new Hotel(0, "hotel01", "songpa", "5성급 호텔"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
