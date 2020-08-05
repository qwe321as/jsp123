<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int i;
int sum = 0;
for(i=1; i<11; i++){
	sum=sum+i;
%>
1~<%=i %> : <%=sum %><br>
<%
}
%>
<hr>
<%out.println(sum);%>
1~10 :
<%=sum%>
<hr>
<table border=1 width="300">
<% for(i=1; i<=9; i++){
	%>
	<tr> <td><%=i %></td>
	 <td><%=i*i %></td>
	</tr>
	<%
}  %>


</table>