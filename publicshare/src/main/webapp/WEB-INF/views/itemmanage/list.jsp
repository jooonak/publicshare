<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../include/header.jsp"%>
<!-- 왜 상대경로만 되는지... -->
<html>

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

			<div class="carousel slide" id="myCarousel">
				<div class="carousel-inner">
					<div class="item active">


						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>


					</div>
					<!-- /Slide1 -->
					<div class="item">

						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>



					</div>
					<!-- /Slide2 -->
					<div class="item">

						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<div class="photo">
											<a href="#"><img
												src="/resources/assets/img/portfolio/port01.jpg" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
										<div class="overlay"></div>
									</div>
								</div>
							</div>
						</div>


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

<%@include file="../include/footer.jsp"%>