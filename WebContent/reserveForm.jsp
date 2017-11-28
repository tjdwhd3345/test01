<%@page import="com.my.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>예약정보::CHECKIN.COM</title>

   <% request.setCharacterEncoding("utf-8"); %>   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      
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
    <!-- 결제모듈 api_아임포트 -->
   <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   <script>
      $(function(){
         var IMP = window.IMP;
         //IMP.init('imp11052305'); //가맹점식별코드
         IMP.init('imp41470527'); //가맹점식별코드
      });
   </script>
    <!-- 결제모듈 api_아임포트 끝 -->
    
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title></title>
   <style>
      nav>ul>li{display:inline-block}
      
   /* 메인 슬라이드 */
   #rolling{width:660px;  margin:0px auto; position:relative; overflow:hidden;} 
   #rolling h1{display:none;}
   #rolling div:first-of-type{width:3000px; position:relative;}
   #rolling img{width:658px; height:500px;}
   #circle{width:650px; text-align:center; margin:auto;}
   #circle i{display:inline-block; padding:5px; margin:auto 0px; border-radius:10px; cursor:pointer; font-weight: bold;}
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
                    	 if($url == undefined)	return;
                    	 if($url == 'logout.do'){   //로그아웃메뉴를 클릭하여 응답 후
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
        	//결제방식 라디오값 
            var radio=$('input[name=payment]:checked').val();
            
            IMP.request_pay({
               pg : 'jtnet',
               pay_method : radio,
               merchant_uid : 'merchant_'+ new Date().getTime(),
               name : "${param['roomname']}",
               amount : $('input[name=price]').val(),
               buyer_email : $('input[name=useremail]').val(),
               buyer_name : $('input[name=username]').val(),
               buyer_tel : '',
            }, function(rsp){
               if(rsp.success){
                  var msg = '결제가 완료되었습니다.\n';
                  //msg += '고유ID : '+rsp.imp_uid;
                  //msg += '\n상점 거래ID : '+rsp.merchant_uid;
                  msg += '\n결제 금액 : '+rsp.paid_amount;
                  //msg += '\n카드 승인번호 : '+rsp.apply_num;
                  
                  alert(msg);
                  
                  $("#rsvform").submit();
                  //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                  /*jQuery.ajax({
                     url: "/payments/complete",
                     type: 'POST',
                     dataType: 'json',
                     data: {
                        imp_uid : rsp.imp_uid,
                        //imp_key : '1578294808052559',
                        //imp_secret : '4mpFauihZ37hZy73naEBKdvRkyoBVt90PzG03Yh32pk1Ys5mCKXnXsei1DTX62XWCDWFCeIEE2GCvLY7'
                        //기타 필요한 데이터가 있으면 추가 전달
                        
                        username:$('input[name=username]').val(),
                        useremail:$('input[name=useremail]').val(),
                        hotelnum:$('input[name=hotelnum]').val(),
                        roomnum:$('input[name=roomnum]').val(),
                        checkIn:$('input[name=checkIn]').val(),
                        checkOut:$('input[name=checkOut]').val(),
                        price:$('input[name=price]').val(),
                        
                     }*/
                  /* }).done(function(data){
                     console.log("여기는 jqueyr done");
                     console.log("!!!!  "+data);
                     //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                        /*var msg = '결제가 완료되었습니다.';
                        msg += '고유ID : '+rsp.imp_uid;
                        msg += '상점 거래ID : '+rsp.merchant_uid;
                        msg += '결제 금액 : '+rsp.paid_amount;
                        msg += '카드 승인번호 : '+rsp.apply_num;
                        
                        alert(msg);
                     
                  }).fail(function(data){
                     console.log("여기는 jqeury fail");
                     console.log(data);
                  }); */
               }else{
                  var msg = '결제에 실패하였습니다.';
                  msg += '에러내용 : '+rsp.error_msg;
                  
                  alert(msg);
               }
            });
            
            
            //$("#rsvform").submit();
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
            <li class="nav-link"><%=u.getName() %>님</li>
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

   <div id="target" class="container">
      <h1>reserveForm.jsp</h1>
      <H3><strong>예약정보</strong></H3>
      <div>
         <div style="display:inline-block; width:30%; margin:0px auto; vertical-align:middle;">
            <img src="${param['roomimg'] }" width="200px" height="200px">
         </div>
         <DIV style="display:inline-block; position:relative; width:50%; margin:0px auto; vertical-align:middle;">
            <table class="table">
               <tr>
                  <td colspan="2" font-size="2rem"><b>${param['hotelname'] }</b></td>
               </tr>
               <tr><td>위치</td><td>${param['hoteladdr'] }${requestScope.hoteladdr }</td></tr>
               <tr><td>체크인날짜</td><td>${checkIn }</td></tr>
               <tr><td>체크아웃날짜</td><td>${checkOut }</td></tr>
               <!-- <tr><td>숙소 위치</td><td>${param['hoteladdr'] }</td></tr> -->
            </table>
         </DIV>
      </div>
   </div>
   <div class="tail"></div>
    <style>
	 .roomprice{font-size: 25px;color: #ed5c59;}
    </style>
   <div id="target" class="container">
      <h5><strong>객실정보</strong></h5>   
      <table class="table">
         <tr>
            <td>객실</td><td>${param['roomname'] }</td>
         </tr>
         <tr>
            <td>최대인원</td><td>${param['roombeds'] }</td>
         </tr>
         <tr>
            <td>총 금액</td>
            <fmt:parseNumber var="roomprice" type="number" value="${param['roomprice'] }"/>
            <td><span class="roomprice">${roomprice * nights }</span> 원 (${nights }박)</td>
         </tr>
      </table>
   </div>
   <div class="tail"></div>
   <div id="target" class="container">
      <h5><strong>고객님의 정보를 입력해주세요.</strong></h5>
      <form action="reserve.do" method="post" id="rsvform">
      <input type="hidden" name="hotelnum" value="${param['hotelnum'] }">
      <input type="hidden" name="roomnum" value="${param['roomnum'] }">
      <input type="hidden" name="checkIn" value="${checkIn }">
      <input type="hidden" name="checkOut" value="${checkOut }">
      <input type="hidden" name="nights" value="${nights }">
      <input type="hidden" name="price" value="${roomprice * nights}">
      
      <table class="table">
         <tr>
            <td>이름</td>
            <td><input type="text" style="width:80%;" name="username" value="${loginInfo.name }" placeholder="이름을 입력해주세요."></td>
         </tr>
         <tr>
            <td>이메일</td>
            <td><input type="email" style="width:80%;" name="useremail" value="${loginInfo.email }"placeholder="이메일을 입력해주세요."></td>
         </tr>
         <tr>
            <td>전화번호</td>
            <td><input type="text" style="width:80%;" name="useretel" placeholder="전화번호를 입력해주세요."></td>
         </tr>
         
      </table>
      
           <div id="container">
           <h5><strong>결제방식을 선택해주세요.</strong></h5>
           
           <!-- 
           <ul class="tabs">
              <li class="active" rel="card">카드</li>
              <li rel="vbank">무통장입금</li>
              <li rel="phone">휴대폰결제</li>
           </ul>
            -->
         <style>
         .tbl {width: 100% !important;}
           </style>
           <div class="tab_container">
           <div class="card mb-3">
           <div class="card-header">
              <input type="radio" id="payment" name="payment" value="card" checked>신용카드&nbsp;&nbsp;&nbsp;
              <input type="radio" id="payment" name="payment" value="vbank">무통장 입금&nbsp;&nbsp;&nbsp;
              <input type="radio" id="payment" name="payment" value="phone">휴대폰 소액결제&nbsp;&nbsp;&nbsp;
           </div>
           </div>
           </div>
      <div class="cnt_division">
         <h5 class="h_order_ntit t_creditcard"><strong>신용카드 혜택 및 무이자 혜택</strong></h5>
         <div class="inner_credit">
         <table class="credit_free tbl" summary="신용카드 혜택 및 무이자 혜택에 대한 카드회사 및 혜택보기">
            <tbody>
               <tr class="fst" data-card-free-tr="0">
                  <td data-card-free-td="0">
                     <p class="bg_card cd_06">KB국민카드</p>
                     <p class="txt">5만원 이상 구매시 <strong>2,3,4,5,6개월</strong></p>
                  </td>
                  <td data-card-free-td="1">
                     <p class="bg_card cd_01">외환카드</p>
                     <p class="txt">5만원 이상 구매시 <strong>2,3,4,5개월</strong></p>
                  </td>
                  <td data-card-free-td="2">
                     <p class="bg_card cd_11">BC카드</p>
                     <p class="txt">5만원 이상 구매시 <strong>2,3,4,5개월</strong></p>
                  </td>
                  <td data-card-free-td="3">
                     <p class="bg_card cd_34">하나카드</p>
                     <p class="txt">5만원 이상 구매시 <strong>2,3,4,5개월</strong></p>
                  </td>
               </tr>
               <tr data-card-free-tr="1">
                  <td data-card-free-td="0">
                     <p class="bg_card cd_43">씨티카드</p>
                     <p class="txt">5만원 이상 구매시 <strong>2,3개월</strong></p>
                  </td>
                  <td data-card-free-td="1">
                     <p class="bg_card cd_14">신한카드</p>
                     <p class="txt">5만원 이상 구매시 <strong>2,3,4,5,6개월</strong></p>
                  </td>
                  <td data-card-free-td="2">
                     <p class="bg_card cd_12">삼성카드</p>
                     <p class="txt">5만원 이상 구매시 <strong>2,3,4,5,6개월</strong></p>
                  </td>
                  <td data-card-free-td="3">
                     <p class="bg_card cd_04">현대카드_SUPER CLUB</p>
                     <p class="txt">5만원 이상 구매시 <strong>2,3,4,5개월</strong></p>
                  </td>
               </tr>
               <tr data-card-free-tr="2">
                  <td data-card-free-td="0">
                     <p class="bg_card cd_41">NH채움카드</p>
                     <p class="txt">5만원 이상 구매시 <strong>2,3,4,5,6개월</strong></p>
                  </td>
                  <td data-card-free-td="1"></td>
                  <td data-card-free-td="2"></td>
                  <td data-card-free-td="3"></td>
               </tr>
            </tbody>
         </table>
         </div>
      </div>
      </div>
      <center><p style="margin-top:50px;">계속 진행함으로써 <a href="#">이용약관</a> 및 <a href="#">개인정보 처리방침</a>에 동의하게 됩니다.</p></center>
      <span style="display:inline; float:right"><input type="button" class="btn info line rounded" id="reservebtn" value="진행하기"></span>
      
      </form>
      
   </div>
   <!-- card benefit stylesheet -->
   <link href="https://order.wemakeprice.com/resources/wmp/css/pages/order.css?20171121_1" rel="stylesheet">
   <style>
      button[disabled]{cursor:default}
      button::-moz-focus-inner{border:0;padding:0}
      input[type=button]{cursor:pointer;}
      
      .btn{padding:8px 30px;background-color:#325D88;border:1px solid #325D88;font-weight:300;font-size:.92em;color:#444;border-radius:2px}
      .btn.info{color:#fff;background-color:#325D88;border:1px solid #325D88}
      .btn.rounded{border-radius:10px}
      .credit_free .bg_card{background-image:url(//image.wemakeprice.com/images/2013/order/bg_card_v3.gif)}
       ul.tabs {
          margin: 0;
          padding: 0;
          float: left;
          list-style: none;
          height: 32px;
          border-left: 1px solid #eee;
          width: 100%;
          font-size:12px;
      }
      ul.tabs li {
          float: left;
          text-align:center;
          cursor: pointer;
          width:82px;
          height: 31px;
          line-height: 31px;
          border: 1px solid #eee;
          border-left: none;
          font-weight: bold;
          background: #FFFFFF;
          overflow: hidden;
          position: relative;
      }
      ul.tabs li.active {
         /* color: #0000FF; */
          background: rgba(0,0,0,.03);
          border-bottom: 1px solid #FFFFFF;
      }
   </style>
   <!-- card benefit stylesheet end -->
   <style>
   .tail {
      height: 50px;
   }
   </style>
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