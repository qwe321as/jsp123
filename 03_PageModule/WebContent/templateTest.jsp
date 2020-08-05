<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
templateTest.jsp<BR><BR>
<% String contentPage = request.getParameter("contentPage"); %>
<table border="1" width="500" height="300">
	<tr>
		<td colspan="2">
		<%@ include file="top.jsp" %>
		</td>
	</tr>
	
	<tr>
		<td><%@ include file="left.jsp" %></td>
		<td><jsp:include page="<%=contentPage %>"></jsp:include></td>
	</tr>
	
	<tr>
		<td colspan="2">
		<jsp:include page="bottom.jsp"></jsp:include>
		</td>
	</tr>
</table>