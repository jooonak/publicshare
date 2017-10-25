<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../include/header.jsp"%>
<!-- 왜 상대경로만 되는지... -->
<style>
.modal {
	padding-right: 0px;
	background-color: rgba(4, 4, 4, 0.3);
}

.modal-dialog_a {
	top: 20%;
	width: 50%;
	position: absolute;
	margin-left: 25%;
}

.modal-content_a {
	border-radius: 10px;
	border: none;
	padding: 25px;
	top: 40%;
}

.modal-body_a {
	background-color: #0f8845;
	border-radius: 10px;
	color: white;
	padding: 10px;
}

.modal-dialog_b {
	top: 20%;
	width: 50%;
	position: absolute;
	margin-left: 25%;
}

.modal-content_b {
	border-radius: 10px;
	border: none;
	padding: 25px;
	top: 40%;
}

.modal-body_b {
	background-color: black;
	border-radius: 10px;
	color: white;
	padding: 10px;
}

/*댓글 창 관련 css hb  */
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
	width: 100%;
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
</style>

<html>




<section id="home" name="home"></section>
<div id="headerwrap">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>PUBLIC SHARE</h1>
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
				<div class="col-lg-6 name">
					<!-- 상대경로, 절대경로 참조: https://stackoverflow.com/questions/34445457/404-error-for-bootstrap-min-css-and-bootstrap-min-js -->
					<a class="fancybox"
						href="/resources/assets/img/portfolio/port01.jpg"> <img
						class="img-responsive"
						src="/resources/assets/img/portfolio/port01.jpg"></a>
				</div>
				<!--/col-lg-4-->
				<div class="col-lg-6 name-desc">
					<div class="col-md-6">
						<!-- BookDTO, MemberDTO, Criteria 필요 -->
						<h3>Book Information</h3>
						</br>
						
						<p>
							책제목<input type="text" value="${book.bname}" readonly="readonly">
						</p>
						<p>
							출판사<input type="text" value="${book.publisher}"
								readonly="readonly">
						</p>
						<p>
							주인장<input type="text" value="${book.owner}" readonly="readonly">
						</p>
						<p>
							날짜정보:
							<fmt:formatDate value="${book.regDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
						</p>
						<div>

							<!-- choose/when구문을 사용해서 해당 bookDTO의 available상태에 따른 노출값이 다를 수 있도록 구현 -->


							<hr>
							<c:choose>
								<c:when test="${book.resCnt ne 0}">
									<input id="resBtn" type="button" data-toggle="modal"
										data-target=".modalDialogB" value="예약">
								</c:when>
								<c:when test="${book.resCnt eq 0}">
									<input type="button" data-toggle="modal"
										data-target=".modalDialogA" value="대여">
								</c:when>
							</c:choose>

							<!-- 대여리스트 화면으로 분기/ 이전 url에 따라서 뒤로가는 페이지가 다름 -->
							<a href="/loanbook/list?page=${cri.page}" class="btn">뒤로가기</a>




							<!-- bookDTO의 available이 T(대여 가능)일 경우 나타나는 모달 -->
							<div class="row text-center" style="padding: 50px;">
								<div class="modal fade modalDialogA " tabindex="-1"
									role="dialogA" aria-labelledby="modalLabelA">
									<div class="modal-dialog_a modal-lg">
										<div class="modal-content_a">
											<div class="modal-body_a  ">
												<h2>신청 페이지</h2>
												<h4>대여 하시겠습니까?</h4>
												<input type="hidden" name="bno" value="${book.bno}">
												<p>
													<button id="rentBook" value="onapply">대여하기</button>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- bookDTO의 available이 F(False)일 경우 나타나는 모달 -->
							<div class="row text-center" style="padding: 50px;">
								<div class="modal fade modalDialogB " tabindex="-1"
									role="dialogB" aria-labelledby="modalLabelB">
									<div class="modal-dialog_b modal-lg">
										<div class="modal-content_b">
											<div class="modal-body_b  ">
												<h2>신청 페이지</h2>
												<h4>Loan/Reservation History</h4>
												<div class="history"></div>
												
											</div>
										</div>
									</div>
								</div>
							</div>



						</div>
					</div>
				</div>
				<!--/col-lg-8-->
				<!-- INPUT MESSAGES (hb)-->
				<div class="row mt">
					<div class="col-lg-12">
						<div class="form-panel">
							<h4>
								REPLIES
								<!--댓글 입력 부분 _hb  -->
								<div class="form-replypanel">
									<input class="form-replycontrol" name="reply" id="reply">
									<input style="float: right;" class="regBtn" type="button"
										value="등록">

								</div>
							</h4>
							<hr>
							<!--댓글 리스트 (홍빈)  -->
							<form class="form-horizontal tasi-form">
								<div class="form-group has-success">
									<ul class="col-lg-10 replyUL">

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
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /aboutwrap -->
</div>
<!--/Portfoliowrap -->

<!-- 수정되는 부분 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#rentBook").on("click", function() {
			console.log($(this).val());
			var data = {bno: ${book.bno},
					  	status: $(this).val()
					  };
			$.ajax({ //문제발생
				url : '/reservation/rent',
				type : 'post',
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(data),
				success : function(result) {		
					
					if (result === "true") {
						alert("success");
						location.reload();
					}else{
						alert("이 책은 이미 대여됬습니다.");
						location.reload();
					}
					//$(".modal").modal("show");
				}
			});
		});
	
		//예약에 대한 처리 새로 만듬(hb)
		$("#reserveBook").on("click", function() {
			console.log($(this).val());
			var data = {bno: ${book.bno},
					  	status: $(this).val()
					  };
			$.ajax({ //문제발생
				url : '/reservation/reserve',
				type : 'post',
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(data),
				success : function(result) {		
					
						alert("success");
						location.reload();
				}
			});
		});
	
	
	// 댓글 리스트만들기
	function getReplyList() {
	
		var str = "";
		$.getJSON("/reply/${book.bno}/list/1", function(arr) {
	
			for (var i = 0; i < arr.length; i++) {
				str +="<li data-reno='"+arr[i].reno+"'><label class=col-sm-2 control-label col-lg-2 for=inputSuccess>"+arr[i].nickname+"</label>";
				str +=arr[i].reno+"<div class=form-control id=inputSuccess >"+arr[i].reply+"</div>";
				str +="<div class=addWindow data-addreno='"+arr[i].reno+"'></div>";
				str +="<button class='replyModBtn'>수정</button>";
				str +="<button class='replyDelBtn'>삭제</button>";
				str +="<button class='reReplyBtn'>댓글 달기</button></li>";
			}
	
			$(".replyUL").html(str);
		});	
	}
	getReplyList();
	
	//댓글 등록
	$(".regBtn").on("click",function(e){
		
		var data = {reply:$("#reply").val() ,bno: ${book.bno}};
				
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
	
	//예약하기 버튼을 눌렀을 때 나타나는 Modal에 현재 책의 예약현황을 보여주기위한 이벤트 처리
	$("#resBtn").on("click", function(e){
		
		var data = {
				bno: ${book.bno},
				owner: '${book.owner}'
				};
		console.log(data);
		
		$.ajax({
			url:"/reservation/gethistory",
			type:"post",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(data),
			success: function(result){
				console.log(result);
				
				var checkUser = 0;
				var exist = false;
				//해당 책의 예약 목록에 유저가 있는지 확인하기 위해 사용하는 변수
				
				var date = new Date();
				
				for (var i = 0; i < result.length; i++) {
					if(result[0].startdate == null){
						result[0].startdate = date.getTime();
					}
					if(result[i].lender === '${member.mid}'){
						checkUser = i;
						exist = true;
						//리턴받은 리스트의 i번째의 유저 id가 현재 유저 id와 같다면 위 변수에 i값을 담는다
					}
				}
				
				var endDate = result[0].startdate + 604800000;
				//반납 날짜 (기본 7일로 잡았기 때문에 7일을 더해서 계산)
				var late = endDate > date.getTime() ? true : false;
				//반납 날짜가 현재 날짜보다 크면 연체중, 아니면 연체가 아님
				var expect = 
					late ? 
						exist ? date.getTime() + (checkUser * 604800000) :
							date.getTime() + (result[0].rescnt * 604800000) :
						exist ? date.getTime() - endDate + (checkUser * 604800000) :
							date.getTime() - endDate + (result[0].rescnt * 604800000);
				//예상 대여 가능 날짜 - 현재 대여자가 연체중일때에는 현재 날짜 + (예약자수 * 7) 
				//현재 대여자가 연체중이 아닐때에는 현재날짜 - 반납 날짜 + (예약자 수 * 7)
				result[0].endDate = endDate;
				result[0].late = late;
				result[0].expect = expect;
				result[0].exist = exist;
				result[0].checkUser = checkUser;
				//컨트롤러에서 반환반은 값에 속성 추가
				
				var time = new Date(result[0].startdate);
				time = (time.getFullYear()+"-"+(time.getMonth() + 1)+"-"+time.getDate());
				result[0].startdate = time;
				
				time = new Date(expect);
				time = (time.getFullYear()+"-"+(time.getMonth() + 1)+"-"+time.getDate());
				result[0].expect = time;
				$(".history").html(getHistory(result[0]));
			} 
		});
	});
	
	
	function getHistory(result){
		var str = "";
		str += "<div><p>Lender: " + result.lender + " | StartDate: " + result.startdate + "</p>";
		str += "<p>Reservation Count: " + result.checkUser + " | Expected Wait Date: " + result.expect + "</p>";
		if(result.exist){
			str += "<p><button id='reserveBook' value='onres'>예약취소</button></p>";
		} else {
			str += "<p><button id='reserveBook' value='onres'>예약하기</button></p></div>";
		}
		return str;
	}
});	
	

</script>
<%@include file="../include/footer.jsp"%>