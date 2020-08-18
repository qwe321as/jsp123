<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.productDao"%>
<%@page import="my.shop.productBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp"%>
<script type="text/javascript">
function goCart() {
	oqty=document.f.oqty.value;
	if(oqty<1){
	alert("1이상의 수를 입력하세용");
	return;
	}else{
		location.href="<%=request.getContextPath()%>/myshop/display/mall_cartAdd.jsp";
	}
	
}
function goOrder() {
	alert("goOrder");
	
}
</script>
<%request.setCharacterEncoding("UTF-8"); %>
<% 
int pnum = Integer.parseInt(request.getParameter("pnum"));
productDao dao3 = productDao.getInstance();
ArrayList<productBean> list3 = dao3.getseletpro(pnum);
DecimalFormat df = new DecimalFormat("###,###");
%>
<table width="100%" align="center">
		<tr class="m1">
		<%
	for(productBean bean : list3){ 
	%>
	<th colspan="2"><font color="#998590" size=3><%=bean.getPname() %> 상품 정보</font></th></tr><tr>
		<td align="center" class="m3">
		<img src="<%=request.getContextPath()%>/myshop/images/<%=bean.getPimage()%>"
			width="200" height="200" />
			</td>
			<td class="m3" align="center"><form name="f" method="post" >
			 상품번호: <%=bean.getPnum() %>
			<br> 상품이름: <%=bean.getPname() %>
			<br> 삼품가격: <font color=red><%=df.format(bean.getPrice()) %></font> 원
			<br> 상품포인트: [<font color=red><%=df.format(bean.getPoint()) %> </font>]point
			<br> 상품 갯수:<input type="text" size="2" value="1" name="oqty" >개
			<br> 			<br> 
			
			<table width="90%" align="center">
			<tr>
			<td><a href="javascript:goCart()" >
			<img width="90" height="35" alt="장바구니 담기" src="<%=request.getContextPath() %>/img/cartbtn.gif"> </td></a>
			<td><a href="javascript:goOrder()" >
			<img padding="100" width="90" height="35"  alt="즉시구매하기" src="<%=request.getContextPath() %>/img/orderbtn.gif"> </td></tr></a>
			</table>
			</form>
			</td>
			</tR>
			<tr height="200" valign="top">
			<td colspan="2" class="m3"><b>상품 상세 설명 </b><br> <%=bean.getPcontents() %></td>
		 <%
	}
	
	%>
	</tr>
</table>

<%@ include file="mall_bottom.jsp"%>
