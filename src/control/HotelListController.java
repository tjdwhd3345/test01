package control;

import java.io.IOException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

import com.my.vo.HotelList;

public class HotelListController implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //request.setAttribute("hList", "./public_data.json");
        request.setCharacterEncoding("utf-8");
        System.out.println(request.getParameter("d"));
        
        HttpSession session=request.getSession();
        //HashMap<String, String> map=new HashMap<String, String>();
        List<HotelList> hList=new ArrayList<HotelList>();
        List<HotelList> hList2=new ArrayList<HotelList>();
        
        HotelList h1=new HotelList();
        HotelList h2=new HotelList();
        //List<String> hList=new ArrayList<>();
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
                //System.out.println("root의 자식들"+elmt.getName()); // header, body
                if(elmt.getName().equals("header")) {
                    //List<Element> hcs=elmt.getChildren("columns");  
                    /*for(Element hc:hcs) {
                        System.out.println("이건또뭐야?"+hc.getName());   //
                    }*/
                    
                    Element hc=elmt.getChildren().get(0);   //header의 자식 중 첫 번째 녀석을 얻어와
                    //System.out.println("이건 뭐지?"+hc.getName());  //columns
                    List<Element> cols=hc.getChildren();    //columns의 자식들을 얻어오자
                    for(Element col:cols) {
                        //System.out.println(col.getName()+":"+col.getText());
                        //map.put(col.getName(), col.getText());
                        //hList.add(new HotelList());
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
                    //System.out.println("hl:"+hl.getRowNum());
                    //System.out.println("hl:"+hl.getBplcNm());
                    //System.out.println("hl:"+hl.getSiteWhlAddr());
                    //System.out.println("hl:"+hl.getRdnWhlAddr());
                        hList.add(h1);
                        //request.setAttribute("hList", hList);
                        //System.out.println("???????????????");
                        session.setAttribute("hList", hList);
                } else if(elmt.getName().equals("body")){
                    System.out.println(elmt.getName());     //elmt=body
                    Element bc=elmt.getChildren().get(0);
                    System.out.println(bc.getName());       //bc=rows
                    List<Element> bcrows=bc.getChildren();     
                    for(Element bcrow:bcrows) {
                        //System.out.println(bcrow.getName());    //bcrow=row
                        List<Element> bcrowcols=bcrow.getChildren();
                        for(Element bcrowcol:bcrowcols) {
                            if(bcrowcol.getName().equals("rowNum")) {
                                h2.setRowNum(bcrowcol.getText());
                            }
                            if(bcrowcol.getName().equals("bplcNm")) {
                                h2.setBplcNm(bcrowcol.getText());
                            }
                            if(bcrowcol.getName().equals("siteWhlAddr")) {
                                h2.setSiteWhlAddr(bcrowcol.getText());
                            }
                            if(bcrowcol.getName().equals("rdnWhlAddr")) {
                                h2.setRdnWhlAddr(bcrowcol.getText());
                            }
                            //System.out.println(bcrowcol.getName());
                            hList2.add(h2);
                        }
                        session.setAttribute("hList2", hList2);
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
        
        
        return "listResult.jsp";
    }

}
