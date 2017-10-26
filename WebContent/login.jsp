<%@page import="com.my.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
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
    
	<title>Sign in!</title>
</head>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
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
	
	
	


<script type="text/javascript">
	$(function(){
		var $form=$("#lgi");
		var $url=$($form).attr("action");
		var $method=$($form).attr("method");
		
		$($form).submit(function(event){
			var d = "email="+$("form>input[name=email]").val();
			d += "&pwd="+ $("form>input[name=pwd]").val();
			
			var s = function(responseData){
				var jsonObj = JSON.parse(responseData);
				var msg="";
		    	if(jsonObj.msg == 1) {
					msg ="로그인 성공";
		    		$(location).attr("href", "index.jsp");
				} else {
					msg ="로그인 실패";
				}
		    	window.alert(msg);	//경고창 띄우기
		    	//$(location).attr("href", "index.jsp");
			}
			
			$.ajax({
				url:$url,
				method:$method,
				data:d,
				success:s
			});
			
			return false;	//기본 이벤트 처리 막기
		});
	});
</script>
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
            <%} %>
          </ul>
        </div>
      </div>
    </nav>
    

	
	<!-- Page Content -->
    <section class="py-5">
        <div class="container">
        
	<form class="form" id="lgi" method="post" action="login.do">
		이메일 : <input type="email" name="email" value="aaa@bbb.c"><br>
		비밀번호 : <input type="password" name="pwd" value="1234"><br>
		<input type="submit" value="로그인">  &nbsp;&nbsp; 아직 회원이 아니신가요? <a href="joinForm.jsp">회원가입</a>
	</form> 
        </div>
        
        <div id="result"></div>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naver_id_login"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("5CumGJVMJyZ2nBi_0uRn",
			"http://127.0.0.1:8080/test01/callback.jsp");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2, 40);
	naver_id_login.setDomain("http://127.0.0.1:8080/test01");
	naver_id_login.setState(state);
	//alert(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>

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