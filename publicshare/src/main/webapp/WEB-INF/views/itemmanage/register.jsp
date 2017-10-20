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

						<form class="register" method="post">
							<!-- BookDTO, MemberDTO, Criteria 필요 -->
							<h3>글쓴이, 등록일, 조회수</h3>
							<p>
								책제목<input class="input" type="text" name="bname" >
							</p>
							<p>
								출판사<input class="input" type="text" name="publisher">
							</p>
							<p>
								책주인<input class="input" type="text" name="owner">
							</p>
							<div>

								<!-- 등록버튼  -->
								<input id="regBtn" type="submit" value="Register">
								
						</form>
						
						<!-- fileUpload용 iframe -->
							<iframe>
							
							</iframe>
						<!-- fileUpload용 iframe -->
						
						
						<!-- 대여리스트 화면으로 분기/ 이전 url에 따라서 뒤로가는 페이지가 다름 -->
						<a href="/itemmanage/list"><input id="listBtn" type="button" name="list" value="뒤로가기"></a>
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function(){
		
		$("#regBtn").on("click",function(e){
			
			e.preventDefault();
			
			var input = $(".input[name='bname']").val();			
			
			if($(".input[name='bname']").val()===""){
				alert("책 제목을 입력해주세요.");
				return;
			}else if($(".input[name='publisher']").val()===""){
				alert("출판사를 입력해주세요.");
				return;
			}else if($(".input[name='owner']").val()===""){
				alert("책 주인을 입력해주세요.");
				return;
			}
			
			$(".register").submit();
			
		});
		
	});


</script>


 <%@include file="../include/footer.jsp"%>