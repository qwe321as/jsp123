<%@page import="book.bookbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="book.bookdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main_top.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script2.js"></script>
<style type="text/css">
body{
width:100%;
text-align: center;
}
table{
margin:0auto;
}

</style>
<%
bookdao dao1 = bookdao.getInstance();
ArrayList<bookbean> list = dao1.getall();
memid = (String)session.getAttribute("memid");
%>
<h1>독후감 쓰기</h1>
<form method="post" name="writeform" onsubmit="return writeSave()" action="writePro.jsp" >
	<table border="1" width="500" align="center" cellspacing="0">

		<tr>
			<td align="center">이름</td>
			<td><input type="text" readonly="readonly" name="writer" value="<%=memid%>"> 
			<input type="hidden" name="writer" value="name"></td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td align="center">책</td>
			<td><select name="book">
					<%
							if (list.size() == 0) {
						%><option value="">저장된 책없음</option>
					<%
							} else {
								for (int i=0; i<list.size(); i++) {
									bookbean bbean = list.get(i);
						%>
					<option value="<%=bbean.getTitle()%>">
						<%=bbean.getTitle()%> [<%=bbean.getGenre()%>]
					</option>
					<%
							}
							}
						%>
			</select></td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td><textarea id="abc" name="content" row="13" cols="50"></textarea></td>
		</tr>
		<tr>
			<td align="center">비밀번호</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td colspan="2" align="center" headers="30">
			<input type="submit" value="글쓰기"> 
				<input type="reset" value="다시작성"> 
				<input type="button" value="목록보기" onclick="location='board_main.jsp'">
		</tr>

	</table>
</form>
<%@include file="../main_bottom.jsp"%>
