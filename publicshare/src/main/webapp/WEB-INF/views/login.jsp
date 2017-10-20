<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>

<!-- í©ì³ì§ê³  ìµìíë ìµì  CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- ë¶ê°ì ì¸ íë§ -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- w3 Modalì¬ì©ì ìí link -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
body {
	background: url('/resources/assets/img/login.jpg') fixed;
	background-size: cover;
	padding: 0;
	margin: 0;
}

.card-container.card {
	width: 350px;
	padding: 40px 40px;
	margin-top: 25%
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

#joinBtn {
	float: right;
}
</style>

</head>
<body>

	<div id="joinModal" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 600px">

			<div class="w3-center">
				<br> 
				<span onclick="document.getElementById('joinModal').style.display='none'"
				class="w3-button w3-xlarge w3-hover-red w3-display-topright"
				title="Close Modal">&times;</span> 
				<img src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="Avatar"
				style="width: 30%" class="w3-circle w3-margin-top">
			</div>

			<form class="w3-container" action="/join" method="post">
				<div class="w3-section">
					<label><b>MemberID</b></label> 
					<input class="w3-input w3-border" type="text"
						placeholder="Enter Username" name="mid" required> 
					<label><b>Password</b></label>
					<input class="w3-input w3-border" type="password"
						placeholder="Enter Password" name="mpw" required> 
					<label><b>Name</b></label>
					<input class="w3-input w3-border" type="text"
						placeholder="Enter Name" name="mname" required>
					<label><b>Nickname</b></label>
					<input class="w3-input w3-border" type="text"
						placeholder="Enter Name" name="nickname" required>
				</div>
				<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
					<button id="joinBtn" class="btn btn-success">Join In</button>
					<button onclick="document.getElementById('joinModal').style.display='none'"
					class="btn btn-danger" id="regCancelBtn">Cancel</button>
				</div>
			</form>
		</div>
	</div>

	<div class="container">
		<div class="card card-container">
			<img id="profile-img" class="profile-img-card"
				src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
			<p id="profile-name" class="profile-name-card"></p>
			<form class="form-signin" action="/login" method="post">
				<span id="reauth-email" class="reauth-email"></span> 
				<input type="text" class="form-control" name="mid"
					placeholder="UserID" required autofocus> 
				<input type="password" name="mpw" class="form-control"
					placeholder="Password" required>
				<div id="remember" class="checkbox">
					<label><input type="checkbox" name="auto">Remember Me</label>
				</div>
				<button class="btn btn-lg btn-success btn-block ">Sign In</button>
			</form>
			<!-- /form -->
			<button class="btn btn-lg btn-danger btn-block"
				onclick="document.getElementById('joinModal').style.display='block'">Join Now!</button>
			<a href="#" class="forgot-password"> Forgot the password? </a>
		</div>
		<!-- /card-container -->
	</div>
	<!-- /container -->

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	var msg = '${result}';
	
	if (msg === 'success') {
		$('#joinModal').style.display='none';
	}
</script>

</body>
</html>