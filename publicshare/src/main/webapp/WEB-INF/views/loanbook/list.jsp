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
	width: 40%;
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
			<h1>SOME OF MY LATEST WORKS</h1>
			<!-- list 출력을 위한 forEach 시작 -->
			<c:forEach items="${booklist}" var="book">
				<div class="col-sm-3 col-xs-12 desc">
					<div class="project-wrapper">
						<div class="project">
							<div class="photo-wrapper">
								<a href="/loanbook/view?bno=${book.bno}&page=${cri.page}">
									<div class="photo">
										<img src="/resources/assets/img/portfolio/port01.jpg" alt="">
									</div>
									<div class="caption">
										<h4>${book.bname}</h4>
										<p>${book.publisher}</p>

										<!-- choose/when 구믄을 사용해 bookDTO의 resCnt 상태에 따른 버튼 표시 -->
										<c:choose>
											<c:when test="${book.resCnt eq 0}">
												<input type="button" value="대여 가능">
											</c:when>
											<c:when test="${book.resCnt ne 0}">
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
			<!-- list 출력을 위한 forEach 끝 -->

		</div>

		<ul id="divPaging">
		</ul>

	</div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/pageMaker.js?ver=2"></script>
<script type="text/javascript">

	var pageStr = PageMaker({
	    total: ${cri.total},
	    current: ${cri.page},
	    showCount: 8,
	    liCount: 5
	});
	
	$("#divPaging").html(pageStr);
	
	console.log("${result}");
</script>

<%@include file="../include/footer.jsp"%>