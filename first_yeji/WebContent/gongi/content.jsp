<%@page import="gonji.gonjibean"%>
<%@page import="gonji.gonjidao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main_top.jsp"%>
<jsp:useBean id="bean" class="gonji.gonjibean" />
<%
request.setCharacterEncoding("UTF-8");
gonjidao dao = gonjidao.getInstance();
int num = Integer.parseInt(request.getParameter("num"));
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
bean = dao.selectone(num);

%>
<style type="text/css">
body{
width:100%;
text-align: center;
}
table{
margin:0auto;
}

</style>
<h2>글내용보기</h2>
<table border="1" width="500" align="center" cellspacing="0">
	<tr>
		<th>글번호</th>
		<td colspan="3"><%=num %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=bean.getWriter()%></td>
		<th>작성일</th>
		<td><%=sdf.format(bean.getReg_date()) %></td>
	</tr>
	<tr>
		<th>글제목</th>
		<td colspan="3"><%=bean.getTitle() %></td>
	</tr>
	<tr>
		<th>글내용</th>
		<td  colspan="3"> <%=bean.getContent() %></td>
	</tr>
	<tr>
		<td colspan="4"  width="125" align="right" >
			<input type="button" value="글목록" onclick="location='board_main.jsp'">
			</td>
	</tr>
</table>
<%@include file="../main_bottom.jsp"%>
