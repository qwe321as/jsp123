<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" />
<%
int pnum = Integer.parseInt(request.getParameter("pnum"));
mallCart.remove(pnum);
%>
<script type="text/javascript">
		alert("삭제되었습니당");
		location.href="mall_cartList.jsp"
</script>