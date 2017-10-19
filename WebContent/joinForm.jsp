<%@ page contentType="text/html; charset=UTF-8" %>
<title>joinForm.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	<!--jQuery-->
	$(function(){
		var idCheckFlag=false;
		var pwdCheckFlag=false;
		
		var $formObj = $("form");
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
			alert($("#email").val());
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

</script>

<form method="post" action="signup.do">
	이메일:<input id="email" name="email" type="email" value="bbb@ccc.d"><br>
	비밀번호:<input id="pwd" name="pwd" type="password" value="1234"><br>
	비밀번호 확인:<input id="pwd2" name="pwdChk" type="password">
		<span id="pwdDiv"></span><br>
	이름:<input id="name" name="name" value="모성종"><br>
	<input type="submit" value="가입">
</form>

 <%--
 ------------------------------------------------------+
 <html>
<head>
<style>
span.a {color: red;}
span.b {color: blue;}

body{ position:relative;
	   top:20px;
	   left:370px;}

</style>
<script type="text/javascript" src="request.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 주소받아오기 -->
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
</script>
<!-- 주소받아오기 끝 -->
<script type="text/javascript">
var idCheckFlag=false;
var pwdCheckFlag=false;
function a(){
	if(f1.id.value == null || f1.id.value == ""){
		alert("ID를 입력하시오");
		f1.id.focus();
	}else if(f1.pwd.value == null || f1.pwd.value == ""){
		alert("비밀번호를 입력하시오");
		f1.pwd.focus();
	}else if(f1.name.value == null || f1.name.value == ""){
		alert("이름을 입력하시오");
		f1.name.focus();
	}else if(f1.email.value == null || f1.email.value == ""){
		alert("E-MAIL을 입력하시오");
		f1.email.focus();
	}else if(!idCheckFlag){
		alert("아이디 중복체크를 하시오");
		return;
	}else if(f1.postcode.value == null || f1.postcode.value == ""){
		alert("주소를 입력하시오");
		f1.postbutton.focus();
	}else if(f1.address2.value == null || f1.address2.value == ""){
		alert("상세주소를 입력하시오");
		f1.address.focus();
	}else if(!pwdCheckFlag){
		alert("비밀번호가 일치하지 않습니다");
		f1.pwd.focus();
	}else{
		if(confirm("입력하신 정보로 가입하시겠습니까?")){
			d(1);
		}else{
			d(2);
		}
	}
	
}

function b(){
	var param="id="+f1.id.value;
	var callback=c;
	var uri="../func/index.php?action=idCheck";
	request("post", uri, callback, param);
}

function c(){
	if(httpRequest.readyState == 4){
	    if(httpRequest.status == 200){
		    var str="";
			var txt=httpRequest.responseText;	// 텍스트 형태의 일반 요소를 받아올 때, responseXML : xml형태를 받을 때
			var res=eval("("+txt+")");
			if(res.flag == "false"){
				str+="이미 사용중인 아이디 입니다";
				idCheckFlag=false;
				var myDiv = document.getElementById("idDiv");
				myDiv.setAttribute("class", "a");
			}else if(res.flag == "true"){
				str+="사용가능한 아이디 입니다";
				idCheckFlag=true;
				var myDiv = document.getElementById("idDiv");
				myDiv.setAttribute("class", "b");
			}
			myDiv.innerHTML="";
			myDiv.innerHTML=str;
	    }
	}
}

function p(){
    var pwd=document.getElementById("pwd").value;
    var pwd2=document.getElementById("pwd2").value;
    var pwdDiv=document.getElementById("pwdDiv");
    
    if(pwd == pwd2){
		pwdDiv.innerHTML="비밀번호가 일치합니다";
		pwdDiv.setAttribute("class", "b");
		pwdCheckFlag=true;
    }else{
		pwdDiv.innerHTML="비밀번호 불일치";
		pwdDiv.setAttribute("class", "a");
		pwdCheckFlag=false;
    }
}
function e(){
    var email=document.getElementById("email");
    var email1=document.getElementById("email1");
    var email2=document.getElementById("email2");
    var email3=document.getElementById("email3");
	email3.value=email2.value;
	email.value=email1.value+"@"+email3.value;
}
function d(t){
	if(t==1){
		f1.submit();
	}else if(t==2){
		alert("전송 취소");
	}
}

</script>
</head>
<body>
<a href="../../main/home/index.php"><img src="../../main/home/home_logo.png" style="width:174px; height:41px;"></a>
	<form name="f1" action="../func/index.php?action=join" method="post">
		<table border="0" cellspacing="10">
			<caption>
				<b>회원가입</b>
			</caption>
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" placeholder="ID" onchange="b()">
					<span id="idDiv"></span></td>
			</tr>
			<tr>
				<td>PWD</td>
				<td><input type="password" id="pwd" name="pwd" placeholder="PASSWORD"></td>
			</tr>
			<tr>
				<td>PWD CHECK</td>
				<td><input type="password" id="pwd2" name="pwd2" placeholder="PASSWORD CHECK" onchange="p()">
					<span id="pwdDiv"></span></td>
			</tr>
			<tr>
				<td>NAME</td>
				<td><input type="text" name="name" placeholder="NAME"></td>
			</tr>
			<tr>
				<td>H.P</td>
				<td><input type="text" name="hp" placeholder="PHONE"></td>
			</tr>
			<tr>
				<td>E-MAIL</td>
				<td><input type="text" id="email1" name="email1" placeholder="E-MAIL">@
					<input type="text" id="email3" name="email3" placeholder="example.com" size="8">
					<select id="email2" name="email2" style="height:25px;" onchange="e()">
						<option>직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
					<input type="hidden" id="email" name="email">
				</td>
			</tr>
			<tr>
				<td>ADDRESS</td>
				<td>
				<input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호" readonly>
				<input type="button" name="postbutton" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" name="address1" placeholder="주소" readonly>
				<input type="text" id="sample6_address2" name="address2" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="가입" onclick="a()"> <input type="reset" value="취소"></td>
			</tr>
		</table>
		<input type="hidden" name="type" value="<?=$_REQUEST['memtype'];?>">
	</form>
</body>
</html>
 --%>