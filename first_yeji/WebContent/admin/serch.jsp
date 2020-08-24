<%@page import="java.util.ArrayList"%>
<%@page import="login.loginbean"%>
<%@page import="login.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<style type="text/css">
body {
	width: 100%;
	text-align: center;
}

table {
	margin: 0auto;
}
</style>
<%
	logindao dao = logindao.getInstance();
ArrayList<loginbean> list = dao.select();
%>
<h1>회원관리</h1>
<table border="1" width="800" align="center" cellspacing="0">
	<tr>
		<th>회원번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이메일</th>
	</tr>
	<%
	for(loginbean bean: list){
	%>
		<tr>
		<th><%=bean.getNo() %></th>
		<th><%=bean.getName() %></th>
		<th><%=bean.getId() %></th>
		<th><%=bean.getPassword() %></th>
		<th><%=bean.getEmail() %></th>
	</tr>
	<%} %>


</table>