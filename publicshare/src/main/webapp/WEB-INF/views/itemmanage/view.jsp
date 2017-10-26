<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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

#reReplyForm {
	width: 80%;
	margin-left: 100px;
	line-height: 1.42857143;
}

.btn-position {
	float: right;
	margin-left: 1%;
}

.thumbview {
	margin-top: 20px;
	padding: 0;
	display: flex;
	flex-direction: row;
	height: 80px;
	width: 100%;
	box-shadow: 2px 2px 2px #888888;
}

.thumbcontainer {
	position: relative;
	width: 25%;
	height: 90%;
	display: inline-block;
	/* or */
	float: left;
	margin-top: 1px;
	margin-left: 5px;
}

.thumbimg {
	position: relative;
	opacity: 1;
	display: block;
	height: 100%;
	width: 100%;
	transition: .5s ease;
	backface-visibility: hidden;
	box-shadow: 1px 1px 1px #888888;
}

.middle {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%)
}

.mainthumb {
	position: absolute;
	top: 5%;
	left: 5%;
	height: 30px;
	width: 30px;
	z-index: 2;
}

.thumbcontainer:hover .thumbimg {
	opacity: 0.3;
}

.thumbcontainer:hover .middle {
	opacity: 1;
}

.thumbtext {
	background-color: #4CAF50;
	color: white;
	font-size: 16px;
	padding: 16px 32px;
}

.content-box {
	height:230px;
	overflow:scroll;
	overflow-x: hidden;
}
</style>

<section id="home" name="home"></section>
<div id="headerwrap">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1 style="font-size:5em">BOOK INFORMATION</h1>
			</div>
		</div>
		<!--/row -->
	</div>
	<!--/container -->
</div>
<!--/headerwrap -->

<!-- PORTFOLIO SECTION -->
<section id="portfolio" name="portfolio"></section>

<div id="portfoliowrap"  style="margin-top:20px">
	<div id="aboutwrap"  style="margin-top:20px">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 name">
					<!-- 상대경로, 절대경로 참조: https://stackoverflow.com/questions/34445457/404-error-for-bootstrap-min-css-and-bootstrap-min-js -->
					<a class="fancybox" href="/upload/image/${book.img}"><img
						class="img-responsive" src="/upload/thumb/${book.img}"
						style="margin-top: 10px; box-shadow: 2px 2px 2px #888888"></a>
					<div class="container thumbview">
						<c:forEach items="${book.imgFiles}" var="img">
							<!-- fileUpload용 div -->
							<div class='thumbcontainer'>
								<img class='thumbimg' data-uploadName="${img}"
									src="/upload/thumb/${img}">
							</div>
						</c:forEach>
					</div>
				</div>
				<!--/col-lg-4-->
				<div class="col-lg-8 name-desc">
					<!-- BookDTO, MemberDTO, Criteria 필요 -->
					<h1 style="margin: 15px; font-weight: bold;">${book.bname}</h1>
					<h4 style="text-align: right">
						<b>publisher:</b> ${book.publisher} | <b>owner:</b> ${book.owner}
					</h4>
					<hr style="margin-bottom: 0px">
					<blockquote class="content-box">
				      <p>${book.contents}</p> 
				    </blockquote>
				    <hr>
				</div>
				<!--/col-lg-8-->
			</div>
			<!-- /row -->
			<div style="margin-top:2%;">
				<!-- history 버튼(-->
				<button type="button" class = "btn btn-primary btn-position " data-toggle="modal" data-target=".modalDialogA" name="대여" >history</button>
				
				<!-- 수정/삭제 div 호출(대여 페이지에서 이동할 경우 표시되는 버튼) -->
				<button type="button" class = "btn btn-warning btn-position modBtn" id="regBtn" name="대여" >modify</button>
				<!-- 대여리스트 화면으로 분기/ 이전 url에 따라서 뒤로가는 페이지가 다름 -->
				<a href="/itemmanage/list">
					<button type="button" class="btn btn-default btn-position"
						id="listBtn" name="list">back</button>
				</a>
			</div>
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
							<input style="float: right;" class="regBtn btn btn-default btn-position" type="button"
								value="등록">
						</div>
						<br> <br>



						<!--댓글 리스트 (홍빈)  -->
						<form class="form-horizontal tasi-form">
							<div class="form-group has-success">
								<ul class="replyUL container">
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
			
			var regdate = new Date(arr[i].replydate);
			regdate = (regdate.getFullYear()+"-"+(regdate.getMonth() + 1)+"-"+regdate.getDate()+" "+
					regdate.getHours()+":"+regdate.getMinutes());
			
			if(arr[i].reno == arr[i].replytree){
			
				str += "<div class='media'>";
				str += "<div class='media-left'> <img src='/resources/assets/img/1196652-200.png' class='media-object' style='width:45px'></div>";
				str += "<div class='media-body'><h5 class='media-heading'>"+arr[i].reno +" "+arr[i].nickname+" "+regdate+ "</h5>";
				str += "<p class='addWindow' data-reno='"+arr[i].reno+"'>"+arr[i].reply+"";
				str +="<button style = float:right; id='replyModBtn' class='btn btn-default btn-position'>수정</button>";
				str +="<button style = float:right; id='replyDelBtn' class='btn btn-default btn-position'>삭제</button>";
				str +="<button style = float:right; id='reReplyBtn'  class='btn btn-default btn-position'>댓글 달기</button></p>";
				str += "</div></div></div>";
				
			}else if(arr[i].reno != arr[i].replytree){
				
				str += "<div style='margin-left:50px;' class='media'>";
				str += "<div class='media-left'><img src='/resources/assets/img/1196652-200.png' class='media-object' style='width:45px'></div>";
				str += "<div class='media-body'><h5  class='media-heading'>"+arr[i].reno +" "+arr[i].nickname+" "+regdate+ "</h5 >";
				str += "<p class='addWindow'><h4>"+arr[i].reply+"</h4></p>";
				str += "</div></div></div></div>";
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
$(".replyUL").on("click", "#replyDelBtn", function(e){
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
$(".replyUL").on("click","#replyModBtn",function(e){
	
	e.preventDefault();
	
	var reno = $(this).parent().attr("data-reno");
	
	var str ="<div class=modWindow><textarea id=modReply rows=1 cols=90 ></textarea><input class='modWindowBtn btn btn-default btn-position' type=button value=댓글수정></div>";

	$(".addWindow[data-reno='"+reno+"']").html(str);
		 
});


// 댓글 수정	
$(".replyUL").on("click",".modWindowBtn", function(e){
	
	e.preventDefault();
	
	var reno = $(this).parent().parent().attr("data-reno");
	
	
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
$(".replyUL").on("click","#reReplyBtn",function(e){
	
	e.preventDefault();
	
	var reno = $(this).parent().attr("data-reno");
	console.log(reno);
	
	var str ="<div class=rereplyWindow><textarea id=reReply rows=1 cols=60 ></textarea><input class='rereplyWindowBtn' type=button value=댓글달기></div>";

	$(".addWindow[data-reno='"+reno+"']").html(str);
		 
});

// 대댓글 달기	
$(".replyUL").on("click",".rereplyWindowBtn", function(e){
	
	e.preventDefault();
	
	var reno = $(this).parent().parent().attr("data-reno");
	console.log(reno);
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
	
	
	//메인 썸네일을 설정하는 이벤트이다.
	$(".thumbview").on("click", ".thumbimg", function(e) {
		e.stopPropagation();
		var fileName = $(e.target).attr("data-uploadName");

		$(".fancybox").attr("href","/upload/image/"+ fileName);
		$(".img-responsive").attr("src","/upload/thumb/"+ fileName);
	});

	
});	
</script>

<%@include file="../include/footer.jsp"%>