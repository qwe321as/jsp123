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
<h1>공지사항 목록</h1>
<table border="1" align="center" cellspacing="0" width="600px">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성시간</th>
		<th>삭제</th>
	</tr>
	<%if(list.size()==0){
	%>
	<tr><th colspan="5">공지가 존재하지 않습니다.</th></tr>
	<%
	}else { for(gonjibean bean : list){
	%>
	<tr>
	<td align="center"><%=bean.getNum() %></td>
	<td align="center"><%=bean.getTitle() %></td>
	<td align="center"><%=bean.getContent() %></td>
	<td align="center"><%=bean.getReg_date() %></td>
	<td align="center"><a href="gonji_delete.jsp?num=<%=bean.getNum()%>">삭제</a></td>
	</tr>
<%} }%>
<tr><td colspan="5" align="right"> <input type="button" onclick="location.href='addgonji.jsp'" value="공지사항 추가하기"> </td></tr>
</table>
<%@ include file="admin_bottom.jsp"%>
