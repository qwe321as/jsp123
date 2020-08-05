<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<h4>Ex05_result_이예지.jsp</h4>

<table border="1">
	<%
		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement();
			String[] value = request.getParameterValues(name);
	%>
	<tr><td>
			<%	out.println(name);
			%>
		</td><td>
			<%
				for (int i = 0; i < value.length; i++) {
						if (value[i].equals("on"))
							value[i] = "동의함";
						out.println(value[i] + " ");}
			%>
		</td></tr>
	<%
		}
	%>
</table>
<hr>
<table border="1">
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String time = request.getParameter("time");
		String [] product = request.getParameterValues("product");
		String approve = request.getParameter("approve");
		String agree = request.getParameter("agree");
		if (agree.equals("on"))
			agree = "동의함";
		%>
		<tr><td>
<%		
		out.println("id"); %></td> <td>  <% 
		out.println(id);
		%>
		</td></tr>
		<tr><td>		
<%		
		out.println("pw"); %></td> <td>  <% 
		out.println(pw);
		%>
		</td></tr>
		<tr><td>
<%	
		out.println("time"); %></td> <td>  <% 
		out.println(time);
		%>
		</td></tr>
		<tr><td>
<%	
		out.println("product"); %></td> <td>  <% 
		for(int i =0; i<product.length; i++){
		out.println(product[i]);
		}
		%>
		</td></tr>
		<tr><td>
<%	
		out.println("approve"); %></td> <td>  <% 
		out.println(approve);
		%>
		</td></tr>
		<tr><td>
<%	
		out.println("agree"); %></td> <td>  <% 
		out.println(agree);
		
%>

		</td></tr>
</table>
