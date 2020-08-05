<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>

Ex03_result2.jsp<br>

<% request.setCharacterEncoding("UTF-8"); %>
<table border=1>
<%
	Enumeration<String> names = request.getParameterNames();
	while(names.hasMoreElements()){

		String name = names.nextElement();
		//out.print(name+" "); // name age gender hobby color
		
		String value = request.getParameter(name);
		//out.print(name+" : " + value +"<br>");
%>
		<tr>
			<td><%=name %></td>
			<td><%=value %></td>
		
		</tr>
<%			
	} // while
%>
    
</table>
    
    
    
    