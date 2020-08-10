<%@page import="board.boardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>
<style>
body{
width:100%;
text-align: center;
}
table{
margin:0auto;
}

</style>
list.jsp
<bR>
<%
	int pageSize = 10;//한페이지에 10개씩 보이도록하겠다
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
	ArrayList<boardBean> list = null;
	boardDao dao = boardDao.getInstance();
	count = dao.getArticleCount();//전체 레코드 갯수 리턴
	System.out.println("count " + count);
	if (count > 0) {
		list = dao.getArticles(startRow, endRow);
	}
	//복붙은 include 지시어
	number = count-(currentPage-1)*pageSize;
%>

<body bgcolor="<%=bodyback_c%>">
	<b>글목록(전체글 : <%=count%>)
	</b>
	<table width="700" border="1"  align="center" >
		<tr>
			<td align="right" bgcolor="<%=value_c%>"><a harf="writeform.jsp">글쓰기</a>
			</td>
		</tr>
	</table>
	<%
		if (count == 0) {
	%>
	<table width="700">
		<tr>
			<td>게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>
	<%
		} else {
	%>
	<table border="1"  align="center" width="700">
		<tr bgcolor="<%=value_c%>">
			<th width="50">번호</th>
			<th width="250">제목</th>
			<th width="100">작성자</th>
			<th width="150">작성일</th>
			<th width="50">조회</th>
			<th width="100">ip</th>
		</tr>
		<%
			for (boardBean bean : list) {
		%>
		<tr>
			<td align="center"><%=number-- %></td>
			<td align="left"><%=bean.getSubject() %></td>
			<td align="center"><%=bean.getWriter() %></td>
			<td align="center"><%=bean.getReg_date() %></td>
			<td align="center"><%=bean.getReadcount() %></td>
			<td align="center"><%=bean.getIp() %></td>
		</tr>

		<%
			}//for
		%>
	</table>
	<%
		}//else
	
	if(count >0){
		/* 10개까지 보이게, 10개후는 다음 */ 
		int pageCount = count/pageSize + (count % pageSize == 0?0:1);	
		int pageBlock = 10;
		int startPage = ((currentPage - 1)/pageBlock * pageBlock)+1;
		int endPage = startPage + pageBlock -1;
		if(endPage > pageCount)
			endPage = pageCount;
		
		if(startPage > 10){
			%>
			<a href="list.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
			<%
		}
	for(int i=startPage; i<=endPage; i++){
		%>
			<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
		<%
	}
		if(endPage < pageCount){
		%>
			<a href="list.jsp?pageNum=<%=startPage+10 %>">[다음]</a>
		<%
		}
	}//나머지가 7이면 이아니니까 1나와서 더하기 1됨
	%>
</body>