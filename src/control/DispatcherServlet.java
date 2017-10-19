package control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    String path=request.getServletPath();  //요청 url path를 얻는다.
        System.out.println("요청 URL path:"+path);
        Controller c;
        
        //control.properties파일 로드
        Properties env=new Properties();    //java.util
        ServletContext application=getServletContext();
        String propertiesFilePath=application.getRealPath("control.properties");
        System.out.println("프로퍼티스의 실제경로:"+propertiesFilePath);
        //env.load(new FileInputStream("control.properties"));    //이 파일을 못 찾는다..
        env.load(new FileInputStream(propertiesFilePath));
        //웹에서 수명이 가장 긴 ServletContext의 실제 경로를 얻는 속성을 이용해서 경로를 지정해주자.
        
        //path에 해당 property값 얻기
        String className=env.getProperty(path);
        
        try {
            Class clazz=Class.forName(className);   //클래스 이름에 해당 .class파일 찾아 JVM에 로드
            /* Class.forName("")
             * 이 코드는 스트링값에 해당하는 클래스를 JVM에 로드하는 코드이다.
             * 로드된 클래스를 Class타입의 clazz변수에 저장한다.
             */
            c=(Controller)clazz.newInstance(); //객체 생성
            /* 로드된 클래스의 객체를 newInstance()로 생성한다.
             * 생성시 반환되는 타입은 Object타입인데 여기서 우리가 만든 Controller타입으로 다운캐스팅하는 이유는
             * 각 컨트롤러가 해야할 일을 execute()에 정의해주고 실행하기 위해서이다.
             * 다운캐스팅하지않으면 Object타입의 객체가 생성돼서 execute()를 실행할 수 없다.
             */
            
            String url=c.execute(request, response);
            System.out.println(url);
            RequestDispatcher rd=request.getRequestDispatcher(url);
            rd.forward(request, response);
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        
        /*if("/login.do".equals(path)) {
            c=new LoginController();
        }else if("/logout.do".equals(path)) {
            
        }else if("/productList.do".equals(path)) {
            
        }*/
	}

}
