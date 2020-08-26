<%@page import="book.bookbean"%>
<%@page import="book.bookdao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
	bookdao dao = bookdao.getInstance();
	ArrayList<bookbean> list = dao.getall();
	System.out.println(list.size());
%>
<script type="text/javascript">
function checkDel(bnum,bimage,bcontents) {
	var answer =confirm("정말 삭제하시겠습니까?");
	if (answer) {
		location.href="book_delete.jsp?bnum="+bnum+"&bimage="+bimage+"&bcontents="+bcontents;
	}
}
</script> 
<h1>책 목록</h1>
<table width="70%"  border="1"  align="center" cellspacing="0" >
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작가</th>
		<th>사진</th>
		<th>출판사</th>
		<th>장르</th>
		<th>내용</th>
		<th>삭제</th>
	</tr>
	<%
			if (list.size() == 0) {
		%><tr>
		<th colspan="8" align="center">등록된 책이 없습니다</th>
	</tr>
	<%
			} else {
				for (bookbean bean : list) {
		%>
	<tr>
		<td align="center"><%=bean.getBnum()%></td>
		<td align="center"><%=bean.getTitle()%></td>
		<td align="center"><%=bean.getAuthor()%></td>
		<td align="center">
			<img src="<%=request.getContextPath()%>/admin/book/<%=bean.getBimage()%>" width="50px" height="50px" /></td>
		<td align="center"><%=bean.getPublisher()%></td>
		<td align="center"><%=bean.getGenre()%></td>
		<td align="center">
		<a href="<%=request.getContextPath()%>/admin/book/<%=bean.getPcontents()%> " onclick="window.open(this.href,'txt','width=100,height=800');return false;">
		<%=bean.getPcontents()%></a></td>
		<td align="center">
		<a href="javascript:checkDel('<%=bean.getBnum()%>','<%=bean.getBimage()%>' )">삭제</a>
			<%
 	}
 	}
 %>
	</tr>
	<tr><td colspan="8" align="right"> <input type="button" onclick="location.href='addbook.jsp'" value="책 추가하기"> </td></tr>
</table>
<%@ include file="admin_bottom.jsp"%>