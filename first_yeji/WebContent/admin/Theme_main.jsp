<%@page import="thron.thronbean"%>
<%@page import="thron.throndao"%>
<%@page import="catego.catedao"%>
<%@page import="catego.catebean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
throndao dao =throndao.getInstance();
ArrayList<thronbean> list = dao.select();
%>
<h1>주제목록</h1>
<table border="1" align="center" cellspacing="0" width="600px">
	<tr>
		<th>번호</th>
		<th>책이름</th>
		<th>주제</th>
		<th>수정 / 삭제</th>
	</tr>
	<%if(list.size()==0){
	%>
	<tr><th colspan="4">토론주제가 존재하지 않습니다.</th></tr>
	<%
	}else { for(thronbean bean : list){
	%>
	<tr>
	<td align="center"><%=bean.getNum() %></td>
	<td align="center"><%=bean.getGenre() %></td>
	<td align="center"><%=bean.getSubject() %></td>
	<td align="center"><a href="theme_update.jsp?num=<%=bean.getNum()%>">수정 </a> / <a href="theme_delete.jsp?num=<%=bean.getNum()%>">삭제</a></td>
	</tr>
<%} }%>
<tr><td colspan="4" align="right"> <input type="button" onclick="location.href='theme.jsp'" value="토론주제 추가하기"> </td></tr>
</table>
<%@ include file="admin_bottom.jsp"%>