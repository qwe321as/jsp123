<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findid.jsp
<link href="style.css" rel="stylesheet" type="text/css">
<form action="findidPro.jsp" method="post">
<table border="1" align="center">
<tr>
<td bgcolor="pink" align="center">이름</td>
<td><input type="text" name="name" value="이예지"></td>
</tr>
<tr>
<td bgcolor="pink" align="center">주민등록번호</td>
<td>
<input type="text" name="rrn1" maxlength="6" size="6" value="123456">
-
<input type="text" name="rrn2" maxlength="7" size="7" value="1234567">
</td>
</tr>
<tr>
<td colspan="2" bgcolor="pink" align="center">
<input type="submit" value="아이디찾기">
</td>
</tr>
</table>
</form>