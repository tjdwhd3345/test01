package control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

import com.my.dao.HotelDAO;
import com.my.vo.Hotel;
import com.my.vo.HotelList;

/**
 * Servlet implementation class HotelListServlet
 */
public class HotelListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    //한글깨짐 방지
        request.setCharacterEncoding("utf-8");
        
        String searchValue=request.getParameter("searchValue");
        String search=request.getParameter("search");
        String checkIn=request.getParameter("checkIn");
        String checkOut=request.getParameter("checkOut");
        System.out.println(checkIn);
        System.out.println(checkOut);
        //request.setAttribute("searchValue", searchValue);
        
        HttpSession session=request.getSession();
        //HashMap<String, String> map=new HashMap<String, String>();
        List<HotelList> hList=new ArrayList<HotelList>();
        List<HotelList> hList2=new ArrayList<HotelList>();
        
        session.setAttribute("checkIn", checkIn);
        session.setAttribute("checkOut", checkOut);
        
        try {
            SAXBuilder builder=new SAXBuilder();
            System.out.println("SAX success");
            builder.setIgnoringElementContentWhitespace(true);  //파싱할때 공백은 무시
            File xmlFile=new File("C:\\Users\\한국정보기술\\Desktop\\myjava\\test01\\WebContent\\public_data.xml");
            FileInputStream fin=new FileInputStream(xmlFile);   //예외처리
            Document doc=builder.build(fin);    //xml파일을 document객체에 담는다
            
            Element root=doc.getRootElement();
            //doc.getDocumentElement().normalize();
            //System.out.println("root:"+root.getName());     //result
            List<Element> elmts=root.getChildren();
            for(Element elmt:elmts) {
                if(elmt.getName().equals("header")) {
                    //Element hc=elmts.get(0).getChildren().get(0);   //header의 자식 중 첫 번째 녀석을 얻어와
                    Element hc=elmt.getChildren().get(0);   //header의 자식 중 첫 번째 녀석을 얻어와
                    //System.out.println("이건 뭐지?"+hc.getName());  //columns
                    List<Element> cols=hc.getChildren();    //columns의 자식들을 얻어오자
                    HotelList h1=new HotelList();   //column태그값을 담을 객체
                    for(Element col:cols) {
                        //System.out.println(col.getName()+":"+col.getText());
                        if(col.getName().equals("rowNum")) {
                            h1.setRowNum(col.getText());
                        }
                        if(col.getName().equals("bplcNm")) {
                            h1.setBplcNm(col.getText());
                        }
                        if(col.getName().equals("siteWhlAddr")) {
                            h1.setSiteWhlAddr(col.getText());
                        }
                        if(col.getName().equals("rdnWhlAddr")) {
                            h1.setRdnWhlAddr(col.getText());
                        }
                    }
                    //System.out.println("h1:"+h1.getRowNum());
                    //System.out.println("h1:"+h1.getBplcNm());
                    //System.out.println("h1:"+h1.getSiteWhlAddr());
                    //System.out.println("h1:"+h1.getRdnWhlAddr());
                    hList.add(h1);
                    request.setAttribute("hList", hList);
                }else if(elmt.getName().equals("body")) {
                    //Element bc=elmts.get(1).getChildren().get(0);
                    Element bc=elmt.getChildren().get(0);
                    //System.out.println(bc.getName());       //bc=rows
                    List<Element> bcrows=bc.getChildren();     
                    for(Element bcrow:bcrows) {
                        //System.out.println(bcrow.getName());    //bcrow=row
                        List<Element> bcrowcols=bcrow.getChildren();
                        HotelList h2=new HotelList();
                        HotelDAO hDAO=new HotelDAO();
                        for(Element bcrowcol:bcrowcols) {
                            if(bcrowcol.getName().equals("rowNum")) {
                                h2.setRowNum(bcrowcol.getText());
                            }
                            if(bcrowcol.getName().equals("bplcNm")) {
                                h2.setBplcNm(bcrowcol.getText());
                                //System.out.println(bcrowcol.getText());
                            }
                            if(bcrowcol.getName().equals("siteWhlAddr")) {
                                h2.setSiteWhlAddr(bcrowcol.getText());
                            }
                            if(bcrowcol.getName().equals("rdnWhlAddr")) {
                                h2.setRdnWhlAddr(bcrowcol.getText());
                            }
                            if(bcrowcol.getName().equals("x")) {
                                h2.setX(bcrowcol.getText());
                            }
                            if(bcrowcol.getName().equals("y")) {
                                h2.setY(bcrowcol.getText());
                            }
                            //System.out.println(bcrowcol.getName());                            
                        }
                        
                        //hDAO.addHotel(new Hotel(Integer.parseInt(h2.getRowNum()), h2.getBplcNm(), h2.getSiteWhlAddr(), 0));
                        //System.out.println(h2.getRowNum());
                        hList2.add(h2);
                        //System.out.println(hList2.size());
                        request.setAttribute("hList2", hList2);
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
        } catch (NumberFormatException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }       
        
        RequestDispatcher rd = request.getRequestDispatcher("listResult.jsp");
        rd.forward(request, response);
        //return "listResult.jsp";
	}

}
