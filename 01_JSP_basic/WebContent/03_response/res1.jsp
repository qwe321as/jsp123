<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>res1.jsp</h3>

<%
String msg = request.getParameter("msg");
out.println("msg: "+msg);

System.out.println(msg);
//HttpServletResponse response = new HttpServletResponse();
response.sendRedirect("res2.jsp?abc="+msg);
%>