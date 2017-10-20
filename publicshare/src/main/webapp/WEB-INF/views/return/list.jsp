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
							<c:forEach items="${applylist}" var="apply">
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
						<c:forEach items="${list}" var="data">
							<div class="col-sm-3 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<div class="photo">
												<img src="/resources/assets/img/portfolio/port01.jpg"
													alt="">
											</div>
											<div class="caption">
												<h4>${data.BookDTO.bname}</h4>
												<p>${data.BookDTO.publisher}</p>
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
				</div>
				<nav>
				<ul class="control-box pager">
					<li><a data-slide="prev" href="#myCarousel" class=""><i
							class="glyphicon glyphicon-chevron-left"></i></a></li>
					<li><a data-slide="next" href="#myCarousel" class=""><i
							class="glyphicon glyphicon-chevron-right"></i></a></li>
				</ul>
				</nav>
			</div>
			<!--/container -->
		</div>
		<!--/Portfoliowrap -->
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<!-- 클래스 link 버튼 처리 -->
<script type="text/javascript">
	$(document).ready(function() {

		$(".item").on("click", "#returnBtn", function(e){
			
			var data = $(this).attr("data-rno");
			
			$.ajax({
				url:'/myreturn/request',
				type:'POST',
				contentType:"application/json; charset=utf-8",
				data:JSON.stringify(data),
				success: function(result){
					
					alert("register success");
		 			
				} 
			});
		});

	});
</script>

<%@include file="../include/footer.jsp"%>