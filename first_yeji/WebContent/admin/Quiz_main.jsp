<%@page import="quizz.quizzbean"%>
<%@page import="quizz.quizzdao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
quizzdao dao = quizzdao.getInstance();
ArrayList<quizzbean> list = dao.select();
%>
<h1>퀴즈목록</h1>
<table border="1" align="center" cellspacing="0" width="600px">
	<tr>
		<th>번호</th>
		<th>책이름</th>
		<th>퀴즈문제</th>
		<th>퀴즈정답</th>
		<th>삭제</th>
	</tr>
	<%
	if(list.size()==0){
		%>
		<tr><th colspan="5">퀴즈가 존재하지 않습니다</th></tr>
		<%
	}else{
	for(quizzbean bean : list){
	%>
	<tr>
	<td align="center"><%=bean.getQnum() %></td>
	<td align="center"><%=bean.getBook()%></td>
	<td align="center"><%=bean.getQuestion() %></td>
	<td align="center"><%=bean.getAnswer() %></td>
	<td align="center"><a href="quiz_delete.jsp?qnum=<%=bean.getQnum()%>">삭제</a></td>
	</tr>
<%}} %>
<tr><td colspan="5" align="right"> <input type="button" onclick="location.href='addQuiz.jsp'" value="퀴즈 추가하기"> </td></tr>
</table>
<%@ include file="admin_bottom.jsp"%>
