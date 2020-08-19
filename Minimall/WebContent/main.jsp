<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%
session.invalidate();
%>
[로그인화면]
<br><br>
<script type="text/javascript"> </script>
<form method="post" action="loginPro.jsp">
<table border="1">
<tr>
<td bgcolor="pink" align="center">아이디</td> 
<td><input type="text" name="id" value="예지예지"></td>
</tr>
<tr>
<td bgcolor="pink"  align="center">비번</td> 
<td><input type="password" name="password" value="1234"></td>
</tr>
<tr>
<td bgcolor="#FFDDEF" colspan="2">
<input type="submit" value="로그인" >
<input type="button" value="회원가입" onclick="location.href='<%=request.getContextPath()%>/myshop/member/register.jsp'">
<input type="button" value="아이디 찾기" onclick="location.href='<%=request.getContextPath()%>/findid.jsp'">
<input type="button" value="비번 찾기" onclick="location.href='<%=request.getContextPath()%>/findpw.jsp'">
</td>
</tr>
</table>
</form>