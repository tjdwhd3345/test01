<%@page import="com.my.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${param['name'] }::HOTELBOOK</title>
	
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
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
			
			//이미지 슬라이드
			var count=0;
			$("#circle>i").eq(0).css("background", "#E8F5FF");

			/*자동롤링 start*/
			setInterval(function(){
				count++;
				if($("#rolling>div:eq(0)").position().left == -1800){
					$("#rolling>div:eq(0)").append('<img src="hotel01_.jpg" alt="롤링이미지">').animate({left:"-=660px"},
							function(){
								$("#rolling>div:eq(0)").css({"left" : 0});
								$("#rolling>div:eq(0)>img").last().remove();
							});
					count=0;
					$("#circle>i").eq(count).css("background", "#E8F5FF").siblings().css("background", "none");
				}
			},2000);

			/* 자동롤링 end */
			var change=0;
			$("#circle>i").click(function(){
				//alert($(this).index());
				var me = $(this).index();
				change = (me * (-660)) + "px";
				$("#rolling>div:eq(0)").animate({left:change});
				$("#circle>i").eq(me).css("background", "#E8F5FF").siblings().css("background", "none");
			});
			//이미지 슬라이드 끝
			
			
		});
	</script>
</head>
<body>
	<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp"> MOMO </a>
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
            <li class="nav-item" id="">
              <a class="nav-link" href="#">예약확인</a>
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

	
		${param['x'] }
		${param['y'] }
    <br><Br>
		${param['num']}
		
	<div id="target" class="container">
	    <table class="table">
			<tr>
				<td colspan="2"><h1>${param['name']}</h1></td>
			</tr>
			<tr>
				<td colspan="2">${param['addr']}</td>
			</tr>		
	    <tr>
	    	<td>
	    		<div class="top_wrap">
	    		<section id="rolling">
	    			<div>
			    		<img src="hotel01_.jpg" width="480px" height="300px">
			    		<img src="hotel03_copy.jpg" width="480px" height="300px">
			    		<img src="hotel04_.jpg" width="480px" height="300px">
		    		</div>
		    		<div id="circle">
			    		<i><img src="hotel01_.jpg" style="width:100px; height:100px;"></i>
			    		<i><img src="hotel03_copy.jpg" style="width:100px; height:100px;"></i>
			    		<i><img src="hotel04_.jpg" style="width:100px; height:100px;"></i>
		    		</div>
		    	</section>
	    		</div>
	    	</td>
	    	<script>
	    	/*
	    	$(function(){
	    		//mouseover 이벤트
				$imgs=$('#mainimg').find('div>img');
				//$('#mainimg>div>img').hover(function(){
				$($imgs).hover(function(){
	    			alert('aaa');
	    			$('#mainimg').attr('src', $(this).attr('src'));
	    		});
	    		//$($imgs).attr('src');
	    		
	    	});*/
	    	</script>
	    	<td>
	    		<div>
	    		<h1>${requestScope.ho.score } / 5.0</h1>
	    		여기는 이용평가항목의 요약이나 지도가 있었으면 좋겠어
	    		</div>
	    	</td>
	    </tr>
	    </table>
	</div>
	<div id="target" class="container">
	<p>객실정보</p>
	 <c:forEach var="room" items="${requestScope.ro}">
	 	<div class="room_div" id="${room.no}" style="border:1px solid;">${room.name }
	 		<div class="room_detail" style="display:none;">
	 			<table class="table table-striped table-hover ">
	 				<tr align="center">
	 					<th colspan="2">객실 정보</th><th>최대 인원</th><th colspan="2">가격</th>
	 				</tr>
	 				<tr align="center">
	 					<td>여긴사진</td><td>${room.name}</td><td>${room.beds}</td><td align="right">${room.price }</td>
	 					<td><input type="button" value="예약"></td>
	 				</tr>
	 			</table>	
	 		</div>
	 	</div>
	 </c:forEach>
	 <script>
	 $(function(){
		var $rDiv=$('.room_div'); 
		$($rDiv).click(function(){
			//alert($(this).attr('id'));
			var $otherRoom=$($rDiv).not(this);
			$otherRoom.find("div.room_detail").hide();
			$(this).find("div.room_detail").show();
			/*
			var $detailObj = $(this).find("div.room_detail");
			var $rid=$(this).attr('id');
			var detail='<table class="table table-striped table-hover ">';
			detail+='<tr align="center">';
			detail+='<th colspan="2">객실 정보</th><th>최대 인원</th><th>가격</th>';
			detail+='</tr>';
			detail+='<tr>';
			detail+='<td>여긴사진</td><td>자세한 내용은</td><td>ajax를 해야하는건가</td><td>이미 request로 받아왔는데..? 어떻게 쓰지?</td>';
			detail+='</tr>';
			detail+='</table>';
			$detailObj.html(detail);
			*/
			/*
			var u='roomInfo.do';
			var d='roomno='+$rid;
			$.ajax({
				url:u,
				data:d,
				method:'post',
				success:function(){
					$detailObj.html('aaaa');
					
				}
			});
			*/
		});
	 });
	 </script>
	</div>
	<div id="target" class="container">
		<p>호텔정보(제공 서비스)가 div로 쭉 나왔음ㄴ 좋겠어 아니면 테이블이나</p>
		<caption>이용가능 서비스</caption>
		<style>
		#mytable{
			width:100%;
			max-width:100%;
			
		}
		</style>
		<table id="mytable" class="table table-striped table-hover ">
			<c:forEach var="ts" items="${requestScope.ts}">
			<tr>
				<td width="20%">${ts.name }</td>
				<c:forEach var="hs" items="${requestScope.hs}">
				<c:choose>
					<c:when test="${ts.name eq hs.name}">
						<td width="40%">
					 		${hs.service}
					 	</td>
					</c:when>
				</c:choose>
				</c:forEach>
			</tr>
			</c:forEach>
		</table>
		
		<c:forEach var="ts" items="${requestScope.ts}">
		<div id="${ts.name }" style="display:block;">
			${ts.name } |
			<c:forEach var="hs" items="${requestScope.hs}">
				<c:choose>
					<c:when test="${ts.name eq hs.name}">
						<div style="display:inline;">
					 		${hs.service} |
					 	</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		</c:forEach> 		
	</div>
	
	<div id="target" class="container">
	    <table class="table table-striped table-hover ">
		  <thead>
		    <tr class="bg-dark" style="color:#FFFFFF">
		      <th>#</th>
		      <th>Column heading</th>
		      <th>Column heading</th>
		      <th>Column heading</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>2</td>
		      <td>Column content</td>
		      <td>Column content</td>
		      <td>Column content</td>
		    </tr>
		  </tbody>
		</table> 
		
	</div>
	<div id="target" class="container">
	<p>이용후기가 들어갈 div위치</p>
	</div>
	
	<!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>
    
</body>
</html>