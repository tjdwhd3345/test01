<%@page import="com.my.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${param['name'] }::CHECKIN.COM</title>
	
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
			//alert('${checkIn}');
			//alert('${checkOut}');
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
									//location.href="index.jsp";
									location.reload();
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
	
	<!-- 다음지도 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c2aa194de2a7b800dc342de69bf136a&libraries=services"></script>
	<fmt:parseNumber var="px" type="number" value="${param['x'] }"/>
	<fmt:parseNumber var="py" type="number" value="${param['y'] }"/>
	<script>
		window.onload=function(){
			var geocoder = new daum.maps.services.Geocoder(), // 좌표계 변환 객체를 생성합니다
		    wtmX = ${px}, // 변환할 WTM X 좌표 입니다
		    wtmY = ${py}; // 변환할 WTM Y 좌표 입니다

			// WTM 좌표를 WGS84 좌표계의 좌표로 변환합니다
			geocoder.transCoord(wtmX, wtmY, transCoordCB, {
			    input_coord: daum.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
			    output_coord: daum.maps.services.Coords.WGS84 // 변환 결과로 받을 좌표계 입니다 
			});
	
			// 좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
			function transCoordCB(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			    if (status === daum.maps.services.Status.OK) {
			        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
			    	    center: new daum.maps.LatLng(result[0].y, result[0].x), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
			    	};
	
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new daum.maps.Map(mapContainer, mapOption);
			        
			        // 마커를 변환된 위치에 표시합니다
			        var marker = new daum.maps.Marker({
			            position: new daum.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치입니다
			            map: map // 마커를 표시할 지도객체입니다
			        })
			    }
			}
		}
	</script>
	<!-- 다음지도 api 끝 -->
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
			<!-- 
            <li class="nav-item active" id="login.jsp">
              <a class="nav-link" href="#">Login
                 <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item" id="joinForm.jsp">
              <a class="nav-link" href="#">Sign up</a>
            </li>-->
            <li class="nav-item" id="EJLogin.jsp">
            	<a class="nav-link" href="#">Login/Sign up</a>
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

	
		${param['x'] }
		${param['y'] }
    <br><Br>
		
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
	    		<div id="map" style="width:500px;height:400px;"></div>
	    		
	    		</div>
	    	</td>
	    </tr>
	    </table>
	</div>
	<div id="target" class="container">
	<p><strong>객실정보</strong></p>
	<c:if test="${empty requestScope.ro }"><p> 선택한 날짜에 이용가능한 객실이 없습니다.</p></c:if>
	 	
	<c:forEach var="room" items="${requestScope.ro}">
		<div class="room_div" id="${room.no}" style="border:1px solid;">
			${room.name }
	 		<div class="room_detail" style="display:none; margin:20px;">
	 			<form id="roomForm" action="reserveForm.jsp" method="post">
		 			<input type="hidden" name="hotelnum" value="${param['num'] }">
		 			<input type="hidden" name="hotelname" value="${param['name'] }">
		 			<input type="hidden" name="hoteladdr" value="${param['addr'] }">
		 			<input type="hidden" name="roomnum" value="${room.no }">
		 			<table class="" width="100%" text-align="center" vertical-align="middle">
		 				<tr align="center">
		 					<th colspan="2">객실 정보</th><th>최대 인원</th><th colspan="2">가격</th>
		 				</tr>
		 				<tr align="center" text-align="center">
		 					<c:forEach var="roomimg" items="${requestScope.roomimg }">
			 					<c:if test="${roomimg.no eq room.no}">
				 					<td><img name="roomimg" src="${roomimg.img }" width="200px" height="200px"></td>
				 					<input type="hidden" name="roomimg" value="${roomimg.img }">
			 					</c:if>
		 					</c:forEach>
		 					<td><input readonly type="text" name="roomname" value="${room.name}"></td>
		 					<td><input readonly type="text" name="roombeds" value="${room.beds}"></td>
		 					<td align="right"><input readonly type="text" name="roomprice" value="${room.price}"></td>
		 					<td><input type="button" value="예약"></td>
		 				</tr>
		 			</table>	
	 			
	 			</form>
	 		</div>
	 	</div>
	 </c:forEach>
	 <script>
	 $("div.room_div").hover(function(){
		    $(this).css("background-color", "#e8e8e8");
		    }, function(){
		    $(this).css("background-color", "white");
		});
	 </script>
	<style>
		input[type=text]{border:none}
		.room_div{cursor:pointer}
	</style>
	<script>
	
	$(function(){
		
		var $btn=$('input[type=button]');
		$($btn).click(function(){
			<c:choose>
				<c:when test="${empty sessionScope.loginInfo }">
					alert("로그인이 필요합니다");
					location.href="EJLogin.jsp";
				</c:when>
				<c:otherwise>
					//alert('aaa');
					$(this).parents("#roomForm").submit();
					//alert($fobj);
					//$($fobj).submit();
					//$('#roomForm').submit();
				</c:otherwise>
			</c:choose>
		});
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
	
	<style>
	.tail {
	   height: 50px;
	}
	footer{
	position:absolute;
	bottom:0;
	left:0;
	right:0;
	}
	</style>
	<div id="tail"></div>
	<div id="target" class="container">
		<caption><b>이용가능 서비스</b></caption>
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
		<!-- 
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
		 -->
	</div>
	<!-- 
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
	 -->
	<div id="target" class="container">
	<p><b>이용후기</b>이용후기가 들어갈 div위치</p>
	
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