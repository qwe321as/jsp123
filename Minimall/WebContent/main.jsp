<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel = "stylesheet" type = "text/css" href = "style.css">
<%
session.invalidate();//session 무효화
%>
<form action = "loginPro.jsp" method= "post">
<table border ="1">
  <tr align = "center">
     <td bgcolor = "#FFCC00">아이디</td>
     <td>
        <input type = "text" name = "id" value = "예지예지">
     </td>
  </tr>
  <tr align = "center">
     <td bgcolor = "#FFCC00">비번</td>
     <td>
        <input type = "password" name = "password" value = "1234">
     </td>
  </tr>
  <tr align = "center">
     <td colspan = "2" bgcolor = "yellow">
        <input type = "submit" value = "로그인">
        <input type = "button" value = "회원가입" onClick = "location.href = '<%=request.getContextPath()%>/myshop/member/register.jsp'">
        <input type = "button" value = "아이디 찾기" onClick = "location.href ='<%=request.getContextPath()%>/findid.jsp'">
        <input type = "button" value = "비번 찾기"  onClick ="location.href ='<%=request.getContextPath()%>/findpwd.jsp'">
     </td>
  </tr>
</table>
</form>