<%@page import="com.my.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>index.jsp</title>
	<style>
		nav>ul>li{display:inline-block}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		$(function(){ //jQuery
			var $liArr = $("nav>ul>li");
			for(var i=0; i<$liArr.length; i++){
				var f = function(index){
					var $liObj = $liArr[i];
					
					$($liObj).click(function(){       
						var $url = $($liObj).attr("id");
						//alert($url);
						/* if($url == 'login.jsp' || $url == 'joinForm.jsp'){
							location.href=$url;
						} */
						$.ajax( {
							url: $url,
							method : 'GET',
							success : function(responseData){
								if($url == 'logout.do'){	//로그아웃메뉴를 클릭하여 응답 후
									location.href="index.jsp";
								}else{
									//location.href="index.jsp";
									//$("#wrapper>section").empty();
									//$("#wrapper>section").html(responseData);
									location.href=$url;
								}
							}
						});
						return false;
					});//end click
				};
				f(i);
			}//end for
		});
	</script>
</head>
<body>
	<h1>여기는 index.jsp가 분명하다</h1>
	<nav>
		<ul>
		<%
		Object obj=session.getAttribute("loginInfo");
		if(obj == null){
		%>
			<li id="login.jsp"><a href="#">로그인</a></li>
			<li id="joinForm.jsp"><a href="#">회원가입</a></li><br>
		<%}
		else{
			User u=(User) obj;%>
			<li><%=u.getEmail() %>님 </li>
			<li id=""><a href="#">예약확인</a></li>
			<li id="logout.do"><a href="#">로그아웃</a></li>
		<%} %>
		</ul>
		
		<form action="" method="post">
			<select name="search">
				<option value="loc">지역</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="searchValue">
			<div id="cal1" display="none">
				<%-- 달력페이지 include --%>
				<jsp:include page="calTest.jsp"/>
			</div>
			<div id="cal2">
				<%-- 달력페이지 include --%>
				<jsp:include page="calTest.jsp"/>
			</div>
			<input type="submit" value="검색">
		</form>
	</nav>
</body>
</html>