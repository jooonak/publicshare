<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- header start -->
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="/resources/assets/ico/favicon.ico">


<title>Public Share</title>

<!-- Bootstrap core CSS -->
<link href="/resources/assets/css/bootstrap.css" rel="stylesheet">
<link href="/resources/assets/css/bootstrap2.css?ver=1" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/assets/css/style.css?ver=3" rel="stylesheet">
<!-- <link href="/resources/assets/css/font-awesome.min.css" rel="stylesheet"> -->

<link href="/resources/assets/js/fancybox/jquery.fancybox.css"
	rel="stylesheet" />

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
		
<body data-spy="scroll" data-offset="0" data-target="#navigation">
	<!-- Fixed navbar -->
	<div id="navigation" class="navbar navbar-default navbar-fixed-top">
		<div style="margin-left: 5%; margin-right: 5%">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/loanbook/list"><b>PUBLIC SHARE</b></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="smothscroll">${member.nickname}(${member.mname})님</a></li>
					<li><a href="/loanbook/list" class="smothscroll">Loan page</a></li>
					<li><a href="/itemmanage/list" class="smothscroll">My Item Manage</a></li>
					<li><a href="/return/list" class="smothScroll">My Loan List</a></li>
					<li><a href="/mypage" class="smothScroll">MyPage</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<!-- header end  -->
	