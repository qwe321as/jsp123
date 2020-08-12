<%@page import="my.member.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); 
memberDao dao = memberDao.getInstance();
String userid = request.getParameter("userid");
boolean flag = dao.serchId(userid);
String str="";  

if(flag){
	str ="NO";
	out.print(str);
}else{
	str ="YES";
	out.print(str);
}




%>