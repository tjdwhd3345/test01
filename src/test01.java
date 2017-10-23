import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

import com.my.dao.HotelDAO;
import com.my.dao.UserDAO;
import com.my.vo.Hotel;
import com.my.vo.User;



public class test01 {

    public static void main(String[] args) {
        
        
        
        
        /*UserDAO userDAO=new UserDAO();
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
        }*/
        
        
        
        //xml parser test
        try {
            SAXBuilder builder=new SAXBuilder();
            System.out.println("SAX success");
            builder.setIgnoringElementContentWhitespace(true);  //파싱할때 공백은 무시
            File xmlFile=new File("C:\\Users\\한국정보기술\\Desktop\\myjava\\test01\\WebContent\\public_data.xml");
            FileInputStream fin=new FileInputStream(xmlFile);   //예외처리
            Document doc=builder.build(fin);    //xml파일을 document객체에 담는다
            
            Element root=doc.getRootElement();
            List<Element> elmts=root.getChildren();
            for(Element elmt:elmts) {
                System.out.println(elmt.getName());
                if(elmt.getName().equals("header")) {
                    List<Element> hcs=elmt.getChildren("columns");
                    for(Element hc:hcs) {
                        System.out.println(hc.getName());
                    }
                    
                    Element hc=elmt.getChildren().get(0);
                    System.out.println(hc.getName());
                    List<Element> cols=hc.getChildren();
                    for(Element col:cols) {
                        System.out.println(col.getName()+":"+col.getText());
                    }
                }
            }
            
            
        } catch (FileNotFoundException e) {
            System.out.println("FileNotFoundException");
            e.printStackTrace();
        } catch (JDOMException e) {
            System.out.println("JDOMException");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("IOException");
            e.printStackTrace();
        }
        
        
    }
}
