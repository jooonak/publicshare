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
	background-color: white;
	border-radius: 10px;
	color: black;
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
	background-color: white;
	border-radius: 10px;
	color: black;
	padding: 10px;
}

.hide {
	display: block;
}

.show {
	display: none;
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
	height: 230px;
	overflow: scroll;
	overflow-x: hidden;
}
</style>

<html>
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

<div id="portfoliowrap" style="margin-top:20px">
	<div id="aboutwrap" style="margin-top:20px">
		<div class="container">
			<div class="row">
				<!--col-lg-4-->
				<div class="col-lg-4 name">
					<!-- 상대경로, 절대경로 참조: https://stackoverflow.com/questions/34445457/404-error-for-bootstrap-min-css-and-bootstrap-min-js -->
					<a class="fancybox" href="/upload/image/${book.img}"><img
						class="img-responsive" src="/upload/thumb/${book.img}"
						style="margin-top: 10px; box-shadow: 2px 2px 2px #888888" onerror="this.src='/resources/assets/img/default.jpg'"></a>
					<div class="container thumbview">
						<c:forEach items="${book.imgFiles}" var="img">
							<!-- fileUpload용 div -->
							<div class='thumbcontainer'>
								<img class='thumbimg' data-uploadName="${img}"
									src="/upload/thumb/${img}"
									onerror="this.src='/resources/assets/img/default.jpg'">
							</div>
						</c:forEach>
					</div>
				</div>
				<!--/col-lg-4-->
				<!--col-lg-8-->
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
			</div>
			<!-- /row -->
			<!--/col-lg-8-->
			<div style="margin-top: 2%;">
				<c:choose>
					<c:when test="${book.resCnt ne 0}">
						<button id="resBtn" type="button"
							class="btn btn-primary btn-position modBtn" data-toggle="modal"
							data-target=".modalDialogB">reservation</button>
					</c:when>
					<c:when test="${book.resCnt eq 0}">
						<button type="button" class="btn btn-primary btn-position modBtn"
							data-toggle="modal" data-target=".modalDialogA">loan</button>
					</c:when>
				</c:choose>
				<!-- 대여리스트 화면으로 분기/ 이전 url에 따라서 뒤로가는 페이지가 다름 -->
				<a href="/loanbook/list?page=${cri.page}">
					<button type="button" class="btn btn-default btn-position"
						id="listBtn" name="list">back</button>
				</a>
			</div>
			<br>
			<!-- /row -->
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
			<!-- choose/when구문을 사용해서 해당 bookDTO의 available상태에 따른 노출값이 다를 수 있도록 구현 -->
			<!-- bookDTO의 available이 T(대여 가능)일 경우 나타나는 모달 -->
			<div class="row text-center" style="padding: 50px;">
				<div class="modal fade modalDialogA" tabindex="-1" role="dialogA"
					aria-labelledby="modalLabelA">
					<div class="modal-dialog_a modal-lg">
						<div class="modal-content_a">
							<div class="modal-body_a  ">
								<h1 class="alert-subject">신청 페이지</h1>
								<h4 class="alert-contents">대여 하시겠습니까?</h4>
								<p>
									<button class="btn btn-default" id="rentBook" value="onapply">confirm</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">close</button>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row text-center" style="padding: 50px;">
				<div class="modal fade alert-modal" tabindex="-1" role="dialogA"
					aria-labelledby="modalLabelA">
					<div class="modal-dialog_a modal-lg">
						<div class="modal-content_a">
							<div class="modal-body_a  ">
								<h1 class="alert-subject">confirm</h1>
								<h4 class="alert-contents" style="margin-top: 15px">대여 신청이
									완료되었습니다.</h4>
								<p>
									<button type="button" class="btn btn-default alert-close"
										data-dismiss="modal">close</button>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- bookDTO의 available이 F(False)일 경우 나타나는 모달 -->
			<div class="row text-center" style="padding: 50px;">
				<div class="modal fade modalDialogB " tabindex="-1" role="dialogB"
					aria-labelledby="modalLabelB">
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
		<!-- INPUT MESSAGES -->
	</div>
	<!-- /container -->
	<div class="row text-center" style="padding: 50px;">
		<div class="modal fade alert-modal" tabindex="-1"
			role="dialogA" aria-labelledby="modalLabelA">
			<div class="modal-dialog_a modal-lg">
				<div class="modal-content_a">
					<div class="modal-body_a  ">
						<h1 class = "alert-subject">CONFIRM</h1>
						<h4 class = "alert-contents" style="margin-top:15px">대여 신청이 완료되었습니다.</h4>
						<p>
							<button type="button" class="btn btn-default alert-close" data-dismiss="modal">close</button>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div> 
	
</div>
<!-- /aboutwrap -->


<!-- 수정되는 부분 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var alertModal = $(".alert-modal");
	
	$("#rentBook").on("click", function() {
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
					
					alertModal.modal("show");
					alertModal.on("hidden.bs.modal", function () {
						location.reload();
					});
				}else{
					
					$(".alert-contents").html("이 책은 이미 대여신청중 입니다");
					alertModal.modal("show");
					alertModal.on("hidden.bs.modal", function () {
						location.reload();
					});
				}
				//$(".modal").modal("show");
			}
		});
	});

	//예약에 대한 처리 새로 만듬(hb)
	$(".history").on("click", ".reserveBook", function() {
		
		var data = {
				bno: ${book.bno},
				status: 'onres'
				};
		
		console.log(data);
		
		$.ajax({ //문제발생
			url : '/reservation/reserve',
			type : 'post',
			contentType: "application/json; charset=utf-8",
			data:JSON.stringify(data),
			success : function(result) {
				
				$(".alert-contents").html("예약신청 완료");
				
				alertModal.modal("show");
				alertModal.on("hidden.bs.modal", function () {
					location.reload();
				});
				
			}
		});
	});
	//뷰 페이지에서도 반납/ 예약취소 처리 할 수 있도록 구현
	$(".history").on("click", ".cancelBtn", function() {
		
		var $this = $(this);
		var data = {
				bno: ${book.bno},
				lender: '${member.mid}',
				status: $this.attr("data-status"),
				latefee: $this.attr("data-fee")
				};
		
		console.log(data);
		$.ajax({ //문제발생
			
			url : '/myreturn/request',
			type : 'post',
			contentType: "application/json; charset=utf-8",
			data:JSON.stringify(data),
			success : function(result) {		

				$(".alert-contents").html("취소 처리 완료");
				
				alertModal.modal("show");
				alertModal.on("hidden.bs.modal", function () {
					location.reload();
				});
			}
		});
	});
	
	//메인 썸네일을 설정하는 이벤트이다.
	$(".thumbview").on("click", ".thumbimg", function(e) {
		e.stopPropagation();
		var fileName = $(e.target).attr("data-uploadName");

		$(".fancybox").attr("href","/upload/image/"+ fileName);
		$(".img-responsive").attr("src","/upload/thumb/"+ fileName);
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
		
		$.ajax({
			url:"/reservation/gethistory",
			type:"post",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(data),
			success: function(result){
				
				var checkUser = 0;
				var exist = false;
				//해당 책의 예약 목록에 유저가 있는지 확인하기 위해 사용하는 변수
				
				var date = new Date();
				
				for (var i = 0; i < result.length; i++) {
					if(result[0].startdate == null){
						result[0].startdate = date.getTime();
					}
					if(result[i].lender === '${member.mid}'){
						checkUser = i + 1;
						exist = true;
						//리턴받은 리스트의 i번째의 유저 id가 현재 유저 id와 같다면 위 변수에 i값을 담는다
					} else {
	                    checkUser = result.length;
	                    exist = false;
	                }
				}
				
				var endDate = result[0].startdate + 604800000;
				//반납 날짜 (기본 7일로 잡았기 때문에 7일을 더해서 계산)
				var late = endDate < date.getTime() ? true : false;
				//반납 날짜가 현재 날짜보다 작으면 연체중, 아니면 연체가 아님
				var expect = 
					late ? 
						exist ? date.getTime() + ((checkUser - 1) * 604800000) :
							date.getTime() + ((result[0].rescnt - 1) * 604800000) :
						exist ? endDate + ((checkUser - 1) * 604800000) :
							endDate + ((result[0].rescnt - 1) * 604800000);
				
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
				console.log(checkUser);
				
				if (checkUser == 0){
					result[0].expect = 'X';
				} else {
					result[0].expect = time;	
				}
				
				$(".history").html(getHistory(result[0]));
			} 
		});
	});
	
	function getHistory(result){
		
		if(!result.checkUser == 1 || !result.checkUser == 0){
			result.checkUser -= 1;
		}
		
		var str = "";
		str += "<div><p>Lender: " + result.lender + " | StartDate: " + result.startdate + "</p>";
		str += "<p>Reservation Count: " + result.checkUser + " | Expected Wait Date: " + result.expect + "</p>";
		
		if (result.lender == '${member.mid}'){
			
			if (result.status == 'onreturn'){
				str += "<p>반납 신청중 입니다.</p><p>"
			} else if (result.status == 'onapply') {
				str += "<p>현재 대여 신청중 입니다. 취소하시겠습니까?</p>";
				str += "<p><button class='btn btn-default cancelBtn' data-status='onapply' data-rno=" + result.rno;
				str += " data-fee=0>대여 취소하기</button>";	
			}
		} else if (result.exist) {
			str += "<p>현재 예약 중 입니다. 취소하시겠습니까?</p>";
			str += "<p><button class='btn btn-default cancelBtn' data-status='onres'";
			str += " data-fee=0>예약취소</button>";
			
		} else {
			str += "<p><button class='btn btn-default reserveBook'>예약하기</button>";
		}
		
		str += "<button onclick=$('.modalDialogB').modal('hide') class='btn btn-default'>닫기</button></p></div>";
		
		return str;
	}
});	


</script>
<%@include file="../include/footer.jsp"%>