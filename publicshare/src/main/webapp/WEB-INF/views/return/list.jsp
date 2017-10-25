<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

#divPaging>li>a #divPaging>li>span {
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
	margin-left: 2%;
	border-right: 1px thin black;
}
.conditions>.right>li {
	list-style: none;
	float: right;
	margin-left: 2%;
	border-right: 1px thin black;
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
		<div class="row">
			<!--reigster btn  -->
			<div class="conditions">
				<ul class="left">
					<li><a type="button" href="#"><span data-oper="onloan">Rented Books</span></a></li>
					<li><a type="button" href="#"><span data-oper="onapply">Apply For Rental</span></a></li>
					<li><a type="button" href="#"><span data-oper="onres">Booking Books</span></a></li>
				</ul>
				<ul class="right">
					<li><button id="returnalarm" style="float: right;" data-toggle="modal"
						data-target="#myModal" class="btn btn-default">Return Alarm</button></li>
					<li><button id="resalarm" style="float: right;" data-toggle="modal"
						data-target="#myModal" class="btn btn-default">Reservation Alarm</button></li>
					<li><button id="none" style="float: right;" data-toggle="modal"
						data-target="#myModal" class="btn btn-default">Arrears Alarm</button></li>
				</ul>
			</div><hr/>
		
			<h1 class="dataP">BOOKS</h1>
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
			<div id="listDiv" class="container" style="height: 80%">
			<%-- <c:choose>

				<c:when test="${empty list}">
<<<<<<< HEAD
					<div style="text-align: center; margin: 30% auto;"><h1>대여한 도서가 없습니다</h1></div>
=======
<<<<<<< HEAD
					<div style="text-align: center; margin: 20% auto;"><h1>대여한 도서가 없습니다</h1></div>
=======
					<div style="text-align: center; margin: 30% auto;"><h1>대여한 도서가 없습니다</h1></div>
>>>>>>> refs/remotes/origin/master
>>>>>>> refs/remotes/origin/master
				</c:when>

				<c:when test="${!empty list}">
					<c:forEach items="${list}" var="data">
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<img src="/upload/thumb/${data.BookDTO.img}" alt="" onerror="this.src='/resources/assets/img/default.jpg'">
										</div>
<<<<<<< HEAD
										<div class="caption">
											<h4>${data.BookDTO.bname}</h4>
											<p>${data.BookDTO.owner} | ${data.BookDTO.publisher}</p>
											<button data-rno="${data.ReservationDTO.rno}" id="returnBtn" class="btn btn-warning">반납하기</button>
=======
										<div class="caption item"  >
										 	<h4 >${data.BookDTO.bname}</h4>
											<p>${data.BookDTO.publisher}</p>
											<p>${data.BookDTO.owner }</p>
											<p class="time" data-time="${data.ReservationDTO.startDate}"></p>
											<button data-rno="${data.ReservationDTO.rno}" id="returnBtn" data-fee="0">반납하기</button>
>>>>>>> refs/remotes/origin/master
											<p></p>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>

			</c:choose> --%>
			</div>
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

$("#divPaging").html(pageStr);

$(document).ready(function() {
	
	
	var $ModalLabel = $("#myModalLabel2");
	var $modalBody = $(".modal-body");
	
/* 	$(".row").on("click", "#returnBtn", function(e){
		
<<<<<<< HEAD
		var data = $(this).attr("data-rno");
=======
		var lateFee = $(this).attr("data-fee");
		var rno = $(this).attr("data-rno");
		var data = {rno:rno, 
					lateFee:lateFee};
>>>>>>> refs/remotes/origin/master
		console.log(data);
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
	}); */
		
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
				str += "<div id=alarm><img src=/upload/thumb/" + result[i].BookDTO.img + " onerror=this.src='/resources/assets/img/default.jpg'>";
				str += "<p>" + result[i].BookDTO.bname + " | " + result[i].BookDTO.publisher + "</p>";
				str += "<p>" + result[i].BookDTO.owner + " - 반납 거부</p><p> 상세 내용은 작성자와 상의하세요</p>";
				str += "<p><button id=checkReject data-rno=" + result[i].ReservationDTO.rno
				str += " data-bno=" + result[i].BookDTO.bno + " class='btn btn-primary'>CONFIRM</button></p></div><hr/>";		
			}
			$(".modal-body").html(str);
		});
	}
	
	function getResAlarm(){
		var str = "";
		$.getJSON("/reservation/applyreadylist", function(result) {
			for (var i = 0; i < result.length; i++) {
				str += "<div id=alarm><img src=/upload/thumb/" + result[i].BookDTO.img + " onerror=this.src='/resources/assets/img/default.jpg'>";
				str += "<p>" + result[i].BookDTO.bname + " | " + result[i].BookDTO.publisher + "</p>";
				str += "<p>" + result[i].BookDTO.owner + " | " + result[i].ReservationDTO.resDate + "</p>";
				str += "<p><button id=resBtn data-oper=reserveconfirm data-rno=" + result[i].ReservationDTO.rno;
				str += " data-bno=" + result[i].BookDTO.bno + " class='btn btn-success'>ACCEPT</button>";
				str += "<button id=resBtn data-oper=reservereject data-rno=" + result[i].ReservationDTO.rno;
				str += "data-bno=" + result[i].BookDTO.bno + " class='btn btn-danger'>CANCEL</button></p></div><hr/>";		
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
	
	$(".left").on("click", function(e){
		$url = $(e.target).attr("data-oper");
		onLoanList("/myreturn/list/"+ $url +"/"+${cri.page});
	});
	
	function onLoanList(url){
		var str = "";
		var text = "";
		if(url.split("/")[3] == "onloan"){
			text = "반납하기";
		} else if (url.split("/")[3] == "onapply") {
			text = "대여 취소";
		} else if (url.split("/")[3] == "onres") {
			text = "예약 취소";
		}
		
		$.getJSON(url, function(result){
			
			if(result.length != 0){
				for (i = 0; i < result.length; i++) {
					str += "<div class='col-sm-3 col-xs-12 desc'>";
					str += "<div class='project-wrapper'><div class='project'>";
					str += "<div class='photo-wrapper'><div class='photo'>";
					str += "<img src='/upload/thumb/${data.BookDTO.img}' alt='' onerror=this.src='/resources/assets/img/default.jpg'>";
					str += "</div><div class='caption'><h4>" + result[i].BookDTO.bname + "</h4>";
					str += "<p>" + result[i].BookDTO.owner + " | " + result[i].BookDTO.publisher + "</p>";
					str += "<p class='time' data-time=" + result[i].ReservationDTO.startDate + "></p>";
					str += "<button data-rno=" + result[i].ReservationDTO.rno + " id='btnStatus' data-fee='0'";
					str += " data-status='" + url.split("/")[3] + "' class='btn btn-warning' data-bno=" + result[i].BookDTO.bno + ">" + text + "</button>";
					str += "<p></p></div><div class='overlay'></div></div></div></div></div>";
				}
			} else {
				str += "<div style='text-align: center; margin: 20% auto;'><h1>대여한 도서가 없습니다</h1></div>";
			}
			
			$("#listDiv").html(str);
		});
	}

	onLoanList("/myreturn/list/onloan/"+${cri.page});
	
	$("#listDiv").on("click", "#btnStatus", function(e){
		
		var $this = $(this);
		var data = { 
			  	rno: $this.attr('data-rno'),
			  	status: $this.attr('data-status'),
			  	lateFee: $this.attr("data-fee")
			  };
		console.log(data);
		
		$.ajax({
			url : '/myreturn/request',
			type : 'post',
			contentType: "application/json; charset=utf-8",
			data:JSON.stringify(data),
			success : function(result) {
				location.reload();
			}
		});
	});
	

	//연체금 계산 (hb)
	$(".time").each(function (arr){
		
		//현재 시간
		var timeStamp = new Date();
		//console.log(timeStamp.getTime());
		
		//도서 대여 시작한 시간
		var startDate = $(this).attr("data-time");
		//포멧 변경(달에 대한 처리 다시 해야함)
		var arr1 = startDate.split(" ");
		if(arr1[1] =="Oct"){
			arr1[1]= "9";
		}
		var dt1= new Date(arr1[5],arr1[1],arr1[2]);
		//console.log(dt1.getTime());
		
		//두 날의 차이를 구함
		var betweenDay =Math.floor((timeStamp.getTime()- dt1.getTime())/1000/60/60/24)-1;  
		//console.log(betweenDay);
		
		//날짜에 따른 연체금 리스트에 표기
		var lateFee = "";
		if(betweenDay > 7){
			
			lateFee = ((betweenDay-7)*100);
			$("#returnBtn").attr("data-fee",lateFee);
			str ="<input type=hidden value='"+lateFee+"'>";
			
			$(this).html("연체금은 "+lateFee+"원 입니다.");
			
			
		}else if(betweenDay < 7){
			var endDate = 7-betweenDay;
			$(this).html("반납일까지 "+endDate+"일 남았습니다.");
		}else{
			$(this).html("반납일입니다.");
		}
	});
});	
</script>

<%@include file="../include/footer.jsp"%>