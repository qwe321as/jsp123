<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<h3>Ex04_result2.jsp</h3>
<table border="1">
<%
Enumeration<String> names =  request.getParameterNames();

while(names.hasMoreElements()){
	String name = names.nextElement();
	String [] value = request.getParameterValues (name);
    %>
	<tr> <td> <% out.println(name); %></td> <td><%
	//String value = request.getParameter(name);
    //out.println(value);
    for(int i=0; i<value.length; i++){
    	out.println(value[i]+" ");
    }
		 %></td>
	</tr> <%
}
%></table>