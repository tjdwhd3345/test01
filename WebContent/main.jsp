<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script>
	
	</script>
	<h2>아래는 main.jsp이다</h2>
	<ul>
		<li id="login.jsp"><a href="#">로그인</a></li>
		<li id="joinForm.jsp"><a href="#">회원가입</a></li><br>
	</ul>
	<select name="search">
		<option value="loc">지역</option>
		<option value="name">이름</option>
	</select>
	<input type="text" name="searchValue">
	<div id="cal1">
		<%-- 달력페이지 include --%>
		<jsp:include page="calTest.jsp"/>
	</div>
	<div id="cal2">
		<%-- 달력페이지 include --%>
		<jsp:include page="calTest.jsp"/>
	</div>
