<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");  %>

<%CategoryDao dao = CategoryDao.getInstance();
ArrayList<CategoryBean> list = dao.getselectCa();%>
<%@ include file="top.jsp"%>
<td colspan="6" valign="top">
<table border="1" width="550" >
<caption align="top"><b> 카테고리 목록 </b> </caption>
<tr bgcolor="#FFEFF7">
<th width="10%">번호</th>
<th width="25%">카테고리코드</th>
<th width="45%">카테고리명</th>
<th width="10%">수정</th>
<th width="10%">삭제</th>
</tr>
<% if(list.size()==0){
	%><tr><th colspan="5">등록된 카테고리 없습니다</th></tr><%
}else{
for(CategoryBean cbean : list){
	/* 
	valign은 새로  alignd은 가로
	for(int i=0; i<list.size(),i++){
		CategoryBean cbean = list.get(i);
	 */
%>
<tr>
<td align="right"><%=cbean.getCnum() %></td>
<td align="center"><%=cbean.getCode() %></td>
<td align="center"><%=cbean.getCname() %></td>
<td align="center"><a href="cate_updateForm.jsp?cnum=<%=cbean.getCnum()%>">수정</a></td>
<td align="center"><a href="cate_delete.jsp?cnum=<%=cbean.getCnum()%>">삭제</a></td>
</tr>
<%} }%>
</table>
</td>
<%@ include file="bottom.jsp"%>