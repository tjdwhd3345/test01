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
			$(".hosearch").submit(function(){
				//var $d=$("#searchValue").val()+$("#search").val();
				var $d=$('.hosearch').serialize();
				$.ajax({
					url:$('.hosearch').attr('action'),
					method:'POST',
					data:'d='+$d,
					success:function(){
						//location.href="listResult.jsp";
						console.log("test")
					}
				});
			});//end click
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
	    		<div>
	    		<img src="hotel04_.jpg" width="480px" height="300px">
	    		</div>
	    	</td>
	    	<td>
	    		<div>
	    		<h1>${requestScope.ho.score } / 5.0</h1>
	    		여기는 이용평가항목의 수치나 지도가 있었으면 좋겠어
	    		</div>
	    	</td>
	    </tr>
	    </table>
	</div>
	<div id="target" class="container">
	<p>여기에는 방의 목록이 div로 쭉 나왔으면 좋겠어
	동작은 각 방을 클릭하면 자바수업 때 했던 것처럼 반응형으로 방의 상세가 보여지고.
	 그러면 방목록은 굳이 div아니어도 되겠다</p>
	 <c:forEach var="room" items="${requestScope.ro}">
	 	<div class="room_div" id="${room.no}">${room.name }
	 		<div class="room_detail"></div>
	 	</div>
	 </c:forEach>
	 <script>
	 $(function(){
		var $rDiv=$('.room_div'); 
		$($rDiv).click(function(){
			//alert($(this).attr('id'));
			var $otherRoom=$($rDiv).not(this);
			$otherRoom.find("div.room_detail").empty();
			var $detailObj = $(this).find("div.room_detail");
			
			
			
			$detailObj.html('aaaa');
		});
	 });
	 </script>
	</div>
	<div id="target" class="container">
	<p>호텔정보(제공 서비스)가 div로 쭉 나왔음ㄴ 좋겠어 아니면 테이블이나</p>
	<p></p>
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