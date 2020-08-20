<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../../style.css">
<style>
body{
text-align: center;}
table{
margin:0px auto;}
.logout{
float: right;
}
</style>
<%
request.setCharacterEncoding("UTF-8");
String contextPath = request.getContextPath();
CategoryDao dao = CategoryDao.getInstance();
ArrayList<CategoryBean> list =dao.getselectCa();
String memid = (String)session.getAttribute("memid");//세션 받아오기
%>
<table width="770px" border="1" align="center">

	<tr>
		<td colspan="2" align="center"><a
			href="<%=contextPath%>/main.jsp">HOME</a> 
			<%if(memid.equals("admin")){ %>
			<a
			href="<%=contextPath%>/myshop/admin/main.jsp">관리자홈</a>
			<%} %> <a
			href="<%=contextPath%>/myshop/display/mall.jsp">쇼핑몰홈</a> <a
			href="<%=contextPath%>/myshop/display/mall_cartList.jsp">장바구니</a> <a
			href="<%=contextPath%>/myshop/board/list.jsp">게시판</a> <a
			href="<%=contextPath%>/myshop/display/company.jsp">회사소개</a> 
			
			
			<a class="logout" href="<%=contextPath%>/logout.jsp"> 
			<img src="<%=contextPath%>/myshop/images/logout.png" width="20"
				height="20">
		</a>
		<span class="logout"><%=memid %>님</span>
		</td>
	</tr>
	<tr>
		<td width="180px" align="center" valign="top"  border="1">
				카테고리
			<table width="100%" align="left" border="1">
				<%
				if(list.size()==0){
					%><tr>
					<td>카테고리가 없습니다</td>
				</tr>
				<%
				}else{
					for(CategoryBean bean : list){
				%>
				<tr>
					<td><a href="<%=contextPath %>/myshop/display/mall_cgList.jsp?code=<%=bean.getCode() %>&cgname=<%=bean.getCname() %>">
					<%=bean.getCname() %> [<%=bean.getCode() %>]</a></td>
				</tr>
				<%}} %>

			</table>
		</td>
			<td width="600px" align="center" valign="top"> 