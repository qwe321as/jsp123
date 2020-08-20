<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
#container { width:300px; height:300px; background-color:#191970; text-align:center; }
#block {  border:10px dashed pink; width:50px; height:50px; display:inline-block; margin:125px 0; }

</style>
로그인 페이지
<form action="main.jsp" method="post">
	<div id=container>
	<table id=block>
		<tr>
			<td>아이디</td>
			<td><input type="text" value="admin" name="id"></td>
		</tr>

		<tr>
			<td>비밀번호</td>
			<td><input type="password" value="1234" name="pw"></td>
		</tr>
	</table>
	</div>
</form>