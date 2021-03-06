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
	margin-left: 30%;
	margin-top: 5%;
	width: 40%;
	height: 50px;
}

#divPaging li {
	list-style: none;
	float: left;
	margin: 15 auto;
	text-align: center;
}

#divPaging>li>a, #divPaging>li>span {
	border-radius: 50% !important;
	margin: 0 5px;
}

/*search form 전용 css(sb)*/
body{
    margin-top:20px;
}
</style>

<section id="home" name="home"></section>
<div id="headerwrap">
	<div class="container">
		<div class="row">
			
			<div class="col-md-6 col-md-offset-3" >
				<h1 style="font-size:5em;">LOAN PAGE</h1>
			</div>
		</div>
		<!--container 검색용 elements https://bootsnipp.com/snippets/featured/search-panel-with-filters -->
		<form class = 'searchaction'action="/loanbook/list" method="get">
		<div class="container" style="margin-bottom: 50px">
		<!--row -->
		    <div class="row">    
		        <div class="col-xs-8 col-xs-offset-2">
				    <div class="input-group">
		                <div style="opacity:0.9" class="input-group-btn search-panel">
		                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		                    	<span id="search_concept">도서 제목</span><span class="caret"></span>
		                    </button>
		                    <ul style="opacity:0.9" class="dropdown-menu" role="menu">
		                      <li><a>도서 제목</a></li>
		                      <li><a>출판사</a></li>
		                      <li><a>소유주</a></li>
		                      <li><a>도서 제목+내용</a></li>
		                      
		                    </ul>
		                </div>
		                <input type="hidden" class="searchconcept" name = "searchConcept" value = "bname"> 
			            <input style="opacity:0.7" type="text" class="form-control condition" name="condition" placeholder="Search term...">
		                <span  class="input-group-btn">
		                    <button style="height:34px;opacity:0.9" class="btn btn-default searchconform" type="button"><span class="glyphicon glyphicon-search"></span></button>
		                </span>
		            </div>
		        </div>
			</div>
		<!--/row -->
		</div>
		
	</form>
	<!--/container container 검색용 elements  -->	
	</div>
	
</div>

<!--/headerwrap -->
<!-- PORTFOLIO SECTION -->
<section id="portfolio" name="portfolio"></section>

<div id="portfoliowrap" style="margin-top:20px">
	<div class="container">
		<hr>
		<div class="row">
			<!-- list 출력을 위한 forEach 시작 -->
			<div class="container" style="height: 80%">
			<c:choose>

				<c:when test="${empty booklist}">
					<div style="text-align: center; margin: 20% auto;"><h1>대여 가능한 도서가 없습니다</h1></div>
				</c:when>

				<c:when test="${!empty booklist}">
				
					<c:forEach items="${booklist}" var="book">
						<div class="col-sm-3 col-xs-12 desc">
							<div class="project-wrapper">
								<div class="project">
									<div class="photo-wrapper">
										<a href="/loanbook/view?bno=${book.bno}&page=${cri.page}">
											<div class="photo">
												<img src="/upload/thumb/${book.img}" alt="" onerror="this.src='/resources/assets/img/default.jpg'">
											</div>
											<div class="caption">
												<h4>${book.bname}</h4>
												<p>${book.owner} | ${book.publisher}</p>
												<h5>[${book.replycnt}]</h5>
												<!-- choose/when 구믄을 사용해 bookDTO의 resCnt 상태에 따른 버튼 표시 -->
												<c:choose>
													<c:when test="${book.resCnt eq '0'}">
														<button class="btn btn-success">대여 가능</button>
													</c:when>
													<c:when test="${book.resCnt ne '0'}">
														<button class="btn btn-danger">대여중</button>
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
				
				</c:when>
				
			</c:choose>
			</div>
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
	
	//search test
	$('.search-panel .dropdown-menu').find('a').click(function(e) {
		e.preventDefault();
		var concept = $(this).text();
		$('.search-panel span#search_concept').text(concept);
		$('.searchconcept').val(concept);
	});
	
	var url = new URL(window.location.href);
	var condition = url.searchParams.get("condition");
	var searchConcept = url.searchParams.get("searchConcept");
	
	var pageProperty = {
		    total: ${cri.total},
		    current: ${cri.page},
		    showCount: 8,
		    liCount: 5,
		    url: "/loanbook/list" 
		};
	
	if(condition != null){
		pageProperty.condition = '&condition='+condition;
		pageProperty.searchConcept = '&searchConcept='+searchConcept;
    };	
    

	var pageStr = PageMaker(pageProperty);
	
	
	$("#divPaging").html(pageStr);
	
 	$(".searchconform").on("click", function(e){
 		e.stopPropagation();
		e.preventDefault();
		$(".searchaction").submit();
	});

	
	
</script>

<%@include file="../include/footer.jsp"%>