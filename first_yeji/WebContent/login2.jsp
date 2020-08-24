<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>로그인 페이지</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="style.css">

	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<style type="text/css">
#title{
position: absolute;
top: 25%; 
left: 50%; 
max-width: 100%; 
-webkit-transform: translate(-50%,-50%); 
-ms-transform: translate(-50%,-50%); 
transform: translate(-50%,-50%);

}
</style>
</head>
<body>
<img src="img/log.png" id="title">
	<div class="limiter">

		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
			
				<form class="login100-form validate-form flex-sb flex-w" action="loginPro.jsp" >
					<span class="login100-form-title p-b-32">
						로그인
					</span>

					<span class="txt1 p-b-11">
						ID
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "ID를 입력하세요">
						<input class="input100" type="text" name="id" >
						<span class="focus-input100"></span>
					</div>
					
					<span class="txt1 p-b-11">
						Password
					</span>
					<div class="wrap-input100 validate-input m-b-12" data-validate = "Password를 입력하세요">

						<input class="input100" type="password" name="password" >
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-b-48">
					

						<div>
							<a href="FinePw.jsp" class="txt3">
								Forgot Password
							</a>
						</div>
						<div>
							<a href="FineId.jsp" class="txt3">
								Forgot Id
							</a>
						</div>
						<div>
							<a href="singup2.jsp" class="txt3">
								Sing Up
							</a>
						</div>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	

	<script src="js/main.js"></script>

</body>
</html>