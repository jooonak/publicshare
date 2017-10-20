<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../include/header.jsp"%>
<!-- 왜 상대경로만 되는지... -->
<html>

<style>
.hide {
	display: block;
}

.show {
	display: none;
}

.form-panel {
	background: #f4f4f4;
	margin: 10px;
	padding: 10px;
	box-shadow: 0px 4px 4px #aab2bd;
}

.form-replypanel {
	margin-left: 5%;
}

.form-replycontrol {
	display: block;
	width: 90%;
	height: 34px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin: 0px;
	float: left;
}

#reReplyForm{
	width: 80%;
	margin-left: 100px;
	line-height: 1.42857143;
} 
</style>

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
							<a href="/itemmanage/list"><input type="button" name="list"
								value="뒤로가기"></a>
						</div>
					</div>
				</div>
				<!--/col-lg-8-->
			</div>
			<!-- /row -->
			<br>
			<!--댓글 입력 부분 _hb  -->


			<!-- INPUT MESSAGES (hb)-->
			<div class="row mt">
				<div class="col-lg-12">
					<div class="form-panel">

						<!--댓글 입력 부분 _hb  -->
						<div class="form-horizontal">
							<h4>REPLIES</h4>
							<input class="form-replycontrol" name="reply" id="reply">
							<input style="float: right;" class="regBtn" type="button"
								value="등록">
						</div>
						<br>
						<br>

						<!--댓글 리스트 (홍빈)  -->
						<form class="form-horizontal tasi-form">
							<div class="form-group has-success">
								<ul class="replyUL">

								</ul>
							</div>
						</form>
						<!--댓글 리스트 (홍빈)  -->

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
			if(arr[i].reno == arr[i].replytree){
				
				str +="<li data-reno='"+arr[i].reno+"'><label class=col-sm-2 control-label col-lg-2 for=inputSuccess>"+arr[i].nickname+"</label>";
				str +=arr[i].reno+"<div class=form-control id=inputSuccess >"+arr[i].reply+"</div>";
				str +="<div class=addWindow data-addreno='"+arr[i].reno+"'></div>";
				str +="<button class='replyModBtn'>수정</button>";
				str +="<button class='replyDelBtn'>삭제</button>";
				str +="<button class='reReplyBtn'>댓글 달기</button></li>";
				
			} else if(arr[i].reno != arr[i].replytree){
				
				str +="<li ><label class=col-sm-2 id=reReplyForm control-label col-lg-2 for=inputSuccess>"+arr[i].nickname+"</label>";
				str +=arr[i].reno+"<div class=form-control id=inputSuccess >"+arr[i].reply+"</div>";
				str +="<div class=addWindow></div></li>";
				
			}
		}

		$(".replyUL").html(str);
	});	
}
getReplyList();

//댓글 등록
$(".regBtn").on("click",function(e){
	
	var data = {reply:$("#reply").val() ,bno: ${book.bno} };
			
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
	
	e.preventDefault();
	
	var reno = $(this).parent().attr("data-reno");
	
	var str ="<div class=modWindow><textarea id=modReply rows=1 cols=80 ></textarea><input class='modWindowBtn' type=button value=댓글수정></div>";

	$(".addWindow[data-addreno='"+reno+"']").html(str);
		 
});


// 댓글 수정	
$(".replyUL").on("click",".modWindowBtn", function(e){
	
	e.preventDefault();
	
	var reno = $(this).parent().parent().parent().attr("data-reno");
	
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
});

// 대댓글 창 띄우기
$(".replyUL").on("click",".reReplyBtn",function(e){
	
	e.preventDefault();
	
	var reno = $(this).parent().attr("data-reno");
	
	var str ="<div class=rereplyWindow><textarea id=reReply rows=1 cols=60 ></textarea><input class='rereplyWindowBtn' type=button value=댓글달기></div>";

	$(".addWindow[data-addreno='"+reno+"']").html(str);
		 
});

// 대댓글 달기	
$(".replyUL").on("click",".rereplyWindowBtn", function(e){
	
	e.preventDefault();
	
	var reno = $(this).parent().parent().parent().attr("data-reno");
	
	var data = {reno : reno , reply:$("#reReply").val(), bno: ${book.bno}};
	console.log(data);
	
 	$.ajax({
		url:'/reply/rereply/'+reno,
		type:'POST',
		contentType:"application/json; charset=utf-8",
		data:JSON.stringify(data),
		success: function(result){
			alert("rereply register success");
 			$("#reReply").val("");
 			getReplyList();
		} 
	});
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