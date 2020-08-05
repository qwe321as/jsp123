<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_via.jsp<br><br>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String code = request.getParameter("code");
//out.print(name+","+code); 출력안됌
System.out.println(name);

%>
<jsp:forward page="<%=\"Ex02_\" + code +\".jsp\" %>">
<jsp:param value="<%=name %>" name="name"/>
</jsp:forward>