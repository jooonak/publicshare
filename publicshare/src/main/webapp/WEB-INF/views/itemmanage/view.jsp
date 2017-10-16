<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../include/header.jsp"%>
<!-- 왜 상대경로만 되는지... -->
<html>

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
				<! --/col-lg-4-->
				<div class="col-lg-8 name-desc">
					<div class="col-md-6"></div>
					<div class="col-md-6">
						<!-- BookDTO, MemberDTO, Criteria 필요 -->
						<h3>글쓴이, 등록일, 조회수</h3>
						<p>책제목<input type="text" readonly="readonly"></p>
						<p>출판사<input type="text" readonly="readonly"></p>
						<p>날짜정보<input type="text" readonly="readonly"></p>
						<div>
							<!-- 수정/삭제 div 호출(대여 페이지에서 이동할 경우 표시되는 버튼) -->
							<input class="modBtn" type="button" name="대여" value="수정/삭제">
							<!-- 히스토리 div 호출(나의 물품 관리 페이지에서 이동할 경우 표시되는 버튼) -->
							<input type="button" name="대여" value="히스토리"> 
							<!-- 대여리스트 화면으로 분기/ 이전 url에 따라서 뒤로가는 페이지가 다름 -->
							<input type="button" name="list" value="뒤로가기">
						</div>
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

<!-- actionForm form 데이터 전송용  -->
<form id="actionForm" action="/itemmanage/modify" method="post">
	<!-- <input type="hidden" name="bno" > -->

</form>

 <script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<!-- 클래스 link 버튼 처리 -->
<script type="text/javascript">

$(document).ready(function(){
	
	$(".modBtn").on("click",function(e){
		
		e.preventDefault();
		
		
		var $actionForm = $(actionForm);
		
		$actionForm.submit();
		
		
		
	});
	
});


</script>

<%@include file="../include/footer.jsp"%>