<%@page import="my.shop.productBean"%>
<%@page import="my.shop.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%request.getParameter("UTF-8");%>
<% productDao dao = productDao.getInstance();
int pnum = Integer.parseInt(request.getParameter("pnum"));
productBean bean= dao.selectproduct(pnum);
%>
<script type="text/javascript">
function goBack() {
	window.history.back();
}
</script>
<td colspan="6" align="center" valign="top">

	<table class=outline width="600">
	<caption>
			<b>상품상세보기</b>
		</caption>
		<tr>
			<th width="15%" class=m2>카테고리</th>
			<td width="35%"><%=bean.getPcategory_fk() %></td>
			<th width="15%" class=m2>상품번호</th>
			<td width="35%"><%=bean.getPnum() %></td>
		</tr>
		<tr>
			<th class=m2>상품명</th>
			<td><%=bean.getPname() %></td>
			<th class=m2>제조회사</th>
			<td><%=bean.getPcompany() %></td>
		</tr>
		<tr>
			<th class=m2>상품이미지</th>
			<td colspan="3">
				<img src="<%=request.getContextPath()%>/myshop/images/<%=bean.getPimage()%>"
					width="200px" height="150px" /></td>
		</tr>
		<tr>
			<th class=m2>상품수량</th>
			<td><%=bean.getPqty() %></td>
			<th class=m2>상품가격</th>
			<td><%=bean.getPrice() %></td>
		</tr>
		<tr>
			<th class=m2>상품스펙</th>
			<td><%=bean.getPspec() %></td>
			<th class=m2>상품포인트</th>
			<td><%=bean.getPoint() %></td>
		</tr>
		<tr>
			<th class=m2>상품소개</th>
			<td colspan="3"><textarea rows="5" cols="50" resize="none" readonly="readonly"> <%=bean.getPcontents() %></textarea> </td>
		</tr>
			<tr>
				<td colspan="4" class=m1 align="center">
				<input type="button" value="돌아가기" onclick="goBack()" > </td>
			</tr>

	</table>
</td>
<%@ include file="bottom.jsp"%>