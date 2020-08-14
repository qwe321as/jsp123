<%@page import="my.shop.productBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<script type="text/javascript">
function checkDel(pnum,pimage) {
	var answer =confirm("정말 삭제하시겠습니까?");
	if (answer) {
		location.href="prod_delete.jsp?pnum="+pnum+"&pimage="+pimage;
		//location.href="prod_delete.jsp?pnum="+pnum;
	}
}
</script> 
<%
	productDao dao = productDao.getInstance();
	ArrayList<productBean> list = dao.getallprodu();
	System.out.println(list.size());
%>

<td colspan="6" align="center" valign="top">
	<table width="95%" class=outline>
		<caption>
			<b>상품목록</b>
		</caption>
		<tr class=m2>
			<th>번호</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>이미지</th>
			<th>가격</th>
			<th>제조사</th>
			<th>수량</th>
			<th>수정|삭제</th>
		</tr>
		<%
			if (list.size() == 0) {
		%><tr>
			<th colspan="8" align="center">등록된 상품 없습니다</th>
		</tr>
		<%
			} else {
				for (productBean bean : list) {
		%>
		<tr>
			<td align="center"><%=bean.getPnum()%></td>
			<td align="center"><%=bean.getPcategory_fk()%></td>
			<td align="center"><%=bean.getPname()%></td>
			<td align="center"><a
				href="prod_view.jsp?pnum=<%=bean.getPnum()%>"> <img
					src="<%=request.getContextPath()%>/myshop/images/<%=bean.getPimage()%>"
					width="50px" height="50px" /></a></td>
			<td align="center"><%=bean.getPrice()%></td>
			<td align="center"><%=bean.getPcompany()%></td>
			<td align="center"><%=bean.getPqty()%></td>
			<td align="center"><a href="prod_updateForm.jsp?pnum=<%=bean.getPnum()%>">수정</a>| 
			<a	href="javascript:checkDel('<%=bean.getPnum()%>','<%=bean.getPimage()%>'  )">삭제</a> <%
 	}
 	}
 %>
		</tr>


	</table>
</td>
<%-- href="prod_delete.jsp?pnum=<%=bean.getPnum()%>" --%>
<%@ include file="bottom.jsp"%>