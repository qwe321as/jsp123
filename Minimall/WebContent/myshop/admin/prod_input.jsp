<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	CategoryDao dao = CategoryDao.getInstance();
	ArrayList<CategoryBean> list = dao.getselectCa();
%>
<td colspan="6" align="center">
	<form name="myform" action="prod_input_proc.jsp" method="post" enctype="multipart/form-data">
		<table width="600" class=outline>
			<caption valign="top">
				<b>상품등록</b>
			</caption>
			<tr>
				<th class=m2>카테고리</th>
				<td><select name="pcategory_fk">
						<%
							if (list.size() == 0) {
						%><option value="">카테고리 없음</option>
						<%
							} else {
								for (int i=0; i<list.size(); i++) {
									CategoryBean cbean = list.get(i);
						%>
						<option value="<%=cbean.getCode()%>">
							<%=cbean.getCname()%>
							[<%=cbean.getCode()%>]
						</option>
						<%
							}
							}
						%>
				</select></td>
			</tr>
			<tr>
				<th class=m2>상품명</th>
				<td><input type="text" name="pname" value="이름"></td>
			</tr>
			<tr>
				<th class=m2>상품 코드</th>
				<td><input type="text" name="pcode" value="이름"></td>
			</tr>
			<tr>
				<th class=m2>제조회사</th>
				<td><input type="text" name="pcompany" value="이름"></td>
			</tr>
			<tr>
				<th class=m2>상품 이미지</th>
				<td><input type="file" name="pimage"></td>
			</tr>
			<tr>
				<th class=m2>상품 수량</th>
				<td><input type="text" name="pqty" value="3"></td>
			</tr>
			<tr>
				<th class=m2>상품 가격</th>
				<td><input type="text" name="price" value="100"></td>
			</tr>
			<tr>
				<th class=m2>상품 스팩</th>
				<td><select name="pspec">
						<option value="normal">::NORMAL::</option>
						<option value="normal">::HIT::</option>
						<option value="new">::NEW::</option>
						<option value="best">::BEST::</option>
				</select></td>
			</tr>
			<tr>
				<th class=m2>상품 소개</th>
				<td><textarea name="pcontents" cols="50" rows="5" resize="none"></textarea></td>
			</tr>
			<tr>
				<th class=m2>상품 포인트</th>
				<td><input type="text" name="point" value="222"></td>
			</tr>
			<tr>
				<td colspan="2" class=m1 align="center"><input type="submit"
					value="상품등록"> <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</td>
<%@ include file="bottom.jsp"%>