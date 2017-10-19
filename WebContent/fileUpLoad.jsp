<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="uploadTest.do" enctype="multipart/form-data">
		제목: <input type="text" name="title" placeholder="제목을 입력하세요"><br>
		파일1: <input type="file" name="img1"><br>
		파일2: <input type="file" name="img2"><br>
    	<input type="submit" value="업로드">
	</form>
</body>
</html>