<%@page import="com.my.vo.User"%>
<%@page import="com.my.vo.HotelList"%>
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
	<title>::CHECKIN.COM</title>
	<style>
		nav>ul>li{display:inline-block}
	</style>
	<!-- bootstrap end -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- 달력 css -->
	<script src="http://getbootstrap.com/dist/js/bootstrap.js"></script>
	<script src="http://kylemitofsky.com/libraries/libraries/bootstrap-datepicker.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment-with-locales.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://kylemitofsky.com/libraries/libraries/datepicker.css">
	<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
	<!-- <link rel="stylesheet" type="text/css" href="http://getbootstrap.com/dist/css/bootstrap.css"> -->
	<!-- 달력 css 끝 -->
	
	<!-- paging -->
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#paging').DataTable();
		} );
	</script>
	<script type="text/javascript" src="http://cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js" ></script>
	<script type="text/javascript" src="http://cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.js" ></script>
	<!-- paging End -->
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Hotel List</title>
	
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
								if($url == undefined)	return;
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
			
			//달력 jquery
			var nowTemp = new Date();
			 var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
			  
			 var checkin = $('#checkIn').datepicker({
			   onRender: function(date) {
			     return date.valueOf() < now.valueOf() ? 'disabled' : '';
			   }
			 }).on('changeDate', function(ev) {
			   if (ev.date.valueOf() > checkout.date.valueOf()) {
			     var newDate = new Date(ev.date)
			     newDate.setDate(newDate.getDate() + 1);
			     checkout.setValue(newDate);
			   }
			   checkin.hide();
			   $('#checkOut')[0].focus();
			 }).data('datepicker');
			 var checkout = $('#checkOut').datepicker({
			   onRender: function(date) {
			     return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
			   }
			 }).on('changeDate', function(ev) {
			   checkout.hide();
			 }).data('datepicker');
			 
			 
			//$(".hosearch").click(function(){
			$("#test").click(function(){
				//var $d=$("#searchValue").val()+$("#search").val();
				var date1 = new Date($("#checkIn").val());
				var date2 = new Date($("#checkOut").val());
				var nights=(date2-date1) / 1000 / 60 / 60 / 24;
				//alert(nights);
				$("#nights").val(nights);
				//alert($("#nights").val());
					
				var $d=$('.hosearch').serialize();
				$('.hosearch').submit();
						
			});//end click
			
		});
	</script>
	<style>
	input {
	  padding:10px;
	  font-family: FontAwesome, "Open Sans", Verdana, sans-serif;
	  font-style: normal;
	  font-weight: normal;
	  text-decoration: inherit;
	  border-radius: 0 !important;
	}
	
	.form-control {
	  border-radius: 0 !important;
	  font-size: 12x;
	}
	
	.clickable { cursor: pointer; }
	</style>	
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
            <li class="nav-link"><%=u.getName() %>님</li>
            <li class="nav-item" id="reserveList.do">
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
      
      <!-- 상단고정 검색바 -->
      <div class="carousel-caption d-none d-md-block" style="text-align:center; left:0px;width:100%; height:80px;">
        <form action="list.do" method="post" class="hosearch" style="display:inline-block; vertical-align:middle;">
        	<!-- check-in -->
			<div class="form-group" style="float:left">
				<input name="checkIn" id="checkIn" type="text" class="form-control clickable input-md" id="DtChkIn" placeholder="&#xf133;  Check-In" value="${sessionScope.checkIn }">
			</div>
			&nbsp;&nbsp;
			<!-- check out -->
			<div class="form-group" style="float:left">
				<input name="checkOut" id="checkOut" type="text" class="form-control clickable input-md" id="DtChkOut" placeholder="&#xf133;  Check-Out" value="${sessionScope.checkOut }">
			</div>
			
			<select name="search" id="search" class="form-control clickable input-md" style="display:inline; width:100px">
				<c:set var="searchcate" value="${param['search'] }"/>
				<option value="loc" <c:if test="${searchcate eq 'loc' }"> selected</c:if>>
				지역</option>
				<option value="name" <c:if test="${searchcate eq 'name' }"> selected</c:if>>
				이름</option>
			</select>
			<input type="text" id="searchValue" name="searchValue" style="height:38px; width:400px" placeholder="지역 또는 호텔명을 입력해주세요" value="${param['searchValue']}">
			<input type="hidden" id="nights" name="nights">
			<input type="button" value="검색" id="test" style="height:38px; text-align:center">
		</form>
		</div>
		<!-- 상단고정 검색바 끝 -->
		
    </nav>
    
    <style>
    .tail{height: 150px;}
    .carousel-caption {
                 /*opacity : 0.6;*/
                 background:rgba(112,112,112,1);
                 /*background:rgba(100,100,100,0.6);*/
                 filter: alpha(opacity=60);
                 -moz-opacity:0.6;
                 -khtml-opacity: 0.6;
                 position:absolute;
                 top:50px;
                }
    .shadow{
    	transition-property:box-shadow;
    	transition-duration:0.2s;
   		transition-timing-function:ease-in-out;
    	transition-delay:initial;
    }
    .shadow:hover{
    	box-shadow:10px 10px 5px #888888;
    }
    table{
    	 border-collapse:seperate !important;
    	 border-spacing:0px 20px;
    }
    .solid{border:1px solid #ddd;}
    .pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
	    z-index: 2;
	    color: #fff;
	    cursor: default;
	    background-color: #325D88;
	    border-color: #325D88;
	}
	.pagination>li>a, .pagination>li>span {
	    position: relative;
	    float: left;
	    padding: 6px 12px;
	    margin-left: -1px;
	    line-height: 1.42857143;
	    color: #337ab7;
	    text-decoration: none;
	    background-color: #fff;
	    border: 1px solid #ddd;
	}
	
    </style>
    <div class="tail"></div>
    
    <div class="container" style="display:block;">
		<table class="cell" style="margin-bottom:50px;" id="paging">
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<c:set var="seV" value="${param['searchValue']}"/>
			<form action="detail.do" method="post" id="fd">
			<tbody>
			<c:forEach var="values" items="${hList2}">
				<%-- 검색 키워드가 장소인지 이름인지 --%>
				<c:choose>
					<c:when test="${searchcate eq 'loc'}">
						<c:set var="site" value="${values.siteWhlAddr}"/>
					</c:when>
					<c:when test="${searchcate eq 'name'}">
						<c:set var="site" value="${values.bplcNm}"/>
					</c:when>
				</c:choose>
				<%-- 검색 키워드를 포함한 호텔만 출력 --%>
				<c:if test="${fn:contains(site, seV)}">
				<tr class="shadow" bgcolor="#F7F7F7"; style="border:1px solid #ddd; cursor:pointer;" onclick="window.open('detail.do?num=${values.rowNum}&name=${values.bplcNm}&x=${values.x}&y=${values.y}&addr=${values.siteWhlAddr}')">
					<td class="solid" style="margin:0px; padding:0px;">
						<c:forEach var="himg" items="${requestScope.hList3}">
							<c:if test="${himg.no eq values.rowNum}">
									<img src="${himg.img}" width="228px" height="228px">
							</c:if>
						</c:forEach>
					</td>
					<style>
					.hotel-div{height:100%}
					.hotel-info, .hotel-promotion, .hotel-teaser{
						padding:7px 10px 7px 15px;
						margin-bottom:15px;
					}
					.hotel-info span{display:block;}
					.hotel-name{font-size:1.5rem;font-weight:700;}
					.hotel-adr{color:#0283df;font-size:1.0rem;font-weight:400;}
					.member-event{
						display:inline;
						font-size:11px;
						font-weight:300;
						color:#6a4ba7;
					}
					.pill-container {list-style:none; padding-left:0px; margin-bottom:0px;}
					.pill-container li{display:inline;font-size:13px;font-weight:600; padding:2px 3px 2px 3px;}
					.pill-title1{background-color:#63c355; color:#fff;}
					.pill-content1{color:#63c355;}
					.pill-title2{background-color:#f57c00; color:#fff;}
					.pill-content2{color:#f57c00;}
					</style>
					<td class="solid" style="min-width:520px;">
						<div class="hotel-div">
						<div class="hotel-info">
							<span class="hotel-name">${values.bplcNm}</span>
							<i class="ficon ficon-pin-star" data-selenium="area-city-map"></i>
							<span class="hotel-adr">${values.siteWhlAddr}<span>
						</div>
						<div class="hotel-teaser">
							<ul class="pill-container">
								<li class="pill-title1">이용가능</li>
								<li class="pill-content1">주차</li>
							</ul>
							<ul class="pill-container">
								<li class="pill-title2">예약옵션</li>
								<li class="pill-content2">예약 무료 취소</li>
							</ul>
						</div>
						<div class="hotel-promotion">
							<i class="ficon ficon-10 ficon-pointsmax pricing-badges-circle-border pricing-badges-icon" data-selenium="points-max-icon"></i>
							<span class="member-event">회원을 위한 멤버십 포인트 적립이벤트 진행중!</span>
						</div>
						</div>
					</td>
					<td class="solid" bgcolor="#FFFFFF" style="text-align:center; width:180px; min-width:180px;">
						<c:forEach var="scopri" items="${requestScope.hList3}">
							<c:choose>
							<c:when test="${scopri.no eq values.rowNum}">
								<span id="avgscore">${scopri.score}<span><br>
								₩<span id="minprice"> ${scopri.price} </span>원
							</c:when>
							</c:choose>
						</c:forEach>
					</td>
					</tr>
				</c:if>
			</c:forEach>
			</tbody>
			</form>
		</table>
		<style>
		span#minprice{
			color:#ee595d;
			font-weight:bold;
			font-size:20px;
		}
		</style>
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
	<div style="height:50px;"></div>
	<!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>
</body>
</html>