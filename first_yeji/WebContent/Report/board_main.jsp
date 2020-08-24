<%@page import="book.bookbean"%>
<%@page import="board.boardDao"%>
<%@page import="board.BoardBean"%>
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
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	ArrayList<BoardBean> list = null;
	boardDao dao2 = boardDao.getInstance();
	count = dao2.getArticleCount();
	System.out.println("count " + count);	
	if (count > 0) {
		list = dao2.getArticles(startRow, endRow);
	}
	number = count-(currentPage-1)*pageSize;
	%>
	<h1>독후감</h1>
<h3> 글목록(전체글 : <%=count%>)</h3>

<table border="1" width="800" align="center" cellspacing="0">
	<tr>
		<td align="right" colspan="5"><a href="writeform.jsp">글쓰기</a></td>
	</tr>
	<%
			if (count == 0) {
		%>
	<tr>
		<td colspan="5" align="center"><b>저장된 독후감이 없습니다.</b></td>
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
	<th width="50">조회</th>
</tr>
<%
		for (BoardBean bean : list) {
	%>
<tr>
	<td align="center"><%=number--%></td>
	<td align="left">
 <a href="content.jsp?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>">
			<%=bean.getTitle()%>
	</a>
	</td>
	<td align="center"><%=bean.getWriter()%></td>
	<td align="center"><%=sdf.format(bean.getReg_date()) %></td>
	<td align="center"><%=bean.getReadcount()%></td>
</tr>
<%
		}
	%>
</table>
<%} 
		if(count >0){
			int pageCount = count/pageSize +(count % pageSize ==0?0:1);
			int pageBlock =10;
			int startPage=((currentPage -1)/pageBlock* pageBlock)+1;
			int endPage = startPage + pageBlock -1;
			if(endPage>pageCount)
				endPage=pageCount;
			if(startPage>10){
				%>
<a href="board_main?pageNum=<%=startPage-10 %>">[이전]</a>
<%
			}for(int i=startPage; i<=endPage; i++){
				%>
<a href="board_main.jsp?pageNum=<%=i %>">[<%=i %>]
</a>
<%
		}
			if(startPage<pageCount){
				%>
<a href="board_main?pageNum=<%=startPage+10 %>">[다음]</a>
<%
			}
		}
		
		%>
<%@include file="../main_bottom.jsp"%>