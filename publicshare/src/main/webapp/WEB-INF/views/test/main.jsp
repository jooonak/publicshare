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

#divPaging {
	clear: both;
	margin: 0 auto;
	margin-top: 10px;
	width: 440px;
	height: 50px;
}

#divPaging li {
	list-style: none;
	float: left;
	margin: 5 auto;
	text-align: center;
}

#divPaging>li>a, #divPaging>li>span {
	border-radius: 50% !important;
	margin: 0 5px;
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
			<h1>SOME OF MY LATEST WORKS</h1>

			<div class="carousel slide" id="myCarousel">
				<div class="carousel-inner">
					<div class="item active">
						<div class="item">

							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<div class="photo">
												<a href="#"><img src="http://placehold.it/360x240"
													alt=""></a>
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
							<!-- col-lg-4 -->
							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<div class="photo">
												<a href="#"><img src="http://placehold.it/360x240"
													alt=""></a>
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
							<!-- col-lg-4 -->
							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<div class="photo">
												<a href="#"><img src="http://placehold.it/360x240"
													alt=""></a>
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
							<!-- col-lg-4 -->
							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<div class="photo">
												<a href="#"><img src="http://placehold.it/360x240"
													alt=""></a>
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
							<!-- col-lg-4 -->
						</div>

						<div class="item">

							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<div class="photo">
												<a href="#"><img src="http://placehold.it/360x240"
													alt=""></a>
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
							<!-- col-lg-4 -->
							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<div class="photo">
												<a href="#"><img src="http://placehold.it/360x240"
													alt=""></a>
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
							<!-- col-lg-4 -->
							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<div class="photo">
												<a href="#"><img src="http://placehold.it/360x240"
													alt=""></a>
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
							<!-- col-lg-4 -->
							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<div class="photo">
												<a href="#"><img src="http://placehold.it/360x240"
													alt=""></a>
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
							<!-- col-lg-4 -->
						</div>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!--/container -->
	</div>
	
<div class="container">
	<ul id="divPaging">
		<li class="disabled"><a href="#">«</a></li>
		<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">»</a></li>
	</ul>
</div>
	<!--/Portfoliowrap -->
</div>
<%@include file="../include/footer.jsp"%>