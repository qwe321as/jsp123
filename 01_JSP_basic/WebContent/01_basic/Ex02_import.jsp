<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar,java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		java.util.Calendar cal = java.util.Calendar.getInstance();
	%>
	오늘은

	<%=cal.get(Calendar.YEAR)%>년
	<%=cal.get(Calendar.MONTH + 1)%>년
	<%=cal.get(Calendar.DATE)%>일
	<%-- <%이름 스크립트릿 %> --%>

	<hr>
	오늘은
	<%
		Date date = new Date();
	%>
	<%=date %><br>
	<%=date.toLocaleString() %>
</body>
</html>