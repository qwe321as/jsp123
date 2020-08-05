<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_via.jsp<br><br>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String code = request.getParameter("code");
out.print(name+","+code);
System.out.println(name);
if(code.equals("A")){
	%><jsp:forward page= "Ex02_A.jsp" /><%
}
else if(code.equals("B")){
	%><jsp:forward page= "Ex02_B.jsp" /><%
}
else if(code.equals("O")){
	%><jsp:forward page= "Ex02_O.jsp" /><%
}
else{
	%><jsp:forward page= "Ex02_AB.jsp" /><%
}
%>


