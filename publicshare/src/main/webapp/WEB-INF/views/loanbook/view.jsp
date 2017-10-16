<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../include/header.jsp"%>
<!-- 왜 상대경로만 되는지... -->
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
</style>

<html>

<section id="home" name="home"></section>
<div id="headerwrap">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>Public Share</h1>
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
	<h1>SOME OF MY LATEST WORKS</h1>
	<div id="aboutwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 name">
					<!-- 상대경로, 절대경로 참조: https://stackoverflow.com/questions/34445457/404-error-for-bootstrap-min-css-and-bootstrap-min-js -->
					<a class="fancybox"	href="/resources/assets/img/portfolio/port01.jpg">
					<img class="img-responsive" src="/resources/assets/img/portfolio/port01.jpg"></a>
				</div>
				<!--/col-lg-4-->
				<div class="col-lg-6 name-desc">
					<div class="col-md-6"></div>
					<div class="col-md-6">
						<!-- BookDTO, MemberDTO, Criteria 필요 -->
						<h3>글쓴이, 등록일, 조회수</h3>
						<p>
							책제목<input type="text" value="${book.bname}" readonly="readonly">
						</p>
						<p>
							출판사<input type="text" value="${book.publisher}"
								readonly="readonly">
						</p>
						<p>
							날짜정보:
							<fmt:formatDate value="${book.regDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
						</p>
						<div>

							<!-- choose/when구문을 사용해서 해당 bookDTO의 available상태에 따른 노출값이 다를 수 있도록 구현 -->
							<c:choose>
								<c:when test="${book.resCnt eq '0'}">
									<input type="button" data-toggle="modal"
										data-target=".modalDialogA" value="대여">
								</c:when>
								<c:when test="${book.resCnt eq '1'}">
									<input type="button" data-toggle="modal"
										data-target=".modalDialogB" value="예약">
								</c:when>
							</c:choose>

							<!-- 대여리스트 화면으로 분기/ 이전 url에 따라서 뒤로가는 페이지가 다름 -->
							<a href="/loanbook/list?page=${cri.page}" class="btn">뒤로가기</a>
							
							
							<!-- bookDTO의 available이 T(True)일 경우 나타나는 모달 -->
							<div class="row text-center" style="padding: 50px;">
								<div class="modal fade modalDialogA " tabindex="-1"
									role="dialogA" aria-labelledby="modalLabelA">
									<div class="modal-dialog_a modal-lg">
										<div class="modal-content_a">
											<div class="modal-body_a  ">
												<h2>신청 페이지</h2>
												<h4>대여 하시겠습니까?</h4>
												<input type="hidden" name="bno" value="${book.bno}">
												<p>
													<button id="loanBook" class="btn btn-default">대여하기</button>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<!-- bookDTO의 available이 F(False)일 경우 나타나는 모달 -->
							<div class="row text-center" style="padding: 50px;">
								<div class="modal fade modalDialogB " tabindex="-1"
									role="dialogB" aria-labelledby="modalLabelB">
									<div class="modal-dialog_b modal-lg">
										<div class="modal-content_b">
											<div class="modal-body_b  ">
												<h2>This is a Reservation Modal!</h2>
												<h4>Some message text shown to users.</h4>
												<p>
													<button id="resBtn" class="btn btn-default">예약하기</button>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!--/col-lg-8-->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /aboutwrap -->
</div>
<!--/Portfoliowrap -->

<!-- 수정되는 부분 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#loanBook").on("click", function(e) {
			console.log(e.target);
			$.ajax({ //문제발생
				url : '/reservation/book/${book.bno}',
				type : 'post',
				success : function(result) {
					alert("success");
				}
			});
		});		
	});
</script>
<%@include file="../include/footer.jsp"%>