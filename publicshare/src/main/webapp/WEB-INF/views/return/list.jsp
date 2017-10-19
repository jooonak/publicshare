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

			<div class="carousel slide" id="myCarousel">
				<div class="carousel-inner">
					<div class="item active">

						<!-- 예약 대기 modal 요청용  -->
						<div>
							<c:forEach items="${applyreadylist}" var="apply">
								<div>${apply.BookDTO}</div>
								<div>${apply.ReservationDTO}</div>
								<button class='apply-btn' data-oper='confirm'
									data-rno='${apply.ReservationDTO.rno}'
									data-bno='${apply.BookDTO.bno}'>확인${apply.ReservationDTO.rno}</button>
								<button class='apply-btn' data-oper='reject'
									data-rno='${apply.ReservationDTO.rno}'
									data-bno='${apply.BookDTO.bno}'>취소</button>
							</c:forEach>
						</div>
						<!-- 예약 대기 modal 요청용 end -->
						<div class="item">
							<div class="col-sm-3 col-xs-12 desc link">
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
			
			$('.apply-btn').click(function(){
				var $this = $(this)
				var data = {
						bno: $this.attr('data-bno'), 
					  	rno: $this.attr('data-rno'),
					  };
				
				$.ajax({
					url : '/myreturn/'+$this.attr('data-oper'),
					type : 'post',
					contentType: "application/json; charset=utf-8",
					data:JSON.stringify(data),
					success : function(result) {
						alert("등록 완료하였습니다.");
						//callback하면 modal 'hide'처리 예정(sb)
					}
				});
			});			

		});
	</script>

	<%@include file="../include/footer.jsp"%>