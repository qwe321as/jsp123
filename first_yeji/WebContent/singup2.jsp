<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<style type="text/css">
#id_check {
	position: relative;
	left: 340px;
	border-top-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

#id_check:hover {
	position: relative;
	left: 340px;
	background-color: #FFEFF3;
	border-top-left-radius: 5px;
	border-bottom-right-radius: 5px;
}
</style>
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form class="login100-form validate-form flex-sb flex-w"
					method="post" action="singupPro.jsp" onsubmit="return writeSave()">
					<span class="login100-form-title p-b-32"> 회원가입 </span> <span
						class="txt1 p-b-11"> User name </span>
					<div class="wrap-input100 validate-input m-b-12">
						<input class="input100" type="text" name="name"
							placeholder="Your name"> <span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11"> ID
					</span>
						<span id="idmessage" style="display: none;"></span>
					<div class="wrap-input100 validate-input m-b-12">
						<input class="input100" type="text" name="id"
							placeholder="Your id"> <span class="focus-input100"></span>
					</div>
						<button type="button" id="id_check" onclick="duplicate()">
							<font color="gray" size="1">중복체크</font></button>
					
					<span class="txt1 p-b-11">
						Password &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<font color="gray" size="1">영문 소문자/숫자 조합 3~8자 </font>
					</span>
					<div class="wrap-input100 validate-input m-b-12">
						<input class="input100" type="password" name="password"
							id="password" placeholder="password" onBlur="pwcheck()" onkeyup="passwd_keyup()">
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11"> RE_Password <span id="pwmessage"
						style="display: none; position: relative; left: 130px;" ></span>
					</span>
					<div class="wrap-input100 validate-input m-b-12">
						<input class="input100" type="password" name="repassword"
							id="repassword" placeholder="Confirm Password"
							onkeyup="passwd_keyup()"> <span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11"> E-mail </span>
					<div class="wrap-input100 validate-input m-b-12">
						<input class="input100" type="email" name="email"
							placeholder="Eg: aucreative@gmail.com"> <span
							class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="Singup">

					</div>

				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script.js"></script>

</body>
</html>