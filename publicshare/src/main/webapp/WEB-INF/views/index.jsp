<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="./include/header.jsp"%>
<!-- 왜 상대경로만 되는지... -->
<html>
<style>
.modal {
	padding-right: 0px;
	background-color: rgba(4, 4, 4, 0.3);
}

.modal-dialog_a {
	top: 20%;
	width: 100%;
	position: absolute;
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
	width: 100%;
	position: absolute;
}

.modal-content_b {
	border-radius: 10px;
	border: none;
	padding: 25px;
	top: 40%;
}

.modal-body_b {
	background-color: #990000;
	border-radius: 10px;
	color: white;
	padding: 10px;
}

.btn {
	padding: 14px 24px;
	border: 0 none;
	font-weight: 500;
}

.btn:focus, .btn:active:focus, .btn.active:focus {
	outline: 0 none;
}

.btn-primary {
	background: #336633;
	color: #ffffff;
}

.btn-primary:hover, .btn-primary:focus, .btn-primary:active,
	.btn-primary.active, .open>.dropdown-toggle.btn-primary {
	background: #339933;
	color: #ffffff;
}

.btn-primary:active, .btn-primary.active {
	background: #336633;
	box-shadow: none;
}
</style>

<section id="home" name="home"></section>
<div id="headerwrap">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>DESIGN STUDIO</h1>
			</div>
		</div>
		<!--/row -->
	</div>
	<!--/container -->
</div>
<!--/headerwrap -->

<section id="about" name="about"></section>
<div id="aboutwrap">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 name">
				<!-- 상대경로, 절대경로 참조: https://stackoverflow.com/questions/34445457/404-error-for-bootstrap-min-css-and-bootstrap-min-js -->
				<img class="img-responsive" src="/resources/assets/img/pic.png">
				<p>DANIEL PRATT</p>
				<div class="name-label"></div>

			</div>
			<!--/col-lg-4-->
			<div class="col-lg-8 name-desc">
				<h2>
					TALENTED DESIGNER & <br />FRONT-END DEVELOPER <br />ENJOYING THE
					BEAUTIFUL NYC
				</h2>
				<div class="name-zig"></div>

				<div class="col-md-6">
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book.</p>
					<p>It has survived not only five centuries, but also the leap
						into electronic typesetting, remaining essentially unchanged. It
						was popularised in the 1960s with the release of Letraset sheets
						containing Lorem Ipsum passages, and more recently with desktop
						publishing software like Aldus PageMaker including versions of
						Lorem Ipsum.</p>
				</div>
				<div class="col-md-6">
					<p>Contrary to popular belief, Lorem Ipsum is not simply random
						text. It has roots in a piece of classical Latin literature from
						45 BC, making it over 2000 years old.</p>
					<p>Richard McClintock, a Latin professor at Hampden-Sydney
						College in Virginia, looked up one of the more obscure Latin
						words, consectetur, from a Lorem Ipsum passage, and going through
						the cites of the word in classical literature, discovered the
						undoubtable source.</p>
				</div>

			</div>
			<!--/col-lg-8-->

		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /aboutwrap -->


<div class="container">
	<div class="row">
		<h2>Windows 8 Bootstrap Modal dialogs</h2>
	</div>
	<div class="row text-center" style="padding: 50px;">
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target=".modalDialogA">Windows 8 modal - Click to View</button>

		<div class="modal fade modalDialogA " tabindex="-1" role="dialogA"
			aria-labelledby="modalLabelA">
			<div class="modal-dialog_a modal-lg">
				<div class="modal-content_a">
					<div class="modal-body_a  ">
						<h2>This is a Modal Message!</h2>
						<h4>Some message text shown to users.</h4>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<!-- PORTFOLIO SECTION -->
<section id="portfolio" name="portfolio"></section>
<div id="portfoliowrap">
	<div class="container">
		<div class="row">
			<h1>SOME OF MY LATEST WORKS</h1>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
				<div class="project-wrapper">
					<div class="project">
						<div class="photo-wrapper">
							<div class="photo">
								<a class="fancybox"
									href="/resources/assets/img/portfolio/port04.jpg"><img
									class="img-responsive"
									src="/resources/assets/img/portfolio/port04.jpg" alt=""></a>
							</div>
							<div class="overlay"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- col-lg-4 -->

			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
				<div class="project-wrapper">
					<div class="project">
						<div class="photo-wrapper">
							<div class="photo">
								<a class="fancybox"
									href="/resources/assets/img/portfolio/port05.jpg"><img
									class="img-responsive"
									src="/resources/assets/img/portfolio/port05.jpg" alt=""></a>
							</div>
							<div class="overlay"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- col-lg-4 -->

			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
				<div class="project-wrapper">
					<div class="project">
						<div class="photo-wrapper">
							<div class="photo">
								<a class="fancybox"
									href="/resources/assets/img/portfolio/port06.jpg"><img
									class="img-responsive"
									src="/resources/assets/img/portfolio/port06.jpg" alt=""></a>
							</div>
							<div class="overlay"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- col-lg-4 -->
		</div>
		<!-- /row -->

		<div class="row mt">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
				<div class="project-wrapper">
					<div class="project">
						<div class="photo-wrapper">
							<div class="photo">
								<a class="fancybox"
									href="/resources/assets/img/portfolio/port01.jpg"><img
									class="img-responsive"
									src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
							</div>
							<div class="overlay"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- col-lg-4 -->

			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
				<div class="project-wrapper">
					<div class="project">
						<div class="photo-wrapper">
							<div class="photo">
								<a class="fancybox"
									href="/resources/assets/img/portfolio/port02.jpg"><img
									class="img-responsive"
									src="/resources/assets/img/portfolio/port02.jpg" alt=""></a>
							</div>
							<div class="overlay"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- col-lg-4 -->

			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
				<div class="project-wrapper">
					<div class="project">
						<div class="photo-wrapper">
							<div class="photo">
								<a class="fancybox"
									href="/resources/assets/img/portfolio/port03.jpg"><img
									class="img-responsive"
									src="/resources/assets/img/portfolio/port03.jpg" alt=""></a>
							</div>
							<div class="overlay"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- col-lg-4 -->
		</div>
		<!-- /row -->
	</div>
	<!--/container -->
</div>
<!--/Portfoliowrap -->
<%@include file="./include/footer.jsp"%>