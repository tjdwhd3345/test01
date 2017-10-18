<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>naverlogin.jsp</title>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
 function logout() {
  // 로그아웃 아이프레임
  $("body").append("<iframe id='logoutIframe' style='display: none;'></iframe>");
  $("#logoutIframe").attr("src", "http://nid.naver.com/nidlogin.logout");
  // 로그아웃 처리
  $("#naver_id_login").show();
  $("#naver_id_logout").hide();
 }
</script>
</head>
<body>
  <div data-role="header" id="pHead">
   <h1>WELCOME</h1>
  </div>
  <div data-role="main" class="ui-content">
   <p>WELCOME MAIN - NAVER LOGIN</p>
   
   <!-- 네이버아이디로 로그인 버튼 노출 영역 -->
   <div id="naver_id_login"></div>
   <!-- //네이버아이디로 로그인 버튼 노출 영역 -->
   
   <!-- 로그인 한 경우 -->
   <div id="naver_id_logout" style="display: none;">
    <a href="#" onclick="logout();">로그아웃</a>
    <h1>로그인성공</h1>
    <!-- 로그인 사용자 정보출력 -->
    <div id="dvLogin">
       
    </div>
    <!-- 로그인 사용자 정보출력 끝 -->
   </div>
   <!-- 로그인 한 경우 -->
   <!-- 네이버아디디로로그인 초기화 Script -->
   <script type="text/javascript">
   var naver_id_login = new naver_id_login("5CumGJVMJyZ2nBi_0uRn", "http://127.0.0.1:8080/test01/callback2.html");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("white", 2, 40);
    naver_id_login.setDomain("127.0.0.1:8080/test01/");
    naver_id_login.setState(state);
    naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();
   </script>
   <!-- // 네이버아이디로로그인 초기화 Script -->

  </div>
</body>
</html>