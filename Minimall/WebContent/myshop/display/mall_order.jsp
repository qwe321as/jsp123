<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.productBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp"%>
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" />
<%
boolean flag = (boolean)application.getAttribute("flag");
System.out.println("order_flag= "+application.getAttribute("flag"));

if(memid.equals("admin")){
	%>
	<script type="text/javascript">
	alert("관리자는 주문 할수 없습니다.")
history.back();
</script>
	<%
}
	
int pnum=Integer.parseInt(request.getParameter("pnum"));
int oqty=Integer.parseInt(request.getParameter("oqty"));
if(pnum !=0&&oqty!=0){
	if(flag==true){
mallCart.addProduct(pnum, oqty);
}}
DecimalFormat df = new DecimalFormat("###,###");
int cartTotalPrice =0;
	
%>
<table width="90%" class="outline" align="center" border="1">
	<tr class=m2 >
		<th colspan="3 ">결재 내역서 보기</th>
	</tr>
	<tr class=m1>
	<td align="center" width="40%">상품명</td>
	<td align="center" width="20%">수량</td>
	<td align="center" width="20%">금액</td>
	</tr>
		
	<%
	Vector<productBean> cv= mallCart.getAllProducts();
	if(cv.size()==0){
		out.print("<tr><td colspan=6 align='center' ><b>결재 내역서 보기</b></td></tr>");
	}else{
		for (productBean bean : cv) {
	%>
	<tr>
		<td align="center"><%=bean.getPname()%></td>
		<td align="right"><%=bean.getPqty()%>개</td>
		<td align="right"><%=df.format(bean.getPrice()) %>원 </td>

	</tr>
	<%
	cartTotalPrice += bean.getTotalPrice();
		}
		%>	<tr class=m1>
		<td colspan="6" align="center"><font color="red">결재하실  총액 : <%=df.format(cartTotalPrice) %>원 </font>  </td>
	</tr><%
		}
	%>
</table>
<input type="button" value="결재하기" onclick="location.href='<%=request.getContextPath()%>/myshop/display/mall_calculate.jsp'">
<% application.setAttribute("flag", false);
flag = (boolean)application.getAttribute("flag");
System.out.println("order_flag 아래 = "+application.getAttribute("flag"));%>
<%@ include file="mall_bottom.jsp"%>