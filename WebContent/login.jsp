<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
	<form id="lgi" method="post" action="login.do">
		이메일 : <input type="email" name="email" value="aaa@bbb.c"><br>
		비밀번호 : <input type="password" name="pwd" value="1234"><br>
	<input type="submit" value="로그인">  
</form> 
</body>
</html>