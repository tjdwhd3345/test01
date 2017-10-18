<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index.jsp</title>
</head>
<body>
	<a href="login.jsp">로그인</a>
	<a href="joinForm.jsp">회원가입</a><br>
	<select name="search">
		<option value="loc">지역</option>
		<option value="name">이름</option>
	</select>
	<input type="text" name="searchValue">
	<jsp:include page="calTest.jsp"/>
</body>
</html>