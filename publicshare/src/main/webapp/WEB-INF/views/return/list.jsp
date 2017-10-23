<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../include/header.jsp"%>
<!-- 왜 상대경로만 되는지... -->

<style>
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
	margin-top: 10px;
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

a:hover {
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
	/* IE 8 */
	filter: alpha(opacity = 50); /* IE7 */
	opacity: 0.6;
	text-decoration: none;
}

.thumbnails li>.fff .caption {
	background: #fff !important;
	padding: 10px
}

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
</style>
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
	<div class="container">
	<button id="returnalarm" style="float: right;" data-toggle="modal"
		data-target="#myModal">Return Alarm</button>
	<button id="resalarm" style="float: right;" data-toggle="modal"
		data-target="#myModal">Reservation Alarm</button>
	
		<div class="row">
			<!--reigster btn  -->
			<h1>BOOKS</h1>

			<!-- Modal -->
			<div class="modal right fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel2">
				<div class="modal-dialog" role="document">
					<div class="modal-content">

						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<h4 class="modal-title" id="myModalLabel2">Right Sidebar</h4>
						</div>

						<div class="modal-body"></div>

					</div>
					<!-- modal-content -->
				</div>
				<!-- modal-dialog -->
			</div>
			<!-- modal -->

			<c:choose>

				<c:when test="${empty list}">
					<div style="text-align: center; margin: 30% auto;"><h1>대여한 게시물이 없습니다</h1></div>
				</c:when>

				<c:when test="${!empty list}">
				<div style="width: 100%; height: 85%">
					<c:forEach items="${list}" var="data">
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<img src="/resources/assets/img/portfolio/port01.jpg" alt="">
										</div>
										<div class="caption">
											<h4>${data.BookDTO.bname}</h4>
											<p>${data.BookDTO.publisher}</p>
											<p>${data.BookDTO.owner}</p>
											<button data-rno="${data.ReservationDTO.rno}" id="returnBtn">반납하기</button>
											<p></p>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				</c:when>

			</c:choose>
		</div>
		<ul id="divPaging">
		</ul>
	</div>
</div>



<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/pageMaker.js?ver=1"></script>
<script type="text/javascript">

var pageStr = PageMaker({
    total: ${cri.total},
    current: ${cri.page},
    showCount: 8,
    liCount: 5,
    url: "/return/list" 
});
console.log(${cri.total});

$("#divPaging").html(pageStr);

$(document).ready(function() {

	var $ModalLabel = $("#myModalLabel2");
	var $modalBody = $(".modal-body");
	
	$(".item").on("click", "#returnBtn", function(e){
		
		var data = $(this).attr("data-rno");
		
		$.ajax({
			url:'/myreturn/request',
			type:'POST',
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(data),
			success: function(result){
				
				alert("Return Request Success");
				location.reload();
			} 
		});
	});
		
	$modalBody.on("click", '#resBtn', function(){
		var $this = $(this)
		var data = {
				bno: $this.attr('data-bno'), 
			  	rno: $this.attr('data-rno')
			  };
		
		$.ajax({
			url : '/myreturn/' + $this.attr('data-oper'),
			type : 'post',
			contentType: "application/json; charset=utf-8",
			data:JSON.stringify(data),
			success : function(result) {
				$modalBody.html("");
				getResAlarm();
			}
		});
	});	
	
	$modalBody.on("click", '#checkReject', function(){
		var $this = $(this)
		var data = {
				bno: $this.attr('data-bno'), 
			  	rno: $this.attr('data-rno')
			  };
		
		$.ajax({
			url : '/myreturn/checkreject',
			type : 'post',
			contentType: "application/json; charset=utf-8",
			data:JSON.stringify(data),
			success : function(result) {
				$modalBody.html("");
				getReturnAlarm();
			}
		});
	});	

	function getReturnAlarm(){
		var str = "";
		$.getJSON("/myreturn/checkReturn", function(result) {
			for (var i = 0; i < result.length; i++) {
				str += "<div><p>Title: " + result[i].BookDTO.bname + " " + result[i].ReservationDTO.rno + "</p>"; 
				str += "<p><button id=checkReject data-rno=" + result[i].ReservationDTO.rno
				str += " data-bno=" + result[i].BookDTO.bno + ">확인</button></p></div>";		
			}
			$(".modal-body").html(str);
		});
	}
	
	function getResAlarm(){
		var str = "";
		$.getJSON("/reservation/applyreadylist", function(result) {
			for (var i = 0; i < result.length; i++) {
				str += "<div><p>" + result[i].BookDTO.bname + " " + result[i].ReservationDTO.rno + "</p>";
				str += "<p><button id=resBtn data-oper=reserveconfirm data-rno=" + result[i].ReservationDTO.rno;
				str += " data-bno=" + result[i].BookDTO.bno + ">확인</button><button id=resBtn data-oper=reservereject";
				str += " data-rno=" + result[i].ReservationDTO.rno + " data-bno=" + result[i].BookDTO.bno;
				str += ">취소</button></p></div>";		
			}
			$(".modal-body").html(str);
		});
	}
	
	$("#returnalarm").on("click", function(e){
		$ModalLabel.text("");
		$ModalLabel.text("Rejected Return");
		$modalBody.html("");
		getReturnAlarm();
	});
	
	$("#resalarm").on("click", function(e){
		$ModalLabel.text("");
		$ModalLabel.text("Check Reservation");
		$modalBody.html("");
		getResAlarm();
	});
});	
</script>

<%@include file="../include/footer.jsp"%>