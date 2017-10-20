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
</style>



<section id="home" name="home"></section>
<div id="headerwrap">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>Public Share</h1>
			</div>
		</div>
		<! --/row -->
	</div>
	<! --/container -->
</div>
<! --/headerwrap -->

<! -- PORTFOLIO SECTION -->
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

						<form class="register" method="post">
							<!-- BookDTO, MemberDTO, Criteria 필요 -->
							<h3>책 정보를 입력하세요</h3>
							<p>
								책제목<input class="input" type="text" name="bname">
							</p>
							<p>
								출판사<input class="input" type="text" name="publisher">
							</p>
							<p>
								주인장<input class="input" type="text" name="owner" value="${member.mid}" readonly="readonly">
							</p>
							<div></div>

							<!-- 등록버튼  -->
							<input id="regBtn" type="submit" value="Register">
						</form>

						<!-- fileUpload용 div 및 버튼-->
						<button data-toggle="modal" data-target=".modalDialogA">file
							upload</button>
						<div class="uploadThumb"></div>
						<div class="row text-center" style="padding: 50px;">
							<div class="modal fade modalDialogA " tabindex="-1"
								role="dialogA" aria-labelledby="modalLabelA">
								<div class="modal-dialog_a modal-lg">
									<div class="modal-content_a">
										<div class="modal-body_a  ">
											<h2>file upload</h2>
											
											<p></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- fileUpload용 div -->



						<!-- 대여리스트 화면으로 분기/ 이전 url에 따라서 뒤로가는 페이지가 다름 -->
						<a href="/itemmanage/list"><input id="listBtn" type="button"
							name="list" value="뒤로가기"></a>
					</div>
				</div>
			<! --/col-lg-8-->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /aboutwrap -->
</div>
<! --/Portfoliowrap -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {

		$("#regBtn").on("click", function(e) {

			e.preventDefault();

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

			$(".register").submit();

		});

	});
</script>
<%@include file="../include/footer.jsp"%>