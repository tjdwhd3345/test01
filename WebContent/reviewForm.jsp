<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
reviewForm.jsp
<form action="review.do" method="post" name="reviewForm">
	<input type="hidden" name="reviewhotel" value="${requestScope.reserve.hotelno }">
	<input type="hidden" name="reviewroom" value="${requestScope.reserve.roomno }">
	작성자이름<input type="text" name="reviewname" value="${requestScope.reserve.bookname }" readonly><br>
	작성자이메일<input type="text" name="reviewemail" value="${sessionScope.loginInfo.email }" readonly><br>
	이용방이름<input type="text" name="roomname" value="${requestScope.reserve.hotelname }" readonly><br>
	평점
	<input type="radio" name="score" value="1.0">1
	<input type="radio" name="score" value="2.0">2
	<input type="radio" name="score" value="3.0">3
	<input type="radio" name="score" value="4.0">4
	<input type="radio" name="score" value="5.0">5
	<br>
	후기내용<textarea rows="20" cols="35" name="content"></textarea><br>
	
	<input type="button" name="reviewbtn" value="작성완료">
</form>
<script>
	$(function(){
		$("input[name=reviewbtn]").click(function(){
			var radio=$("input[type=radio]:checked").val();
			var ta=$("textarea").val();
			
			if(!radio){
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
</body>
</html>