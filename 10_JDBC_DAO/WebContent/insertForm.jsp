<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="insertProc.jsp" method="post">
		이름  : <input type="text" name="name" value="홍길동"><br><br>
		부서번호 :
		<select name="did" >
			<option value="1" selected="selected">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		</select><br><br>
		급여     : <input type="text" name="salary" value="300"><br><br>
		<input type="submit" value="가입하기">
	</form>
</body>
</html>
