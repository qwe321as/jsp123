<%@page import="my.shop.productDao"%>
<%@page import="my.shop.productBean"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	CategoryDao dao = CategoryDao.getInstance();
	ArrayList<CategoryBean> list = dao.getselectCa();
	productDao p_dao = productDao.getInstance();
	ArrayList<productBean> P_list = p_dao.getseletpro(pnum);
%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<td colspan="6" align="center">
	<form name="myform" action="prod_update_proc.jsp" method="post"
		enctype="multipart/form-data">
		<table width="600" class=outline>
			<caption valign="top">
				<b>상품수정</b>
			</caption>
			<tr>
				<th class=m2>카테고리</th>
				<td><%=P_list.get(0).getPcategory_fk()%></td>
				<td><input type="hidden" name="Pcategory_fk"
					value="<%=P_list.get(0).getPcategory_fk()%>"></td>
			</tr>
			<tr>
				<th class=m2>상품 번호</th>
				<td>
					<%=P_list.get(0).getPnum()%></td>
				<td><input type="hidden" name="pnum"
					value="<%=P_list.get(0).getPnum()%>"></td>
			</tr>
			<tr>
				<th class=m2>상품명</th>
				<td><input type="text" name="pname"
					value="<%=P_list.get(0).getPname()%>"></td>
			</tr>
			<tr>
				<th class=m2>제조회사</th>
				<td><input type="text" name="pcompany"
					value="<%=P_list.get(0).getPcompany()%>"></td>
			</tr>
			<tr>
				<th class=m2>상품 이미지</th>
				<td>
				<img
					src="<%=request.getContextPath()%>/myshop/images/<%=P_list.get(0).getPimage()%>"
					width="200px" height="150px" /><input type="file" name="pimage"></td>
			</tr>
			<tr>
				<th class=m2>상품 수량</th>
				<td><input type="text" name="pqty"
					value="<%=P_list.get(0).getPqty()%>"></td>
			</tr>
			<tr>
				<th class=m2>상품 가격</th>
				<td><input type="text" name="price"
					value="<%=P_list.get(0).getPrice()%>"></td>
			</tr>
			<tr>
				<th class=m2>상품 스팩</th>
				<td>
				<select name="pspec">
						<option value="normal"
						<%if(P_list.get(0).getPspec().equals("normal")){%>selected<%}%>>
						::NORMAL::</option>
						<option value="hit"
						<%if(P_list.get(0).getPspec().equals("hit")){%>selected<% }%>
						>::HIT::</option>
						<option value="new"
						<%if(P_list.get(0).getPspec().equals("new")){%>selected<% }%>
						>::NEW::</option>
						<option value="best"
						<%if(P_list.get(0).getPspec().equals("best")){%>selected<% }%>
						>::BEST::</option>
				</select></td>
			</tr>
			<tr>
				<th class=m2>상품 소개</th>
				<td><textarea name="pcontents" cols="50" rows="5" resize="none"><%=P_list.get(0).getPcontents()%></textarea></td>
			</tr>
			<tr>
				<th class=m2>상품 포인트</th>
				<td><input type="text" name="point"	value="<%=P_list.get(0).getPoint()%>"></td>
			</tr>
			<tr>
				<td colspan="2" class=m1 align="center"><input type="submit"
					value="상품등록"> <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</td>
<%@ include file="bottom.jsp"%>