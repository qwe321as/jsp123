<%@page import="login.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
logindao dao = logindao.getInstance();
String id = request.getParameter("id");
boolean flag = dao.findid(id);
String str =" ";
if(flag){
	str="NO";
	out.print(str);
}else{
	str="YES";
	out.print(str);
}

%>