<%@page import="my.shop.productBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<%
	int oqty = Integer.parseInt(request.getParameter("oqty"));
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	productDao dao = productDao.getInstance();
	ArrayList<productBean> list = dao.getseletpro(pnum);
	if (list.get(0).getPqty() < oqty) {
%>
<script type="text/javascript">
		alert("수량을 초과했습니다");
		//history.back();
		location.href="mall_cartList.jsp"
</script>
<%
return;
	}
	
	mallCart.setEdit(pnum,oqty);
	response.sendRedirect("mall_cartList.jsp");

%>
