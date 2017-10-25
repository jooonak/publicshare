<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	border: 0.5px solid gray;
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
	-ms-transform: translate(-50%, -50%)
}

.delete {
	position: absolute;
	top: 5%;
	right: 5%;
	height: 20px;
	width: 20px;
	z-index: 3;
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



	<h1>REGISTER BOOK</h1>
	<div id="aboutwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 name">
					<!-- 상대경로, 절대경로 참조: https://stackoverflow.com/questions/34445457/404-error-for-bootstrap-min-css-and-bootstrap-min-js -->
					<a class="fancybox"
						href="/resources/assets/img/camera.png"><img
						class="img-responsive" src="/resources/assets/img/camera.png"
						style="margin-top: 80px; box-shadow: 2px 2px 2px #888888"></a>
					<hr>
				</div>
				<!--/col-lg-4-->
				<div class="col-lg-8 name-desc">
					<form class="register" method="post">
						<!-- BookDTO, MemberDTO, Criteria 필요 -->
						<h3>insert your book info</h3>
						<div>
							<label for="bname">book name</label> <input
								class="input form-control" type="text" name="bname">
						</div>
						<div>
							<label for="publisher">publisher</label> <input
								class="input form-control" type="text" name="publisher">
						</div>
						<div>
							<label for="owner">owner</label> <input
								class="input form-control" type="text" name="owner"
								value="${member.mid}" readonly="readonly">
						</div>

						<div>
							<label for="contents">contents</label>
							<textarea class="input form-control" name="contents" rows="5"
								resize="none"></textarea>
						</div>
					</form>
					<div class="col-md-6"></div>
				</div>
				<!--/col-lg-8-->

			</div>
			<div>
				<h1 style="margin: 15px">image upload</h1>
				
			</div>
				<!-- fileUpload용 div -->
				<div class="container thumbview"></div>
				<!-- 등록버튼  -->
			<div style="margin-top:2%;">
				<button type="button" class = "btn btn-default btn-position" id="regBtn" >Register</button>
				<!-- fileUpload용 div 및 버튼-->
				<button type="button" class = "btn btn-primary btn-position" data-toggle="modal" data-target=".modalDialogA">file upload</button>
				<!-- 대여리스트 화면으로 분기/ 이전 url에 따라서 뒤로가는 페이지가 다름 -->
				<a href="/itemmanage/list">
					<button type="button" class = "btn btn-default btn-position" id="listBtn" name="list" >
					back</button>
				</a>
			</div>
		</div>
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
		<!-- /container -->
	</div>
	<!-- /aboutwrap -->
</div>
<!--/Portfoliowrap -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {

		var isFirstThumb = true;

		//최종 등록용 jquery, 파일 데이터도 전송하기 위해 코드 추가(sb)
		$("#regBtn").on("click", function(e) {
			e.preventDefault();
			//추가되는 부분
			var $register = $(".register");
			var mainThumb = $(
					".thumbview .thumbcontainer .mainthumb")
					.attr("data-uploadName");
			console.log(mainThumb);
			if (mainThumb === undefined) {
				alert("이미지를 최소 1개 이상 등록하고 썸네일을 지정해주세요");
				return;
			}

			$(".thumbview .thumbcontainer .thumbimg").each(function(idx) {
				var fileName = $(this).attr("data-uploadName");
				console.log(fileName);
				var str = "<input type='hidden' name='imgFiles' value='" + fileName + "'>";
				$register.append(str);
			});

			$register.append("<input type='hidden' name='img' value='" + mainThumb + "'>");

			var input = $(".input[name='bname']").val();

			if ($(".input[name='bname']").val() === "") {
				alert("책 제목을 입력해주세요.");
				return;
			} else if ($(".input[name='publisher']").val() === "") {
				alert("출판사를 입력해주세요.");
				return;
			} else if ($(".input[name='owner']").val() === "") {
				alert("책 주인을 입력해주세요.");
				return;
			}
			$register.submit();
		});

		$(".uploadBtn").on("click",function(e) {
			console.log(isFirstThumb);
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
						alert("image파일이 아닙니다");
					} else {
						alert("등록 성공");
					}
			
					document.querySelector(".thumbview").innerHTML += "<div class = 'thumbcontainer' >"
							+ "<img class='thumbimg' alt='Avatar' data-uploadName=" + response.uploadName + "" +
			                           " src = '/upload/thumb/" + response.uploadName + "'>"
							+ "<div class = 'middle'>"
							+ "<div class = 'text'>select thumbnail</div>"
							+ "</div>"
							+ "<img class = 'delete' src = '/resources/assets/img/delete.png'>"
							+ ((isFirstThumb) ? "<img class = 'mainthumb' src = '/resources/assets/img/check.png' data-uploadName=" + response.uploadName + ">"
									: "")
							+ "</div>";
			
					if (isFirstThumb) {
						$(".fancybox").attr("href","/upload/image/"+ response.uploadName);
						$(".img-responsive").attr("src","/upload/thumb/"+ response.uploadName);
						isFirstThumb = false;
					}
									/* 
									"<img data-uploadName="+response.uploadName+
			" data-thumbName="+response.thumbName+
			" src = '/upload/thumb/"+response.thumbName+"'>";  */
				}
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

	});
</script>
<%@include file="../include/footer.jsp"%>