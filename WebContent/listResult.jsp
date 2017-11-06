<%@page import="com.my.vo.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.my.vo.HotelList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	<title>::HOTELBOOK</title>
	<style>
		nav>ul>li{display:inline-block}
	</style>
	<!-- bootstrap end -->
	
	<!-- 달력 css -->
	<script src="http://getbootstrap.com/dist/js/bootstrap.js"></script>
	<script src="http://kylemitofsky.com/libraries/libraries/bootstrap-datepicker.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment-with-locales.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://kylemitofsky.com/libraries/libraries/datepicker.css">
	<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="http://getbootstrap.com/dist/css/bootstrap.css">
	<!-- 달력 css 끝 -->
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Hotel List</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- 
	<script>
		$(function() {
			$.getJSON('./public_data.json', function(data) {
				var html = []; 
				$.each(data, function(i, item) {
					var col=item.header.columns[0];
					html.push('<div >');
					html.push('<table border="1">');
					html.push('<tr>');
					html.push('<th>'+col.rowNum+'</th>');	//번호
					html.push('<th>'+col.bplcNm+'</th>');	//사업장명
					html.push('<th>'+col.siteWhlAddr+'</th>');	//소재지주소
					html.push('<th>'+col.rdnWhlAddr+'</th>');	//도로명전체주소
					html.push('</tr>');
					var rowL=item.body.rows[0].row.length;
					//if(item.body.rows[0].row.siteWhlAddr.contains)
					for(var i=0; i<rowL; i++){
						html.push('<tr>');
						html.push('<td>'+ item.body.rows[0].row[i].rowNum + '</td>');
						html.push('<td>'+ item.body.rows[0].row[i].bplcNm + '</td>');
						html.push('<td>'+ item.body.rows[0].row[i].siteWhlAddr + '</td>');
						html.push('<td>'+ item.body.rows[0].row[i].rdnWhlAddr + '</td>');
						html.push('</tr>');
					}
					html.push('</table>');
					html.push('</div>');
					//html.push('<li id="' + key + '">' + val + '</li>');
					});
				console.log(html); 
				$('#target').html(html.join(''));
			});
		});
	</script>
	 -->
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
			$("#test").submit(function(){
				//var $d=$("#searchValue").val()+$("#search").val();
				var $d=$('.hosearch').serialize();
				$('hosearch').submit();
			});//end click
			
			
			//달력
			var nowTemp = new Date();
			 var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

			 var checkin = $('#checkIn').datepicker({

			   beforeShowDay: function(date) {
			     return date.valueOf() >= now.valueOf();
			   },
			   autoclose: true

			 }).on('changeDate', function(ev) {
			   if (ev.date.valueOf() > checkout.datepicker("getDate").valueOf() || !checkout.datepicker("getDate").valueOf()) {

			     var newDate = new Date(ev.date);
			     newDate.setDate(newDate.getDate() + 1);
			     checkout.datepicker("update", newDate);

			   }
			   $('#checkOut')[0].focus();
			 });


			 var checkout = $('#checkOut').datepicker({
			   beforeShowDay: function(date) {
			     if (!checkin.datepicker("getDate").valueOf()) {
			       return date.valueOf() >= new Date().valueOf();
			     } else {
			       return date.valueOf() > checkin.datepicker("getDate").valueOf();
			     }
			   },
			   autoclose: true

			 }).on('changeDate', function(ev) {});
			 //달력 끝
			 
			 
			 
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
    
    <!-- 검색기능하고나서 나중에 상단에 서치바도 배치해야됨. -->
    <div> 
    <!-- Page Content -->
        <div class="container">
        <form action="list.do" method="post" class="hosearch">
			<select name="search">
				<option value="loc">지역</option>
				<option value="name">이름</option>
			</select>
			<input type="text" id="searchValue" name="searchValue">
			<div class="form-group" style="float:left">
  <input id="checkIn" type="text" class="form-control clickable input-md" id="DtChkIn" placeholder="&#xf133;  Check-In">
</div>

			&nbsp;&nbsp;
<div class="form-group" style="float:left">
  <input id="checkOut" type="text" class="form-control clickable input-md" id="DtChkOut" placeholder="&#xf133;  Check-Out">
</div>
			<input type="submit" value="검색" id="test">
		</form>
		<!-- <input type="button" id="test" value="test">--><!-- hotel list를 불러와라 -->
        </div>
    </div> 
    
	<div id="target" class="container">
	
		<table border="1" style="margin-top:100px; margin-bottom:50px;">
			<tr class="bg-dark" style="color:#FFFFFF" align="center">
				<c:forEach var="values" items="${hList}">
					<th>${values.rowNum}</th>
					<th>${values.bplcNm}</th>
					<th>${values.siteWhlAddr}</th>
					<th>${values.rdnWhlAddr}</th>
				</c:forEach>
			</tr>
			<c:set var="seV" value="${param['searchValue']}"/>
			<form action="detail.do" method="post" id="fd">
			<c:forEach var="values" items="${hList2}">
			<tr>
				<!-- 검색 키워드가 장소인지 이름인지 -->
				<c:choose>
					<c:when test="${param['search'] eq 'loc'}">
						<c:set var="site" value="${values.siteWhlAddr}"/>
					</c:when>
					<c:when test="${param['search'] eq 'name'}">
						<c:set var="site" value="${values.bplcNm}"/>
					</c:when>
				</c:choose>
				<!-- 검색 키워드를 포함한 업체만 출력 -->
				<c:if test="${fn:contains(site, seV)}">
					<td>${values.rowNum}</td>
					<td><a href="#" id="dd" 
					onclick="window.open('detail.do?num=${values.rowNum}&name=${values.bplcNm}&x=${values.x}&y=${values.y}&addr=${values.siteWhlAddr}')">
						${values.bplcNm}</a></td>
					<td>${values.siteWhlAddr}</td>
					<td>${values.rdnWhlAddr}</td>
				</c:if>
			</tr>
			</c:forEach>
			</form>
		</table>
		<script>
		/* function wo(){
			
			window.open('detail.do');
		} */
		/*		 
		$(function(){
			var $form=$('#fd');
			$('#dd').click(function(){
				var d=$($form).serialize();
				var u='detail.do';
				$.ajax({
					url:u,
					data:d,
					method:'post',
					success:function(){
						window.open(u);
					}
				});
				return false;
			});
		});
		*/
		</script>
		
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