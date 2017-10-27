<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../include/header.jsp"%>
<!-- 왜 상대경로만 되는지... -->
<html>
<style>
/* <!-- modal style for alert(hb)--> */
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
	background-color: black;
	border-radius: 10px;
	color: white;
	padding: 10px;
}

/* <!-- modal style for alert end(hb)--> */

/* img전용 syle*/
/* https://www.w3schools.com/howto/tryit.asp?filename=tryhow_css_image_overlay_opacity */

.btn-position {
	float: right;
	margin-left: 1%;
}

.thumbview {
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: row;
	height: 120px;
	width: 100%;
	border: 0.1px solid gray;
	box-shadow: 2px 2px 2px #888888;
	
}

.thumbcontainer {
	position: relative;
	width: 15%;
	height: 90%; 
	display : inline-block;
	/* or */
	float: left;
	margin-top:5px;
	margin-left:5px;
	
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
	-ms-transform: translate(-50%, -50%);
	z-index: -1;
	
}

.delete {
	position: absolute;
	top: 5%;
	right: 5%;
	height: 20px;
	width: 20px;
	z-index: 3;
	cursor: pointer;
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
</style>


<section id="home" name="home"></section>
<div id="headerwrap">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3" style="margin-left:20px">
				<h1  style="font-size:5em;width:1000px">Modify Book Info</h1>
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
				<div class="col-lg-4 name">
					<!-- 상대경로, 절대경로 참조: https://stackoverflow.com/questions/34445457/404-error-for-bootstrap-min-css-and-bootstrap-min-js -->
					<a class="fancybox"
						href="/upload/image/${book.img}"><img
						class="img-responsive" src="/upload/thumb/${book.img}"
						style="margin-top: 20px; box-shadow: 2px 2px 2px #888888"></a>
						<hr>
				</div>
				<!--/col-lg-4-->
				<div class="col-lg-8 name-desc">
					<form class = "modify" action="/itemmanage/modify" method="post">
						<!-- BookDTO, MemberDTO, Criteria 필요 -->
						<div>
							<label for="bname">book name</label> 
							<input class="input form-control" type="text" 
							name="bname" value="${book.bname}">
						</div>
						<div>
							<label for="publisher">publisher</label> 
							<input class="input form-control" type="text" 
							name="publisher" value="${book.publisher}">
						</div>
						<div>
							<label for="owner">owner</label> 
							<input class="input form-control" type="text" 
							name="owner" value="${book.owner}" readonly="readonly">
						</div>
						<div>
							<label for="contents">contents</label>
							<textarea class="input form-control" name="contents" rows="5"
								resize="none" >${book.contents}
							</textarea>
						</div>
						<input type="hidden" name="bno" value="${book.bno}" >
						<!-- 기존의 thumbnail 데이터 가져오기 -->
						<input type="hidden" name="prethumb" value="${book.img}" >
					</form>
				</div>
				<!--/col-lg-8-->
			</div>
			<!-- /row -->
			<div>
				<h1 style="margin: 0px;margin-top: 40px">image upload</h1>
				<!-- upload 버튼 -->
				<button style="margin-bottom:10px" type="button" class = " btn btn-primary btn-position" data-toggle="modal" data-target=".modalDialogA">file upload</button>
	
			</div>
			<div class="container thumbview">
				<c:forEach items="${book.imgFiles}" var="img">
				<!-- fileUpload용 div -->
					<div class = 'thumbcontainer' >
						<img class='thumbimg' data-uploadName= "${img}" src = "/upload/thumb/${img}" >
						<div class = 'middle'>
							<div class = 'text'>select thumbnail</div>
						</div>
						<img class = 'delete' src = '/resources/assets/img/delete.png'>
						
					</div>
				</c:forEach>
			</div>
				<!-- 등록버튼  -->
			<div style="margin-top:2%;">	
				<!-- 수정  btn -->
				<button type="button" class = "btn btn-warning btn-position modBtn">modify</button>
				<!-- 삭제 btn-->
				<button type="button" class = "btn btn-danger btn-position delBtn">delete</button>
				<!-- 대여리스트 화면으로 분기/ 이전 url에 따라서 뒤로가는 페이지가 다름 -->
				<a href="/itemmanage/list">
					<button type="button" class = "btn btn-default btn-position backBtn" id="listBtn" name="list" >
					back</button>
				</a>
			</div>	
		</div>
			
		</div>
		<!-- fileUpload -->
		<div class="row text-center" style="padding: 50px;">
			<div class="modal fade modalDialogA " tabindex="-1" role="dialogA"
				aria-labelledby="modalLabelA">
				<div class="modal-dialog_a modal-lg">
					<div class="modal-content_a">
						<div class="modal-body_a  ">
							<h2>file upload</h2>
							<div>
								<input id="uploadForm" type='file' name='file'>
								<button class='popBtn uploadBtn'>등록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /fileUpload -->
		
		<!-- /container -->
	</div>
	<div class="row text-center" style="padding: 50px;">
		<div class="modal fade alert-modal" tabindex="-1"
			role="dialogA" aria-labelledby="modalLabelA">
			<div class="modal-dialog_a modal-lg">
				<div class="modal-content_a">
					<div class="modal-body_a  ">
						<h1 class = "alert-subject">confirm</h1>
						<h4 class = "alert-contents" style="margin-top:15px">대여 신청이 완료되었습니다.</h4>
						<p>
							<button type="button" class="btn btn-default alert-close" data-dismiss="modal">close</button>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div> 
	<!-- /aboutwrap -->
</div>
<!--/Portfoliowrap -->

<!-- actionForm form 데이터 전송용 (delete, list) -->
<form id="actionForm" action="/itemmanage/remove" method="post">
	 <input type="hidden" name="bno" value="${book.bno}" >
</form>

 <script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<script type="text/javascript">

$(document).ready(function(){
	var $alertModal = $(".alert-modal");
	var $alertSubject = $(".alert-subject");
	var $alertContents = $(".alert-contents");
	
	//modify page 진입시 thumbnail 표시창에 썸네일 체크 표시 해주는 구문
	(function(){
		var prethumb = $("input[name = 'prethumb']").val();	
		console.log(prethumb);
		var prethumb = $(".thumbimg[data-uploadName = '"+prethumb+"']").parent()
		.append("<img class = 'mainthumb' src = '/resources/assets/img/check.png' data-uploadName='"+prethumb+"'>");
	})();
	
	
	$(".uploadBtn").on("click",function(e) {
		var formData = new FormData();
		formData.append("file",$("#uploadForm")[0].files[0]);
	
		$.ajax({
			url : "/upload/new",
			data : formData,
			datatype : 'json',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(response) {
				console.log(response);
				if (response === "") {
					$alertSubject.html("check");
					$alertContents.html("이미지 파일이 아닙니다.");
					$alertModal.modal("show");
				} else {
					$alertSubject.html("confirm");
					$alertContents.html("이미지 등록 완료 (파일명: "+response.uploadName+")");
					$alertModal.modal("show");
				}
		
				document.querySelector(".thumbview").innerHTML += "<div class = 'thumbcontainer' >"
						+ "<img class='thumbimg' alt='Avatar' data-uploadName=" + response.uploadName + "" +
		                           " src = '/upload/thumb/" + response.uploadName + "'>"
						+ "<div class = 'middle'>"
						+ "<div class = 'text'>select thumbnail</div>"
						+ "</div>"
						+ "<img class = 'delete' src = '/resources/assets/img/delete.png'>"
						+ "</div>";
				}
								/* 
								"<img data-uploadName="+response.uploadName+
		" data-thumbName="+response.thumbName+
		" src = '/upload/thumb/"+response.thumbName+"'>";  */
		});
		
	});

	//이미지 삭제 ajax(sb)
	//동적으로 생성된 elements에 event를 등록할 때는 .on을 쓴다
	//참조: https://www.tutorialrepublic.com/faq/how-to-bind-click-event-to-dynamically-added-elements-in-jquery.php
	$(".thumbview").on("click",".delete",function(e) {
		e.stopPropagation();

		var $target = $(e.target);
		console.log($target
				.siblings('.thumbimg'));
		console.log($target.siblings(
				'.thumbimg').attr(
				"data-uploadName"));
		var data = {
			origin : $target.siblings('.thumbimg').attr("data-uploadName")
		};

		$.ajax({ //문제발생
			url : '/upload/delete',
			type : 'DELETE',
			contentType : "application/json; charset=utf-8", // = 띄우면 안됨
			data : JSON.stringify(data),
			success : function(result) {
				console.log("delete ok");
				$target.parent().remove();
			}
		});
	});

	//메인 썸네일을 설정하는 이벤트이다. 메인 썸네일은 하나만 가능하므로 라디오 옵션 동작방식을 참조하여 구현하였다.
	$(".thumbview").on("click", ".thumbimg", function(e) {
		e.stopPropagation();
		var fileName = $(e.target).attr("data-uploadName");
		var str = "<img class = 'mainthumb' src = '/resources/assets/img/check.png' data-uploadName=" + fileName + ">";
		$(".mainthumb").remove();
		$(e.target).parent().append(str);

		$(".fancybox").attr("href","/upload/image/"+ fileName);
		$(".img-responsive").attr("src","/upload/thumb/"+ fileName);
	});
	
	$(".modBtn").on("click", function(e){
		e.preventDefault();
		var $modify = $(".modify");
		var mainThumb = $(".thumbview .thumbcontainer .mainthumb").attr("data-uploadName");
		console.log(mainThumb);
		if (mainThumb === undefined) {
			$alertSubject.html("check");
			$alertContents.html("이미지를 최소 1개 이상 등록한 후 썸네일을 지정해주세요.");
			$alertModal.modal("show");
			return;
		}

		$(".thumbview .thumbcontainer .thumbimg").each(function(idx) {
			var fileName = $(this).attr("data-uploadName");
			console.log(fileName);
			var str = "<input type='hidden' name='imgFiles' value='" + fileName + "'>";
			$modify.append(str);
		});

		$modify.append("<input type='hidden' name='img' value='" + mainThumb + "'>");

		var input = $(".input[name='bname']").val();

		if ($(".input[name='bname']").val() === "") {
			$alertSubject.html("check");
			$alertContents.html("책 제목을 입력해 주세요.");
			$alertModal.modal("show");
			return;
		} else if ($(".input[name='publisher']").val() === "") {
			$alertSubject.html("check");
			$alertContents.html("출판사를 입력해 주세요.");
			$alertModal.modal("show");
			return;
		} else if ($(".input[name='owner']").val() === "") {
			$alertSubject.html("check");
			$alertContents.html("책주인을 입력해주세요.");
			$alertModal.modal("show");
			return;
		}
		$modify.submit();
		
	});
	
	$(".delBtn").on("click",function(e){
		if(${book.resCnt} > 0){
			$alertSubject.html("check");
			$alertContents.html("현재 예약자가 존재하여 삭제하실 수 없습니다.");
			$alertModal.modal("show");
			return;
		}
		$("#actionForm").submit();
	});
	
	$(".backBtn").on("click",function(e){
		$("#actionForm").attr("action","/itemmanage/view").attr("method","get").submit();
	});
	
});

</script>


<%@include file="../include/footer.jsp"%>