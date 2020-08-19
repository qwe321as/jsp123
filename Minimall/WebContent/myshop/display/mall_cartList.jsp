<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="my.shop.productBean"%>
<%@page import="my.shop.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	DecimalFormat df = new DecimalFormat("###,###");
	int cartTotalPrice = 0;
	int oqty, pnum = 0;
	int cartTotalPoint = 0;
%>
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" />
<%@ include file="mall_top.jsp"%>
<table width=100% border="1" align="center">
	<tr class=m2>
		<th colspan="6">장바구니 보기</th>
	</tr>
	<tr class=m1>
		<th width="10%">번호</th>
		<th width="20%">상품명</th>
		<th width="20%">수량</th>
		<th width="20%">단가</th>
		<th width="20%">금액</th>
		<th width="10%">삭제</th>
	</tr>

	<%
		Vector<productBean> cv = mallCart.getAllProducts();
		if (cv.size() == 0) {
			out.print("<tr><td colspan=6 align='center' ><b>장바구니에 상품이 없습니다.</b></td></tr>");
		} else {
			for (productBean bean : cv) {
	%>
	<tr>
		<td align="center"><%=bean.getPnum()%></td>
		<td align="center"><img alt="<%=bean.getPname()%>"
			src="<%=request.getContextPath()%>/myshop/images/<%=bean.getPimage()%>"
			width="40" height="40"><br> <%=bean.getPname()%></td>
		<td align="center">
			<form action="mall_cartEdit.jsp" name="f" method="post">
				<input type="text" size="2" name="oqty" value="<%=bean.getPqty()%>">개
				<input type="hidden" name="pnum" value="<%=bean.getPnum()%>">
				<input type="submit" value="수정">
			</form>
		</td>
		<td align="center"><%=df.format(bean.getPrice())%>원 <br>[<%=df.format(bean.getPoint())%>]point</td>
		<td align="center"><font color=red><%=df.format(bean.getTotalPrice())%>원
				<br> [<%=df.format(bean.getTotalPoint())%>]point</font></td>
		<td align="center"><a
			href="mall_cartDel.jsp?pnum=<%=bean.getPnum()%>">삭제</a></td>

	</tr>
	<%
		cartTotalPrice += bean.getTotalPrice();
				cartTotalPoint += bean.getTotalPoint();
			}
	%>
	<tr class=m1>
		<td colspan="4"><font color="red">장바구니 총액 : <%=df.format(cartTotalPrice)%>원
		</font> <br>
		<font color="green"> 총적립포인트: [<%=df.format(cartTotalPoint)%>]point
		</font></td>
		<td colspan="2" align="center"><a href="mall_order.jsp?pnum=00&oqty=00">[주문하기]</a>
			<a href="mall.jsp">[계속 쇼핑]</a></td>
	</tr>
	<%
		}
	%>
</table>


<%@ include file="mall_bottom.jsp"%>
