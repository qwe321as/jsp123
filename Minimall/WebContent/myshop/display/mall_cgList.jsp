<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.productBean"%>
<%@page import="my.shop.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp"%>
<link rel="stylesheet" type="text/css" href="../../style.css">

<%request.setCharacterEncoding("UTF-8");
String code = request.getParameter("code");
String cgname= request.getParameter("cgname");
productDao dao2 = productDao.getInstance();
ArrayList<productBean> list2 = dao2.getSelectBySpe(code,cgname);
DecimalFormat df = new DecimalFormat("###,###");


%>
<h3>Welecom to My Mall</h3>
<hr color="pink" width="80%">
	<font color = red size=3><b><%=cgname%></b></font>
<hr color="pink" width="80%">
<%
	if(list2.size()==0){
		out.println("<b>"+cgname+" 상품 없습니다.</b>"); 
	}else{
	%>
<table width="80%" align="center">

	<tr>
		<%
	int count=0;
	for(productBean bean : list2){ 
	%>
		<td align="center">
		<a href="mall_prodView.jsp?pnum=<%=bean.getPnum() %>">
		<img src="<%=request.getContextPath()%>/myshop/images/<%=bean.getPimage()%>"
			width="80px" height="80px" /></a> <br>
		<b><%=bean.getPname() %></b> <br>
		<font color=red><%=df.format(bean.getPrice()) %>원</font> <br>
		<font color=blue>[<%=bean.getPoint() %>]point
		</font> 
	<%
		count++;}
	if(count%3==0){
		out.println("<tr></tr>");
	}}%>
	</tr>
</table>

<%@ include file="mall_bottom.jsp"%>
