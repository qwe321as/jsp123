<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String name = request.getParameter("name");
String [] name2 = request.getParameterValues("name");
String pw = request.getParameter("pw");
String [] pw2 = request.getParameterValues("pw");
//String fruit = request.getParameter("fruit");
String[] fruit = request.getParameterValues("fruit");
out.println("이름은 : "+name+"<br> 비밀번호는 : "+pw+"<br> 과일은 : ");
for(int i =0; i<fruit.length; i++){
	out.println(fruit[i]);
}
%><hr><% 
out.println("이름은 : "+name2[0]+"<br> 비밀번호는 : "+pw2[0]+"<br> 과일은 : ");
for(int i =0; i<fruit.length; i++){
	out.println(fruit[i]);
}
%>