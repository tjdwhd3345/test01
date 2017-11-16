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
    
	<title>SIGN-IN/SIGN-UP::CHECKIN.COM</title>
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
	</script><!-- 상단 index -->
	
	<script><!-- login -->
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
		</script><!-- login -->
		
		<script type="text/javascript"><!-- login -->
			$(function(){
				var $form=$("#lgi");
				var $url=$($form).attr("action");
				var $method=$($form).attr("method");
				
				$($form).submit(function(event){
					var d = "email="+$("form>label>input[name=email]").val();
					d += "&pwd="+ $("form>label>input[name=pwd]").val();
					
					var s = function(responseData){
						var jsonObj = JSON.parse(responseData);
						var msg="";
				    	if(jsonObj.msg == 1) {
							msg ="로그인 성공";
				    		//$(location).attr("href", "index.jsp");
				    		window.history.back();
						} else {
							msg ="아이디 또는 비밀번호를 확인해주세요.";
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
		</script><!-- login -->
		
		<script><!--   sign up -->
		<!--jQuery-->
		$(function(){
			var idCheckFlag=false;
			var pwdCheckFlag=false;
			
			var $formObj = $("#signform");
			$($formObj).submit(function(){
				if(pwdCheckFlag == false){
					alert("비밀번호를 확인해주세요.");
					return false;
				}
				var u = $($formObj).attr("action");
				var m = $($formObj).attr("method");
				var d = $($formObj).serialize();
				var s = function(responseData){
					var jsonObj=JSON.parse(responseData.trim());
					alert(jsonObj.msg);
					if(jsonObj.msg == "가입성공"){
						location.href="index.jsp";
					}
				}
				$.ajax({
					url : u,
					method : m,
					data : d,
					success : s
				});
				return false;
			});
			
			<%--이메일체크--%>
			var $email=$("#email");
			$("#email").change(function(){
				//alert($("#email").val());
				//var u=
			});
			
			<%--비밀번호 체크--%>
			$("#pwd2").change(function(){
				var msg="";
				if($("#pwd").val() == $("#pwd2").val()){
					msg="비밀번호가 일치합니다.";
					$("#pwdDiv").css("color", "blue");
					$("#pwdDiv").html(msg);
					pwdCheckFlag=true;
					
				}else{
					msg="비밀번호가 일치하지 않습니다.";
					$("#pwdDiv").css("color", "red");
					$("#pwdDiv").html(msg);
					pwdCheckFlag=false;
				}
			});
		});
		</script><!-- sign up -->
		
		<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans'>
		<link rel="stylesheet" href="EJcss/style.css">
	
	

<body>

	<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp"> CHECKIN.COM </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
    </nav>
    
<!-- 로그인/회원가입 -->
   <style>
	.top {
	   height: 130px;
	}
	</style>
	<div class="top"></div>
	<p class="tip"></p>
	
	<div class="cont" style="display: block;">
	<div class="form sign-in">
		<h2>Member Login</h2>
		 
		<form class="form" id="lgi" method="post" action="login.do">
		<label>
			<span>Email</span>
		    <input type="email" name="email" value="aaa@aaa.a">
		</label>
	    
		<label>
			<span>Password</span>
		    <input type="password" name="pwd" value="1234">
		</label>
	
		<Button type="submit" value="Login" class="submit">Login</button>
		</form>
	</div><!-- form sign-in 끝 -->
  
	<div class="sub-cont">
	    <div class="img">
		    <div class="img__text m--up">
				<h2>New here?</h2>
		    	<p>Sign up and discover great amount of new opportunities!</p>
		    </div><!-- img__text m--up 끝 -->
		      
			<div class="img__text m--in">
				<h2>One of us?</h2>
				<p>If you already has an account, just sign in. We've missed you!</p>
			</div><!-- img__text m--in 끝 -->
		      
			<div class="img__btn">
				<span class="m--up">Sign Up</span>
				<span class="m--in">Sign In</span>
			</div><!-- img__btn 끝 -->
		</div><!-- img 끝 -->
	    
		<div class="form sign-up">
		<form id="signform" method="post" action="signup.do">
			<h2>Member Join</h2>
				<label>
				<span>Email</span>
				<input id="email" name="email" type="email" value="bbb@bbb.b">
				</label>
				
				<label>
				<span>Password</span>
				<input id="pwd" name="pwd" type="password">
				</label>
				
				<label>
				<span>REPassword</span>
				<input id="pwd2" name="pwdChk" type="password">
				<span id="pwdDiv"></span>
				</label>
				
				<label>
				<span>Name</span>
				<input id="name" name="name" value="모성종">
				</label>
				<Button type="submit" class="submit" value="Sign up">Sign up</button>
		</form>
		
		</div><!-- form sign-up 끝 -->
	</div><!-- sub-cont 끝 -->
</div>

<script src="EJjs/index.js"></script>
<style>
.push {
   height: 24px;
}
</style>
<div class="push"></div>
	
	<!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>
</body>
</html>