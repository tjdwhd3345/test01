<%@page import="com.my.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>예약완료::CHECKIN.COM</title>

	<% request.setCharacterEncoding("utf-8"); %>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
	<!-- bootstrap start -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="BootTestCss/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="BootTestCss/css/half-slider.css" rel="stylesheet">
    
    <!-- Bootstrap core JavaScript -->
    <script src="BootTestCss/vendor/jquery/jquery.min.js"></script>
    <script src="BootTestCss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<style>
		nav>ul>li{display:inline-block}
		
	/* 메인 슬라이드 */
	#rolling{width:660px;  margin:0px auto; position:relative; overflow:hidden;} 
	#rolling h1{display:none;}
	#rolling div:first-of-type{width:3000px; position:relative;}
	#rolling img{width:658px; height:500px;}
	#circle{width:650px; text-align:center; margin:auto;}
	#circle i{display:inline-block; padding:5px; margin:auto 0px; border-radius:10px; cursor:pointer; font-weight: bold;}
	</style>
	<!-- bootstrap end -->
	
	<!-- 상단 index -->
	<script>
		$(function(){ //jQuery
			var $liArr = $("nav>div>div>ul>li");
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
									//location.href="uploadDirectory/hotel02_3.jpg";
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
			
			//hotel list를 불러와라
			$("#test").click(function(){
				//var $d=$("#searchValue").val()+$("#search").val();
				var $d=$('.hosearch').serialize();
				$('.hosearch').submit();
			});//end click
			
			//예약하기 버튼 눌렀을 때
			$("#reservebtn").click(function(){
				alert('예약이 완료되었습니다.');
				$("#rsvform").submit();
			});
			
		});
	</script>
</head>
<body>
	<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp"> CHECKIN.COM </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
          <% 
          Object obj=session.getAttribute("loginInfo");
		  if(obj == null){
			%>
            <li class="nav-item active" id="login.jsp">
              <a class="nav-link" href="#">Login
                <!-- <span class="sr-only">(current)</span> -->
              </a>
            </li>
            <li class="nav-item" id="joinForm.jsp">
              <a class="nav-link" href="#">Sign up</a>
            </li>
            <%}
			else{
				User u=(User) obj;
            %>
            <li class="nav-link"><%=u.getEmail() %>님</li>
            <li class="nav-item" id="reserveList.do">
              <a class="nav-link" href="#">예약조회</a>
            </li>
            <li class="nav-item" id="logout.do">
              <a class="nav-link" href="#">로그아웃</a>
            </li>
            <li class="nav-item" id="list.do">
              <a class="nav-link" href="#">목록</a>
            </li>
            <%} %>
          </ul>
        </div>
      </div>
    </nav>
	<!-- Navigation end -->
	
	<style>
	.tail {
	   height: 50px;
	}
	</style>
	<div class="tail"></div>
	<div id="target" class="container">
		<div class="tail"></div>
		<h3>예약완료</h3>
		<div id="target" class="container" style="border:1px solid;">
		<!-- <h1>reservesuccess.jsp</h1> -->
		<span font-color="blue"><b>고객님의 예약이 완료되었습니다.</b></span><br><br>
		<c:set var="reserve" value="${reserved }"/>
		<label>예약번호</label><br> ${reserve.bookno }<br><br>
		<h5><strong>${reserve.hotelname }</strong></h5><br>
		체크인 ${reserve.checkIn }<br>
		체크아웃 ${reserve.checkOut }<br>
		결제금액 ${reserve.price }<br>
		</div>
	</div>
</body>
</html>