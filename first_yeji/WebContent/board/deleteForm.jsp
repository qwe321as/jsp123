<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main_top.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/script2.js"></script>
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
int num = Integer.parseInt(request.getParameter("num"));
int pageNum = Integer.parseInt(request.getParameter("pageNum"));

%>
<h3>글 삭제하기</h3>
<form method="post" name="writeform" onsubmit="return deleteSave()"
	action="deletePro.jsp">
	<table border="1" width="500" align="center" cellspacing="0">

		<tr>
			<td align="center">비밀번호</td>
			<td>
			<input type="password" name="password">
			<input type="hidden" name="num" value="<%=num %>">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" headers="30"><input type="submit"
				value="삭제하기"> <input type="button" value="목록보기"
				onclick="location='board_main.jsp?pageNum=<%=pageNum%>'">
		</tr>

	</table>
</form>
<%@include file="../main_bottom.jsp"%>
