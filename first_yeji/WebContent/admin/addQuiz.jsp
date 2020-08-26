<%@page import="book.bookbean"%>
<%@page import="book.bookdao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="admin_top.jsp" %>
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
request.setCharacterEncoding("UTF-8");
bookdao dao = bookdao.getInstance();
ArrayList<bookbean> list = dao.getall();
%>
<h1>퀴즈 추가하기</h1>
<form method="post" name="Quizadd" onsubmit="return QuizSave()"
	action="QuizPro.jsp">
	<table border="1"  align="center" cellspacing="0">
<tr>

</tr>
		<tr>
			<th align="center">책이름</th>
			<td><select name="book">
						<%
							if (list.size() == 0) {
						%><option value="">장르 없음</option>
						<%
							} else {
								for (int i=0; i<list.size(); i++) {
									bookbean cbean = list.get(i);
						%>
						<option value="<%=cbean.getTitle()%>">
							<%=cbean.getTitle()%>
							[<%=cbean.getGenre()%>]
						</option>
						<%
							}
							}
						%>
				</select></td>
		</tr>
		<tr>
			<th align="center">퀴즈</th>
			<td>
			<input type="text" name="question">
			</td>
		</tr>
		<tr>
			<th align="center">정답</th>
			<td>
			<input type="text" name="answer">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" headers="30">
			<input type="submit" value="추가하기">
			<input type="button" value="퀴즈목록보기" onclick="location.href='<%=request.getContextPath()%>/admin/Quiz_main.jsp'">
		</tr>

	</table>
</form>
<%@ include file="admin_bottom.jsp"%>