<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var count=0;
		$("#circle>i").eq(0).css("background", "#E8F5FF");

		/*자동롤링 start*/
		setInterval(function(){
			count++;
			if($("#rolling>div:eq(0)").position().left == -1800){
				$("#rolling>div:eq(0)").append('<img src="hotel01_.jpg" alt="롤링이미지">').animate({left:"-=660px"},
						function(){
							$("#rolling>div:eq(0)").css({"left" : 0});
							$("#rolling>div:eq(0)>img").last().remove();
						});
				count=0;
				$("#circle>i").eq(count).css("background", "#E8F5FF").siblings().css("background", "none");
			}
		},2000);

		/* 자동롤링 end */
		var change=0;
		$("#circle>i").click(function(){
			//alert($(this).index());
			var me = $(this).index();
			change = (me * (-660)) + "px";
			$("#rolling>div:eq(0)").animate({left:change});
			$("#circle>i").eq(me).css("background", "#E8F5FF").siblings().css("background", "none");
		});
	});
</script>
<style>
	/* 메인 슬라이드 */
	#rolling{width:660px;  margin:auto; position:relative; overflow:hidden;} 
	#dog1{width:200px; height:500px;}
	#rolling h1{display:none;}
	#rolling div:first-of-type{width:3000px; position:relative;}
	#rolling img{width:660px; height:500px;}
	#circle{width:650px; text-align:center; margin:auto;}
	#circle i{display:inline-block; padding:5px; margin:auto 0px; border-radius:10px; cursor:pointer; font-weight: bold;}
</style>

<div class="top_wrap">
	<section id="rolling">
		<h1>롤링 이미지</h1>
		<div>
			<img src="hotel01_.jpg" alt="롤링이미지1"><img src="hotel03_copy.jpg" alt="롤링이미지2">
			<img src="hotel04_.jpg" alt="롤링이미지3"><img src="hotel01_.jpg" alt="롤링이미지4">
		</div>
		<div id="circle">
			<i><img src="hotel01_.jpg" alt="롤링이미지1" style="width:100px; height:100px;"></i>
			<i><img src="hotel03_copy.jpg" alt="롤링이미지1" style="width:100px; height:100px;"></i>
			<i><img src="hotel04_.jpg" alt="롤링이미지1" style="width:100px; height:100px;"></i>
			<i><img src="hotel01_.jpg" alt="롤링이미지1" style="width:100px; height:100px;"></i>
		</div>
	</section>
	
</div><!-- top_wrap div end -->