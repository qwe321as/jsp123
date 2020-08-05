<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border = "1">
<%
%> <tr align="center" background="red"> <% 
for(int i=2; i<10; i++){
	%> <th bgcolor=pink width="300px"> <% out.println(i+"단"); %> </th> <% 	
}
%>
</tr>
<% 
for(int i =1; i<10; i++){
%>
<tr align="center">
<% 
	for(int j=2; j<10; j++){
		%>   <td>  <% 
		out.println(j+"*"+i+"="+i*j);
		%>   </td>  <% 
	}
	%>   </tr>  <% 
}
%>

</table>
