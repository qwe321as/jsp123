<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); 
%>
<jsp:useBean id="dao" class="Movie.MovieDao" />
<%
String userid = request.getParameter("userid");
boolean flag = dao.serchId(userid);
System.out.println("userid : "+userid);
String str="";  
if(flag){
	str ="NO";
	out.print(str);
}else{
	str ="YES";
	out.print(str);
}
%>