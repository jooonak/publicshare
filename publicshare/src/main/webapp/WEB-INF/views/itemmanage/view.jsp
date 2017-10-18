<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../include/header.jsp"%>
<!-- 왜 상대경로만 되는지... -->
<html>

<section id="home" name="home"></section>
<div id="headerwrap">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>Public Share</h1>
			</div>
		</div>
		<!--/row -->
	</div>
	<!--/container -->
</div>
<!--/headerwrap -->

<!-- PORTFOLIO SECTION -->
<section id="portfolio" name="portfolio"></section>

<div id="portfoliowrap">

	<h1>SOME OF MY LATEST WORKS</h1>
	<div id="aboutwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 name">
					<!-- 상대경로, 절대경로 참조: https://stackoverflow.com/questions/34445457/404-error-for-bootstrap-min-css-and-bootstrap-min-js -->
					<a class="fancybox"
						href="/resources/assets/img/portfolio/port04.jpg"><img
						class="img-responsive" src="/resources/assets/img/pic.png"></a>
				</div>
				<!--/col-lg-4-->
				<div class="col-lg-8 name-desc">
					<div class="col-md-6"></div>
					<div class="col-md-6">
						<!-- BookDTO, MemberDTO, Criteria 필요 -->
						<h3>글쓴이, 등록일, 조회수</h3>

						<p>
							책제목<input type="text" readonly="readonly" value="${book.bname }">
						</p>
						<p>
							출판사<input type="text" readonly="readonly"
								value="${book.publisher }">
						</p>
						<p>
							날짜정보<input type="text" readonly="readonly" value="${book.owner }">
						</p>
						<div>
							<!-- 수정/삭제 div 호출(대여 페이지에서 이동할 경우 표시되는 버튼) -->
							<input class="modBtn" type="button" name="대여" value="수정/삭제">
							<!-- 히스토리 div 호출(나의 물품 관리 페이지에서 이동할 경우 표시되는 버튼) -->
							<input type="button" name="대여" value="히스토리">
							<!-- 대여리스트 화면으로 분기/ 이전 url에 따라서 뒤로가는 페이지가 다름 -->
							<input type="button" name="list" value="뒤로가기">
						</div>
					</div>
				</div>
				<!--/col-lg-8-->
			</div>
			<!-- /row -->
			<br>
			<!--댓글 입력 부분 _hb  -->
			<div>
				<textarea rows="1" cols="100" name="reply" id="reply"></textarea>
				<input class="regBtn" type="button" value="등록">
			</div>
			<!-- 수정버튼 클릭시 뜨는 입력창  -->
			<div class="modWindow hide">
				<textarea rows="1" cols="100" name="reply" id="modReply"></textarea>
				<input class="modWindowBtn" type="button" value="수정">
			</div>

			<!--댓글 list  -->
			<div class="replyDiv">
				<ul class="replyUL">
				</ul>
			</div>


			<!-- INPUT MESSAGES -->
			<div class="row mt">
				<div class="col-lg-12">
					<div class="form-panel">
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> REPLIES
						</h4>

						<form class="form-horizontal tasi-form" method="get">
							<div class="form-group has-success">
								<label class="col-sm-2 control-label col-lg-2"
									for="inputSuccess">등록자 이름</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="inputSuccess">
								</div>
							</div>
						</form>

					</div>
					<!-- /form-panel -->
				</div>
				<!-- /col-lg-12 -->
			</div>
			<!-- /row -->
			<!-- INPUT MESSAGES -->

		</div>
		<!-- /container -->
	</div>
	<!-- /aboutwrap -->
</div>
<!--/Portfoliowrap -->

<style>
.hide {
	display: block;
}

.show {
	display: none;
}
</style>


<!-- actionForm form 데이터 전송용  -->
<form id="actionForm" action="/itemmanage/modify?bno=${book.bno }"
	method="get">
	<input type="hidden" name="bno" value="${book.bno }">
</form>



<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- 클래스 link 버튼 처리 -->
<script type="text/javascript">
	// 댓글 리스트만들기
	function getReplyList() {

		var str = "";
		$.getJSON("/reply/${book.bno}/list/1", function(arr) {

			for (var i = 0; i < arr.length; i++) {
				
				str +="<li data-reno='"+arr[i].reno+ "'>"+arr[i].reno +"   "+arr[i].reply;
				str +="<button class='replyModBtn'>수정</button>";
				str +="<button class='replyDelBtn'>삭제</button></li>";
				
			}
			
			$(".replyUL").html(str);
		});
		
	}
	getReplyList();

	
	
	//댓글 등록
	$(".regBtn").on("click",function(e){
		
		var data = {reply:$("#reply").val() ,bno:${book.bno }};
				
	 	$.ajax({
			url:'/reply/new',
			type:'POST',
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(data),
			success: function(result){
				alert("register success");
	 			$("#reply").val("");
	 			getReplyList();
			} 
		});
	 });
	
	//댓글 삭제
	$(".replyUL").on("click", ".replyDelBtn", function(e){
		
		e.preventDefault();
		
		var reno = $(this).parent().attr("data-reno");
		 
		$.ajax({
			url:'/reply/'+reno,
			type:'DELETE',
			contentType:"application/json; charset=utf-8",
			success: function(result){
				alert("delete success");	
				getReplyList();
			}
		});
		
	});
	
	// 댓글 수정 창 띄우기 (나중에 모달로 바꿔야할듯)
	
	$(".replyUL").on("click",".replyModBtn",function(e){
	
		var reno = $(this).parent().attr("data-reno");
		
		$(".modWindow").attr("class", "modWindow show ").attr("data-no", reno);
	 
	});
	
	
	// 댓글 수정
		
	$(".modWindowBtn").on("click",function(e){
		var reno = $(this).parent().attr('data-no');
		var data = {reno : reno , reply:$("#modReply").val()};
		
		$.ajax({
			url:'/reply/'+reno,
			type:'PUT',
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			success: function(result){
				alert("mod success");
				$("#modReply").val("");
				getReplyList();
			}
		});			
	document.querySelector(".modWindow").setAttribute("class","modWindow hide");
	});
	
	
	 	
	$(document).ready(function() {

		$(".modBtn").on("click", function(e) {

			e.preventDefault();

			var $actionForm = $("#actionForm");

			$actionForm.submit();

		});

	});
</script>

<%@include file="../include/footer.jsp"%>