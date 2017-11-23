<%@page import="com.my.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>후기작성::CHECKIN.COM</title>

	<% request.setCharacterEncoding("utf-8"); %>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
	<!-- bootstrap start -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="BootTestCss/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <link rel="stylesheet" href="../_assets/css/custom.min.css">
    
    <!-- Bootstrap core JavaScript -->
    <script src="BootTestCss/vendor/jquery/jquery.min.js"></script>
    <script src="BootTestCss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <!-- rating -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="BootTestCss/vendor/bootstrap/css/rating.css" rel="stylesheet">
	<link href="BootTestCss/vendor/bootstrap/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
	 
	<!-- optionally if you need to use a theme, then include the theme file as mentioned below -->
	<link href="BootTestCss/vendor/bootstrap/themes/krajee-svg/theme.css" media="all" rel="stylesheet" type="text/css" />
	 
	<script src="BootTestCss/vendor/bootstrap/js/star-rating.js" type="text/javascript"></script>
	 
	<!-- optionally if you need to use a theme, then include the theme file as mentioned below -->
	<script src="BootTestCss/vendor/bootstrap/themes/krajee-svg/theme.js"></script>
	 
	<!-- optionally if you need translation for your language then include locale file as mentioned below -->
	<script src="BootTestCss/vendor/bootstrap/js/locales/ko.js"></script>
    <!-- rating End -->
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<style>
		nav>ul>li{display:inline-block}
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
	   height: 63.5px;
	}
	.form-control[readonly]{
		background-color:#FFFFFF;
	}
	</style>
	<div id="target" class="container">
	<div class="tail"></div>
	
	<form action="review.do" method="post" name="reviewForm">
	<input type="hidden" name="reviewhotel" value="${requestScope.reserve.hotelno }">
	<input type="hidden" name="reviewroom" value="${requestScope.reserve.roomno }">
  <fieldset>
    <legend>후기작성</legend><Br>
    <div class="form-group">
      <label for="InputEmail1">이메일</label>
      <input type="email" class="form-control" name="reviewemail" id="exampleInputEmail1" aria-describedby="emailHelp" value="${sessionScope.loginInfo.email }">
    </div>
    <div class="form-group">
      <label for="InputWriter">작성자</label>
      <input type="text" class="form-control" name="reviewname" id="exampleInputPassword1" value="${requestScope.reserve.bookname }">
    </div>
    <div class="form-group">
      <label for="InputRoom">이용방이름</label>
      <input type="text" class="form-control" name="roomname" id="exampleInputPassword1" value="${requestScope.reserve.hotelname }">
    </div>
    
    
    <fieldset class="form-group">
      <label for="InputRating">평점</label>
      <input id="input-5" value="" name="score" type="text" class="rating" data-min=0 data-max=5 data-step=0.5 data-size="xs" title="">
      <i class="glyphicon glyphicon-star"></i>
    </fieldset>
    
    <div class="form-group">
      <label for="exampleTextarea">후기 내용</label>
      <textarea class="form-control" id="exampleTextarea" name="content" rows="5" style="resize: none;"></textarea>
    </div>
    <br>
    <input type="button" name="reviewbtn" value="작성완료" class="btn btn-primary" style="background-color: #325D88; border-color: #325D88;">
  </fieldset>
</form>
</div>
<script>
        jQuery(document).ready(function () {
            var $inp = $('#rating-input');

            $inp.rating({
                min: 0,
                max: 5,
                step: 1,
                size: 'lg',
                showClear: false
            });

            $('#btn-rating-input').on('click', function () {
                $inp.rating('refresh', {
                    showClear: true,
                    disabled: !$inp.attr('disabled')
                });
            });


            $('.btn-danger').on('click', function () {
                $("#kartik").rating('destroy');
            });

            $('.btn-success').on('click', function () {
                $("#kartik").rating('create');
            });

            $inp.on('rating.change', function () {
                alert($('#rating-input').val());
            });


            $('.rb-rating').rating({
                'showCaption': true,
                'stars': '3',
                'min': '0',
                'max': '3',
                'step': '1',
                'size': 'xs',
                'starCaptions': {0: 'status:nix', 1: 'status:wackelt', 2: 'status:geht', 3: 'status:laeuft'}
            });
        });
    </script>
<script>
	$(function(){
		$("input[name=reviewbtn]").click(function(){
			var score=$("#input-5").val();
			var ta=$("textarea").val();
			
			if(score == "" || score == null){
				alert("평점을 선택해주세요.");
				return false;
			}
			if(!ta){
				alert("후기 내용을 입력해주세요.");
				return false;
			}
			$("form[name=reviewForm]").submit();
		})
	})
</script>
	
	<div class="tail"></div>
	<!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>
    <!-- Footer end -->
</body>
</html>