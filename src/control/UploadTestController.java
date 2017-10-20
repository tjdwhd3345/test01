package control;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadTestController implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("utf-8");
        //String root=request.getSession().getServletContext().getRealPath("/");
        //String root=request.getServletContext().getRealPath("/");
        //String root=application.getRealPath("/");
        String path=request.getServletContext().getRealPath("/uploadDirectory");
        
        File f=new File(path);
        if(!f.exists()) {
            f.mkdirs(); //없으면 폴더생성
        }
        
        String encType = "UTF-8";
        int maxFilesize = 5 * 1024 * 1024;  //5MB

        // MultipartRequest(request, 저장경로[, 최대허용크기, 인코딩케릭터셋, 동일한 파일명 보호 여부])
        MultipartRequest mr = new MultipartRequest(request, path, maxFilesize,
                encType, new DefaultFileRenamePolicy());        
        Enumeration efiles = mr.getFileNames();        
        File file=null;
        String[] fpath = new String[2];
        int i=0;
        
        while(efiles.hasMoreElements()) {
            String fname=(String) efiles.nextElement();
            String fileName=mr.getFilesystemName(fname);    //업로드된 파일명
            if(fileName != null) {
                file=mr.getFile(fname);
                System.out.println("경로:"+file);
                System.out.println("파일명:"+file.getName());
                fpath[i]="uploadDirectory/"+file.getName();
                //fpath[i]=file.getPath();
                i++;
            }
        }
        request.setAttribute("fpath", fpath);
        //File file1 = mr.getFile("img1");
        //File file2 = mr.getFile("img2");
        //System.out.println("file1:"+file1); // 첨부된 파일의 전체경로
        //System.out.println(path);
        
        //System.out.println(file1.isFile());
        //System.out.println("앱솔루트패스:"+file1.getAbsolutePath());
        //System.out.println("투패스:"+file1.toPath());
        //System.out.println(file1.);
        //System.out.println(file1.getName());
        
        //System.out.println("file2:"+file2);
        //System.out.println(file2.getPath());
        
        System.out.println(request.getParameter("title")); // null
        System.out.println(mr.getParameter("title")); // 입력된 문자
        
        return "fileCheck.jsp";
    }

}
