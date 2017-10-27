<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../include/header.jsp"%>
<!-- 왜 상대경로만 되는지... -->
<html>
<style>
/* modal style for reservation status(jn) */
.modal.left .modal-dialog, .modal.right .modal-dialog {
	position: fixed;
	margin: auto;
	width: 35%;
	height: 100%;
	-webkit-transform: translate3d(0%, 0, 0);
	-ms-transform: translate3d(0%, 0, 0);
	-o-transform: translate3d(0%, 0, 0);
	transform: translate3d(0%, 0, 0);
}

.modal.left .modal-content, .modal.right .modal-content {
	height: 100%;
	overflow-y: auto;
}

.modal.left .modal-body, .modal.right .modal-body {
	padding: 15px 15px 80px;
}

/*Right*/
.modal.right.fade .modal-dialog {
	right: -320px;
	-webkit-transition: opacity 0.3s linear, right 0.3s ease-out;
	-moz-transition: opacity 0.3s linear, right 0.3s ease-out;
	-o-transition: opacity 0.3s linear, right 0.3s ease-out;
	transition: opacity 0.3s linear, right 0.3s ease-out;
}

.modal.right.fade.in .modal-dialog {
	right: 0;
}

/* ----- MODAL STYLE ----- */
.modal-content {
	border-radius: 0;
	border: none;
}

.modal-header {
	border-bottom-color: #EEEEEE;
	background-color: #FAFAFA;
}
/* modal style for reservation status end(jn) */

/* modal style for alert(hb) */
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
/* modal style for alert end(hb) */
</style>

<style>
.thumbnails li>.fff .caption {
	background: #fff !important;
	padding: 10px
}
/* modal style for alert end (jn) */
.project-wrapper {
	border-radius: 5px;
	text-align: center;
}

img {
	max-width: 100%;
}

a {
	-webkit-transition: all 150ms ease;
	-moz-transition: all 150ms ease;
	-ms-transition: all 150ms ease;
	-o-transition: all 150ms ease;
	transition: all 150ms ease;
}

a:hover {
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
	/* IE 8 */
	filter: alpha(opacity = 50); /* IE7 */
	opacity: 0.6;
	text-decoration: none;
}

#divPaging {
	clear: both;
	margin: 0 auto;
	margin-left: 30%;
	margin-top: 5%;
	width: 40%;
	height: 50px;
}

#divPaging li {
	list-style: none;
	float: left;
	margin: 15 auto;
	text-align: center;
}

#divPaging>li>a, #divPaging>li>span {
	border-radius: 50% !important;
	margin: 0 5px;
}

#alarm>img {
	width: 20%; 
	height: 20%;
	float: left;
}
#alarm>p {
	overflow: hidden;
	margin-left: 22%;
}

#alarm>p>button {
	float: right;
}
#alarm:hover { 
    background-color: #d3d3d3;
}

.conditions {
	margin-left: 0;
	height: 35px;
}

.conditions>.left>li {
	list-style: none;
	float: left;
	margin-left: 1%;
}

.conditions>.right>li {
	list-style: none;
	float: right;
	margin-left: 2%;
}
</style>


<section id="home" name="home"></section>
<div id="headerwrap">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3" style="margin-left:20px">
				<h1 style="font-size:5em;width:1000px">MY ITEM MANAGE</h1>
			</div>
		</div>
		<!--/row -->
	</div>
	<!--/container -->
</div>
<!--/headerwrap -->


<div class="modal right fade" id="myModal2" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel2">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel2"></h4>
			</div>

			<div class="modal-body"></div>
		</div>
		<!-- modal-content -->
	</div>
	<!-- modal-dialog -->
</div>
<!-- modal -->


<!-- PORTFOLIO SECTION -->
<section id="portfolio" name="portfolio"></section>
<div id="portfoliowrap" style="margin-top:20px">
	<div class="container">
		<!-- itemmanage에서 대여 요청에 대한 확인/거절을 누르는 modal -->
		
	<div class="conditions">
		<ul class="right">
		<!-- itemmanage에서 대여 요청에 대한 확인/거절을 누르는 modal(sb) -->
		<li><button style="float: right;" id="resBtn" data-toggle="modal"
			data-target="#myModal2" class="btn btn-default">대여 요청 알람
			<span id="applycnt" class="label label-danger"></span></button></li>
		<li><button style="float: right;" id="returnBtn" data-toggle="modal"
			data-target="#myModal2" class="btn btn-default">반납 요청 알람
			<span id="returncnt" class="label label-danger"></span></button></li>
		</ul>
	</div>
	<hr />
		<div class="row">
			<!-- 나중에 css처리 해야함 -->
			
			<div class="container" style="height: 80%">
			<c:choose>
				<c:when test="${empty list}">
					<div style="text-align: center; margin: 20% auto;">
						<h1>등록한 도서가 없습니다</h1>
					</div>
				</c:when>

				<c:when test="${!empty list}">
				
					<c:forEach items="${list}" var="book">
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<a href="/itemmanage/view?bno=${book.bno}&page=${cri.page}">
											<div class="photo">
												<img src="/upload/thumb/${book.img}" alt="" onerror="this.src='/resources/assets/img/default.jpg'">
											</div>
											<div class="caption">
												<h4>${book.bname}</h4>
												<p>${book.owner} | ${book.publisher}</p>
												<h5>[${book.replycnt}]</h5>
												<c:choose>
													<c:when test="${book.resCnt eq '0'}">
														<button class="btn btn-success">대여 가능</button>
													</c:when>
													<c:when test="${book.resCnt ne '0'}">
														<button class="btn btn-danger">대여중</button>
													</c:when>
												</c:choose>
												<p></p>
											</div>
											<div class="overlay"></div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- list 출력을 위한 forEach 끝 -->
				
				</c:when>
				
			</c:choose>
			</div>
		</div>
		<a href="/itemmanage/register" style = "margin-top:20px">
			<button style="float: right; margin-top: 30px" class="btn btn-primary">도서 등록하기</button>
		</a>
		<ul id="divPaging">
		</ul>
	</div>
</div>

<div class="row text-center" style="padding: 50px;">
		<div class="modal fade alert-modal" tabindex="-1"
			role="dialogA" aria-labelledby="modalLabelA">
			<div class="modal-dialog_a modal-lg">
				<div class="modal-content_a">
					<div class="modal-body_a  ">
					<br><br><br>
						<h1 class = "alert-contents"></h1>
						<br><br><br>
						<p>
							<button type="button" class="btn btn-default alert-close" data-dismiss="modal">확인</button>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div> 
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/pageMaker.js?ver=2"></script>
<script type="text/javascript">
$(document).ready(function() {
	var pageStr = PageMaker({
	    total: ${cri.total},
	    current: ${cri.page},
	    showCount: 8,
	    liCount: 5,
	    url: "/itemmanage/list" 
	});

	$("#divPaging").html(pageStr);
	
	var $alertModal = $(".alert-modal");
	var $alertContents = $(".alert-contents");
	
	if('${result}' === "success"){
		$(".alert-contents").html("도서 등록 완료");
		$alertModal.modal("show");	
	}else if('${result}' === "delete"){
		$(".alert-contents").html("도서 삭제 완료");
		$alertModal.modal("show");
	}
	
	
	
	var $ModalLabel = $("#myModalLabel2");
	var $modalBody = $(".modal-body");
	
	function checkReturn(){
		var str = "";
		$.getJSON("/myreturn/check", function(result) {
			for (var i = 0; i < result.length; i++) {
				
				str += "<div id=alarm><img src='/upload/thumb/" + result[i].BookDTO.img + "' onerror=this.src='/resources/assets/img/default.jpg'>";
				str += "<p>Book title: " + result[i].BookDTO.bname + "</p>";
				str += "<p>Applicant for return: " + result[i].ReservationDTO.lender +"</p>";
				str += "<p>Application time: "+getTime(result[i])+"";
				str += "<button class='btn btn-default' id=returnBtn data-oper=returnconfirm data-rno=" + result[i].ReservationDTO.rno;
				str += " data-bno=" + result[i].BookDTO.bno + ">확인</button>";
				str += "<button class='btn btn-warning' id=returnBtn data-oper=returnreject data-rno=" + result[i].ReservationDTO.rno;
				str += " data-bno=" + result[i].BookDTO.bno + ">거절</button></p></div><hr/>";
				$(".modal-body").html(str);
			}
		});
	}
	
	function checkApply(){
		var str = "";
		$.getJSON("/reservation/applylist", function(result) {
			for (var i = 0; i < result.length; i++) {
				
				str += "<div id=alarm><img src='/upload/thumb/" + result[i].BookDTO.img + "' onerror=this.src='/resources/assets/img/default.jpg'>";
				str += "<p>Book title: " + result[i].BookDTO.bname + "</p>";
				str += "<p>Applicant for loan: " + result[i].ReservationDTO.lender + "</p>";
				str += "<p>Application time: "+getTime(result[i])+"";
				str += "<button class='btn btn-default' id=resBtn data-oper=confirm data-rno=" + result[i].ReservationDTO.rno; 
				str += " data-bno=" + result[i].BookDTO.bno + ">확인</button>";
				str += "<button class='btn btn-warning' id=resBtn data-oper=reject data-rno=" + result[i].ReservationDTO.rno;
				str += " data-bno=" + result[i].BookDTO.bno + ">거절</button></p></div><hr/>";
				$(".modal-body").html(str);
			}
		});
	}
	
	$("#returnBtn").on("click", function(e){
		$ModalLabel.text("");
		$ModalLabel.html("반납 요청");
		$modalBody.html("");
		checkReturn();
	});
	
	$("#resBtn").on("click", function(e){
		$ModalLabel.text("");
		$ModalLabel.text("대여 요청");
		$modalBody.html("");
		checkApply();
	});
	
	$modalBody.on("click", "#resBtn", function(e){
		var $this = $(this);
		
		var data = {
				bno: $this.attr("data-bno"),
				rno: $this.attr("data-rno")
			}
		
		$.ajax({
			url : "/reservation/" + $this.attr("data-oper") ,
			type : 'post',
			contentType: "application/json; charset=utf-8",
			data:JSON.stringify(data),
			success : function(result) {
				$alertContents.html("대여 요청 처리 완료");
				$alertModal.modal("show");
				$modalBody.html("");
				checkApply();
				
			}
		});
	});
	
	$modalBody.on("click", "#returnBtn", function(e){
		var $this = $(this);
		
		var data = {
				bno: $this.attr("data-bno"),
				rno: $this.attr("data-rno")
			}
		
		$.ajax({
			url : "/myreturn/" + $this.attr("data-oper") ,
			type : 'post',
			contentType: "application/json; charset=utf-8",
			data:JSON.stringify(data),
			success : function(result) {
				$alertContents.html("반납 요청 처리 완료");
				$alertModal.modal("show");
				$modalBody.html("");
				checkReturn();
				
			}
		});
	});
	
	if(${notice.applycnt} !== 0){
		$("#applycnt").html(${notice.applycnt});	
	}
	if(${notice.returncnt} !== 0){
		$("#returncnt").html(${notice.returncnt});	
	}

	//시간 구하는 함수(hb)
	function getTime(result){
		
		if(result.ReservationDTO.startDate != null ){
			var time = new Date(result.ReservationDTO.startDate);
		}else{
			var time = new Date(result.ReservationDTO.resDate);
		}
		
		var timeString = (time.getFullYear()+"-"+(time.getMonth() + 1)+"-"+time.getDate()+" "+
				time.getHours()+":"+time.getMinutes());
		
		return timeString;
	}
});
</script>

<%@include file="../include/footer.jsp"%>