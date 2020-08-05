<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
Ex03_result.jsp <hr>
<%
String name = request.getParameter("name");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String hobby = request.getParameter("hobby");
String color = request.getParameter("color");
String abc =request.getParameter("abc");
out.println(name);
out.println(age+"살");
if(gender.equals("m")){
	gender="남자";
}else{
	gender="여자";
}
out.println(gender);
out.println(hobby);
out.println(color);
//벨류값을 받아온다!

if(abc==null){
	out.println("abc는 없음");
}else{
	out.println("abc는 있음");
}
%>
<%-- 선택한 색 : <img src="../images/<%=color %>.jpg "/> --%>
선택한 색 : <img src="../images/<%=color + ".jpg" %>"/>