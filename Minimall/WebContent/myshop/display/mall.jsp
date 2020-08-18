<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.productDao"%>
<%@page import="my.shop.productBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="mall_top.jsp"%>
<h3>Welcome to My mall
<%

productDao pdao = productDao.getInstance();
String [] spec={"HIT","NEW","BEST","NORMAL"};
DecimalFormat df = new DecimalFormat("###,###");

for(int i=0; i<spec.length; i++){
	ArrayList<productBean> list1 = pdao.getSelectBySpe(spec[i]);
	%>
	<hr color=pink width="80%">
	<font color = red size=3><b><%=spec[i]%></b></font>
	<hr color=pink width="80%">
	<%
	if(list1.size()==0){
		out.println("<b>"+spec[i]+"상품 없습니다.</b>"); 
	}else{
	%>
	<table width="100%"  align="center">
	<tr>
	<%
	int count=0;
	for(productBean bean : list1){ 
	%>
	<td align="center" >
	<a href="mall_prodView.jsp?pnum=<%=bean.getPnum() %>">
	<img src="<%=request.getContextPath()%>/myshop/images/<%=bean.getPimage()%>"width="80px" height="80px" /></a>
	<br><b><%=bean.getPname() %></b>	
	<br><font color=red><%=df.format(bean.getPrice()) %>원</font>
	<br><font color=blue>[<%=df.format(bean.getPoint()) %>]point	</font>
<%-- 	<br><%=bean.getPnum()%>	</td> --%>
 	<%count++;
	if(count%3==0){
		out.println("<tr></tr>");
	}%>
	<%} %>
	</tr>
	</table>
	 <%
	}
}
%>

<%@ include file="mall_bottom.jsp"%>