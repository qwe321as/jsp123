<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result.jsp
<%request.setCharacterEncoding("UTF-8");  //위에서 써야함 넘어오는 데이터를 받아오기전에 써야함 %>
<%
String name = request.getParameter("name");
String age = request.getParameter("age"); //네임만입력가능!! 
String addr = request.getParameter("addr"); //네임만입력가능!! 
%>
넘어온 데이터 <br>
이름 : <%=name%><br>
나이 : <%=age%><br>
주소 : <%=addr%><br>