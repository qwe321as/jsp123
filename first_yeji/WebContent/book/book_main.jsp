<%@page import="book.bookbean"%>
<%@page import="book.bookdao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="main_top.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
	bookdao dao = bookdao.getInstance();
	ArrayList<bookbean> list = dao.getall();
	System.out.println(list.size());
%>
<style type="text/css">
body {
	width: 100%;
	text-align: center;
}

table {
	margin: 0auto;
}
</style>
<h1>책 목록</h1>
<table align="center">
<tr>
	<%
			if (list.size() == 0) {
		%><tr>
		<th colspan="8" align="center">등록된 책이 없습니다</th>
	</tr>
	<%
			} else {
				for (bookbean bean : list) {
		%><td>
	<table>
	    <tr><td align="center">
		<img src="<%=request.getContextPath()%>/admin/book/<%=bean.getBimage()%>"width="200px" height="250px" /> 
		</td></tr>
		<tr> <td align="center"> <%=bean.getTitle()%> </td></tr>
		<tr><td align="center"> <%=bean.getAuthor()%> </td></tr>
		<tr><td align="center">	<%=bean.getPublisher()%> </td></tr>
		<tr><td align="center">	<%=bean.getGenre()%> </td></tr>
		<tr><td align="center">	<a href="<%=request.getContextPath()%>/admin/book/<%=bean.getPcontents()%>
		 "onclick="window.open(this.href,'txt','width=100,height=800');return false;">
			<%=bean.getPcontents()%></a></td></tr>
	</table></td>
		<%
 	}
 	}
 %>
 </tr>
</table>
<%@ include file="main_bottom.jsp"%>