<%@page import="text.ReadFromFile"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.List"%>
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
<h3>책이미지를 누르면 미리보기가 가능합니다.</h3>
<h5>txt파일을 누르면 책내용을 읽을 수 있습니다.</h5>
<table align="center">
<TR>
<td>

</td>
</tr>
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
		
	<a href="readbook_.jsp?bnum=<%=bean.getBnum()%>">
	<img src="<%=request.getContextPath()%>/admin/book/<%=bean.getBimage()%>"width="200px" height="250px" /> </a>
		</td></tr>
		<tr> <td align="center"> <%=bean.getTitle()%> </td></tr>
		<tr><td align="center"> <%=bean.getAuthor()%> </td></tr>
		<tr><td align="center">	<%=bean.getPublisher()%> </td></tr>
		<tr><td align="center">	<%=bean.getGenre()%> </td></tr>
		<tr><td align="center">	<a href="<%=request.getContextPath()%>/admin/book/<%=bean.getPcontents()%>"
		onclick="window.open(this.href,'txt','width=500,height=500');return false;">
			<%=bean.getPcontents()%></a></td></tr>
	</table></td>
		<%
 	}
 	}
 %>
 </tr>
</table>

<%@ include file="main_bottom.jsp"%>