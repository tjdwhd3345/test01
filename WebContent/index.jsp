<%@page import="com.my.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <!-- bootstrap end -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.js"></script>
<script src="http://kylemitofsky.com/libraries/libraries/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment-with-locales.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://kylemitofsky.com/libraries/libraries/datepicker.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="http://getbootstrap.com/dist/css/bootstrap.css">
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
	//$(".hosearch").click(function(){
	$("#test").click(function(){
		//var $d=$("#searchValue").val()+$("#search").val();
		var $d=$('.hosearch').serialize();
		$('.hosearch').submit();
	});//end click
});
</script>
<script>
 $(function(){
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
 });
</script>
<script>
$(function(){
	$('#bookAdd').click(function(){
		var $checkIn = $('#checkIn').val();
		var $checkOut = $('#checkOut').val();
		
		$.ajax({
			url:"book.do",
			type:"POST",
			data:{"checkIn":$checkIn, "checkOut":$checkOut},
			success:function(data){
				var jsonObj = JSON.parse(data);
				if(jsonObj.status==1){
					msg="Check_In: "+$checkIn+"Check_Out: "+$checkOut
					window.location.href="datepickerNext.jsp";
				}else{
					msg="날짜를 다시 선택해 주세요";
				}
				alert(msg);
			}
		});
	});
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
<title>MOMO</title>
</head>
<body>
	<h1>여기는 index.jsp가 분명하다</h1>
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
            <%} %>
          </ul>
        </div>
      </div>
    </nav>
    
    
     <header>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('hotel03_copy.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<form action="list.do" method="post" class="hosearch">
							<!-- check-in -->
							<div class="form-group" style="float: left">
								<input name="checkIn" id="checkIn" type="text"	class="form-control clickable input-md" placeholder="&#xf133;  Check-In">
							</div>
							&nbsp;&nbsp;
							<!-- check-out -->
							<div class="form-group" style="float: left">
								<input name="checkOut" id="checkOut" type="text" class="form-control clickable input-md" placeholder="&#xf133;  Check-Out">
							</div>
							
							<select name="search" id="search">
								<option value="loc">지역</option>
								<option value="name">이름</option>
							</select>
							<input type="text" id="searchValue" name="searchValue">
							<input type="button" value="검색" id="test">
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
    <section class="py-5">
        <div class="container">
        
        </div>
    </section>
        <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>
</body>
</html>


