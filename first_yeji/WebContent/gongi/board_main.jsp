
<%@page import="gonji.gonjidao"%>
<%@page import="gonji.gonjibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main_top.jsp"%>
<style type="text/css">
body {
	width: 100%;
	text-align: center;
}

table {
	margin: 0auto;
}
</style>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
gonjidao dao = gonjidao.getInstance();
ArrayList<gonjibean> list = dao.getall();
	%>
<h1>공지사항</h1>

<table border="1" width="800" align="center" cellspacing="0">

	<%
			if (list.size() == 0) {
		%>
	<tr>
		<td colspan="5" align="center"><b>게시판에 저장된 글이 없습니다.</b></td>
	</tr>
</table>
<%
		} else {
	%>
<tr>
	<th width="50">번호</th>
	<th width="250">제목</th>
	<th width="100">작성자</th>
	<th width="150">작성일</th>
</tr>
<%
		for (gonjibean bean : list) {
	%>
<tr>
	<td align="center"><%=bean.getNum() %></td>
	<td align="center"><a href="content.jsp?num=<%=bean.getNum()%>" > <%=bean.getTitle() %></a></td>
	<td align="center"><%=bean.getWriter()%></td>
	<td align="center"><%=sdf.format(bean.getReg_date()) %></td>
</tr>
<%
		}
	%>
</table>
<%} 
%>
<%@include file="../main_bottom.jsp"%>