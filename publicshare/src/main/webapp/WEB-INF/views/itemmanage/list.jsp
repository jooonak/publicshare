<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../include/header.jsp"%>
<!-- 왜 상대경로만 되는지... -->
<html>

<!-- modal style -->
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


</style>

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

.thumbnails li>.fff .caption {
	background: #fff !important;
	padding: 10px
}
</style>


<!-- register 성공시  뜨는 modal -->
<div class="row text-center" style="padding: 50px;">
	<div class="modal modalDialogA fade in ">
		<div class="modal-dialog_a modal-lg">
			<div class="modal-content_a">
				<div class="modal-body_a">
					<h2>등록되었습니다.</h2>
					<p>
						<button >확인</button>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

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

<!-- PORTFOLIO SECTION -->
<section id="portfolio" name="portfolio"></section>
<div id="portfoliowrap">
	<div class="container">
		<div class="row">
			<!--reigster btn  -->
			<h1>BOOKS</h1>
			<button>
				<a href="http://localhost:8080/itemmanage/register">register</a>
			</button>


			<!-- 나중에 css처리 해야함 -->
			<div class="carousel slide" id="myCarousel">
				<div class="carousel-inner">
					<div class="item active">

						<c:forEach items="${list}" var="book">
							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<a href="/itemmanage/view?bno=${book.bno}">
												<div class="photo">
													<img src="/resources/assets/img/portfolio/port01.jpg"
														alt="">

												</div>
												<div class="caption">
													<h4>${book.bname}</h4>
													<p>${book.publisher}</p>
													<c:choose>
														<c:when test="${book.resCnt eq '0'}">
															<input type="button" value="대여 가능">
														</c:when>
														<c:when test="${book.resCnt eq '1'}">
															<input type="button" value="대여중">
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




					</div>
					<!-- /Slide1 -->
					<div class="item">
						<c:forEach items="${list}" var="book">
							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<a href="/itemmanage/view?bno=${book.bno}">
												<div class="photo">
													<img src="/resources/assets/img/portfolio/port01.jpg"
														alt="">

												</div>
												<div class="caption">
													<h4>${book.bname}</h4>
													<p>${book.publisher}</p>
													<c:choose>
														<c:when test="${book.resCnt eq '0'}">
															<input type="button" value="대여 가능">
														</c:when>
														<c:when test="${book.resCnt eq '1'}">
															<input type="button" value="대여중">
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



					</div>
					<!-- /Slide2 -->
					<div class="item">

						<c:forEach items="${list}" var="book">
							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<a href="/itemmanage/view?bno=${book.bno}">
												<div class="photo">
													<img src="/resources/assets/img/portfolio/port01.jpg"
														alt="">

												</div>
												<div class="caption">
													<h4>${book.bname}</h4>
													<p>${book.publisher}</p>
													<c:choose>
														<c:when test="${book.resCnt eq '0'}">
															<input type="button" value="대여 가능">
														</c:when>
														<c:when test="${book.resCnt eq '1'}">
															<input type="button" value="대여중">
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



					</div>
					<!-- /Slide3 -->
				</div>


				<nav>
				<ul class="control-box pager">
					<li><a data-slide="prev" href="#myCarousel" class=""><i
							class="glyphicon glyphicon-chevron-left"></i></a></li>
					<li><a data-slide="next" href="#myCarousel" class=""><i
							class="glyphicon glyphicon-chevron-right"></i></li>
				</ul>
				</nav>




			</div>
			<!--/container -->
		</div>
		<!--/Portfoliowrap -->
	</div>
</div>



<!-- actionForm   -->
<form id="actionForm" action="/itemmanage/view" method="get">
	<!-- <input type="hidden" name="bno" > -->

</form>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- 클래스 link 버튼 처리 -->
<script type="text/javascript">
	$(document).ready(function() {

		$(".link").on("click", function(e) {

			e.preventDefault();
			console.log($(this));

			var $actionForm = $(actionForm);

			$actionForm.submit();

		});

	});
	

	
</script>

<%@include file="../include/footer.jsp"%>