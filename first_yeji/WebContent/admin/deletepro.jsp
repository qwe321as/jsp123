<%@page import="login.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
logindao dao = logindao.getInstance();
int cnt = dao.delete(id);
System.out.println(cnt);
if(cnt>0){
	response.sendRedirect("serch.jsp");
}
%>   
