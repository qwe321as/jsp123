<%@page import="gonji.gonjibean"%>
<%@page import="gonji.gonjidao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
gonjidao dao = gonjidao.getInstance();
ArrayList<gonjibean> list = dao.getall();
%>
<h1>공지사항 추가하기</h1>
<form action="addgonjiPro.jsp" method="post">
	<table border="1" align="center" cellspacing="0">
		<tr>
			<th align="center">제목</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
		<tr>
			<th>내용</th>
			<td><input type="text" name="content"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="추가하기">
				<input type="button" value="목록이동하기"
				onclick="location.href='<%=request.getContextPath()%>/admin/gonji_main.jsp'">
			</td>
		</tr>
	</table>
</form>
<%@ include file="admin_bottom.jsp"%>