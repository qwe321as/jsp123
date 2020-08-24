<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<style type="text/css">
#title{
position: absolute;
top: 18%; 
left: 50%; 
max-width: 100%; 
-webkit-transform: translate(-50%,-50%); 
-ms-transform: translate(-50%,-50%); 
transform: translate(-50%,-50%);

}
#back{
position: absolute;
right: 100px;
bottom: 55px;
}
</style>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="style.css">
<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
   <div class="container-login100">
	<img src="img/log.png" id="title">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form class="login100-form validate-form flex-sb flex-w" method="post" 
				action="Finepw_pro.jsp"  onsubmit="return Check()">
					<span class="login100-form-title p-b-32"> 비밀번호 찾기 </span> 
					
					<span class="txt1 p-b-11"> ID
					</span>
						<span id="idmessage" style="display: none;"></span>
					<div class="wrap-input100 validate-input m-b-12">
						<input class="input100" type="text" name="id"
							placeholder="Your id"> <span class="focus-input100"></span>
					</div>
						
					<span class="txt1 p-b-11"> E-mail </span>
					<div class="wrap-input100 validate-input m-b-12">
						<input class="input100" type="email" name="email"
							placeholder="Eg: aucreative@gmail.com"> <span
							class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn">
					<br>
						<input type="submit" class="login100-form-btn" value="Submit">

					</div>
					<div class="container-login100-form-btn">
						<input type="button" class="login100-form-btn" id="back" value="back" onclick="location.href='login2.jsp'">

					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script2.js"></script>
</body>
</html>
