<%@page import="catego.catedao"%>
<%@page import="catego.catebean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
catedao dao = catedao.getInstance();
ArrayList<catebean> list = dao.select();
%>
<h1>장르목록</h1>
<table border="1" align="center" cellspacing="0" width="600px">
	<tr>
		<th>번호</th>
		<th>장르코드</th>
		<th>장르이름</th>
		<th>수정 / 삭제</th>
	</tr>
	<%if(list.size()==0){
	%>
	<tr><th colspan="4">장르가 존지하지 않습니다.</th></tr>
	<%
	}else { for(catebean bean : list){
	%>
	<tr>
	<td align="center"><%=bean.getCnum() %></td>
	<td align="center"><%=bean.getCode() %></td>
	<td align="center"><%=bean.getGenre() %></td>
	<td align="center"><a href="cate_update.jsp?cnum=<%=bean.getCnum()%>">수정 </a> / <a href="cate_delete.jsp?cnum=<%=bean.getCnum()%>">삭제</a></td>
	</tr>
<%} }%>
<tr><td colspan="4" align="right"> <input type="button" onclick="location.href='addcate.jsp'" value="카테고리 추가하기"> </td></tr>
</table>
<%@ include file="admin_bottom.jsp"%>
