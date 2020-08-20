<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.mall.OrdersBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<jsp:useBean id="order" class="my.shop.mall.OrdersDao" scope="session" />
<td colspan="6" align="center" valign="top">
	<%
	request.setCharacterEncoding("UTF-8");
	DecimalFormat df = new DecimalFormat("###,###");
	Vector<OrdersBean> list = new Vector<OrdersBean>();
	int total=0;
	String memid = request.getParameter("memid");
	if (memid != null) {
		list = order.getOrderList(memid);
	System.out.println(list.get(0).getMid());
		}
%>
	<table border="1" width="800px">
		<tr>
			<td colspan="5" align="center">
				<form action="shopping_list.jsp" method="post">
					조회할 회원 아이디 입력 : <input type="text" name="memid" value="예지예지">
					<input type="submit" value="내역 조회">
				</form>
			</td>
		</tr>
		<tr align="center" bgcolor="#FFDDE2">
			<th>고객명</th>
			<th>아이디</th>
			<th>상품명</th>
			<th>수량</th>
			<th>금액</th>
		</tr>
		<%
			if (list.size() == 0) {
		%><tr>
			<th align="center" colspan="5">
			<font color="red">주문내역이 없습니다.</font></th>
		</tr>
		<%
			} else {
					for (OrdersBean bean : list) {
		%>
		<tr>
			<td align="center"><%=bean.getMname()%></td>
			<td align="center"><%=bean.getMid()%></td>
			<td align="center"><%=bean.getPname()%></td>
			<td align="right"><%=bean.getQty()%></td>
			<td align="right">￦<%=df.format(bean.getAmount())%></td>
		</tr>

		<%
		total += bean.getAmount();
			}
				}
			
		%>
		<tr>
			<td colspan="4" align="center">총합</td>
			<td align="right">￦<%=df.format(total) %></td>
		</tr>

	</table>
</td>
<%@ include file="bottom.jsp"%>