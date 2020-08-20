<%@page import="board.boardDao"%>
<%@page import="board.boardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%@include file="../display/mall_top.jsp" %>
<%@include file="color.jsp"%>
<style>
body {
	width: 100%;
	text-align: center;
}

table {
	margin: 0auto;
}
</style>
<% 
int num = Integer.parseInt(request.getParameter("num"));
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
boardDao dao2 = boardDao.getInstance();
boardBean bean = dao2.updategetbean(num);
%>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="script.js"></script>
수정하기
<body bgcolor="<%=bodyback_c%>">
</body>
	<!-- form에 쓸떄는 submit submit에쓸떄는 onclick -->
<form method="post" name="writeform" action="updataPro.jsp?pageNum=<%=pageNum %>" onsubmit="return writeSave()">
	<table border="1" width="450px" align="center" cellspacing="0">
		<tr align="right">
			<td colspan="2" bgcolor="<%=value_c%>"><a href="list.jsp">글목록</a></td>
		</tr>
		<tr>
		
			<td width="100" align="center" bgcolor="<%=value_c%>">이름</td>
			<td>
			<input type="hidden" name="num" value="<%=num %>">
			<input type="text" size="30" maxlength="10" name="writer"
				value="<%=bean.getWriter()%>"></td>
		</tr>
		<tr>
			<td width="100" align="center" bgcolor="<%=value_c%>">제목</td>
			<td width="350"><input type="text" size="50" value="<%=bean.getSubject() %>"
				maxlength="50" name="subject"></td>
		</tr>
		<tr>
			<td width="100" align="center" bgcolor="<%=value_c%>">Email</td>
			<td width="350"><input type="text" size="50" maxlength="30"
				value="<%=bean.getEmail() %>" name="email"></td>
		</tr>
		<tr>
			<td width="100" align="center" bgcolor="<%=value_c%>">내용</td>
			<td width="350"><textarea name="content" id="adc" rows="13"
					cols="50"><%=bean.getContent() %></textarea></td>
		</tr>
		<tr>
			<td align="center" bgcolor="<%=value_c%>">비밀번호</td>
			<td><input type="password" size="10" maxlength="12"
				 name="passwd"></td>
		</tr>
		<tr> 
			<td colspan=2 align="center" height="30" bgcolor="<%=value_c%>">
				<input type="submit" value="글쓰기" >
				<input type="reset" value="다시작성"> 
				<input type="button" value="목록보기" onclick="location='list.jsp'">
			</td>
		</tr>
	</table>
</form>
<%@include file="../display/mall_bottom.jsp" %>