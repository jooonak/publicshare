<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="./include/header.jsp"%>
<html>
<!-- í©ì³ì§ê³  ìµìíë ìµì  CSS -->

<!-- ë¶ê°ì ì¸ íë§ -->
<link href="/resources/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- w3 Modalì¬ì©ì ìí link -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
body {
	background: url('/resources/assets/img/mypage.jpg') fixed;
	background-size: cover;
	padding: 0;
	margin: 0;
}

.card-container.card {
	width: 350px;
	padding: 40px 40px;
	margin-top: 15%
}

.btn {
	font-weight: 700;
	height: 36px;
	-moz-user-select: none;
	-webkit-user-select: none;
	user-select: none;
	cursor: default;
}

/*
 * Card component
 */
.card {
	background-color: #F7F7F7;
	/* just in case there no content*/
	padding: 20px 25px 30px;
	margin: 0 auto 25px;
	margin-top: 50px;
	/* shadows and rounded borders */
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.profile-img-card {
	width: 96px;
	height: 96px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	margin: 10px 0 0;
	min-height: 1em;
}

.reauth-email {
	display: block;
	color: #404040;
	line-height: 2;
	margin-bottom: 10px;
	font-size: 14px;
	text-align: center;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin #inputEmail, .form-signin #inputPassword {
	direction: ltr;
	height: 44px;
	font-size: 16px;
}

.form-signin input[type=email], .form-signin input[type=password],
	.form-signin input[type=text], .form-signin button {
	width: 100%;
	display: block;
	margin-bottom: 10px;
	z-index: 1;
	position: relative;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin .form-control:focus {
	border-color: rgb(104, 145, 162);
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
}

.btn.btn-signin {
	/*background-color: #4d90fe; */
	/*background-color: rgb(104, 145, 162);
    / background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
	padding: 0px;
	font-weight: 700;
	font-size: 14px;
	height: 36px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	border: none;
	-o-transition: all 0.218s;
	-moz-transition: all 0.218s;
	-webkit-transition: all 0.218s;
	transition: all 0.218s;
}

.forgot-password {
	color: rgb(104, 145, 162);
}

.forgot-password:hover, .forgot-password:active, .forgot-password:focus
	{
	color: rgb(12, 97, 33);
}

#regBtn {
	float: right;
}

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
	background-color: white;
	border-radius: 10px;
	color: black;
	padding: 10px;
}
</style>

<div class="row text-center" style="padding: 50px;">
	<div class="modal fade alert-modal" tabindex="-1"
		role="dialogA" aria-labelledby="modalLabelA">
		<div class="modal-dialog_a modal-lg">
			<div class="modal-content_a">
				<div class="modal-body_a  ">
					<h1 class = "alert-subject"></h1>
					<p>
						<button type="button" class="btn btn-default alert-close" data-dismiss="modal">확인</button>
					</p>
				</div>
			</div>
		</div>
	</div>
</div> 	



<div class="container">
	<div class="card card-container">
		<div>
			<p id="profile-name" class="profile-name-card"></p>
			<form class="form-signin" action="/modify" method="post">
				<label>ID
				<input type="text" class="form-control" name="mid"	placeholder="UserID" value="${member.mid}" readonly="readonly"></label>
				<label>ENTER PASSWORD
				<input type="password" class="form-control" name="mpw" placeholder="Password" required value="${member.mpw}"></label> 
				<label>NICKNAME
				<input type="text" class="form-control" name="nickname" placeholder="UserID" value="${member.nickname}"></label> 
				<label>NAME
				<input type="text" class="form-control" name="mname" placeholder="UserID" value="${member.mname}" readonly="readonly"></label> 
				<label>JOIN	DATE
				<input type="text" class="form-control" name="joindate" placeholder="UserID" value="${member.joinDate}" readonly="readonly"></label>
				<button type="submit" id="modify" class="btn btn-success btn-block">MODIFY</button>
				<button id="logout" class="btn btn-danger btn-block">LOGOUT</button>
			</form>
			<!-- /form -->
		</div>
		<!-- /card-container -->
	</div>
</div>
<!-- /container -->

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script src="/resources/assets/js/bootstrap.min.js?ver=1"></script>
<script type="text/javascript">
$(document).ready(function() {

	var $alertModal = $(".alert-modal");
	
	if ('${result}' == 'modify') {
		$(".alert-subject").html("정보 수정 성공!");
		
		$alertModal.modal('show');	
		$alertModal.on('hidden.bs.modal', function () {
			location.reload();
		});
	}
	
	$("#logout").on("click", function(e){
		e.preventDefault();
		$(".form-signin").attr("action","/logout").attr("method","post").submit();
	});
	
});
</script>

</body>
</html>