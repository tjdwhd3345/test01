<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>regist Hotel</title>
</head>
<body>
	<h3>호텔등록</h3>
	<form action="hotelRegist.do" method="post">
		이름:<input type="text" name="name"><br>
		주소:<input type="text" name="location"><Br>
		<!-- 평점:<input type="number" step="0.1" name="score"><Br> -->
		설명:<input type="text" name="info"><br>
		이용가능 서비스 :<br>
		<input type="checkbox" name="sv" value="br">조식
		<input type="checkbox" name="sv" value="wifi">WIFI
		<input type="checkbox" name="sv" value="pet">애완동물<br>
		<input type="checkbox" name="sv" value="gym">헬스장
		<input type="checkbox" name="sv" value="pool">수영장
		<input type="checkbox" name="sv" value="club">클럽
		<br>
		
		<input type="submit" value="등록">
	</form>
</body>
</html>