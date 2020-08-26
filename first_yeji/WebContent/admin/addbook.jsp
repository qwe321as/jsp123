<%@page import="catego.catedao"%>
<%@page import="catego.catebean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="login.loginbean"%>
<%@page import="login.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<%
request.setCharacterEncoding("UTF-8");

catedao dao = catedao.getInstance();
ArrayList<catebean> list = dao.select();
%>
<h1>책 추가하기</h1>
<form name="myform" action="addbookPro.jsp"
	enctype="multipart/form-data" method="post">
	<table border="1" width="500" align="center" cellspacing="0">
		<tr>
			<th align="center">제목</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th align="center">작가</th>
			<td><input type="text" name="author"></td>
		</tr>
		<tr>
		<tr>
			<th align="center">출판사</th>
			<td><input type="radio" name="publisher" value="책책나라">책책나라
				<input type="radio" name="publisher" value="북북천국">북북천국 <input
				type="radio" name="publisher" value="똑똑서점">똑똑서점 <input
				type="radio" name="publisher" value="인터파크">인터파크</td>
		</tr>
		<tr>
			<th align="center">장르</th>
			<td><select name="genre">
					<%
							if (list.size() == 0) {
						%><option value="">장르 없음</option>
					<%
							} else {
								for (int i=0; i<list.size(); i++) {
									catebean cbean = list.get(i);
						%>
					<option value="<%=cbean.getGenre()%>">
						<%=cbean.getGenre()%> [<%=cbean.getCode()%>]
					</option>
					<%
							}
							}
						%>
			</select></td>
		</tr>
		<tr>
			<th align="center">이미지</th>
			<td><input type="file" name="bimage"></td>
		</tr>
		<tr>
			<th align="center">내용</th>
			<td><input type="file" name="bcontents">
		</tr>
		<tr>
			<th colspan="2" align="center" headers="30"><input
				type="submit" value="책 등록"> <input type="reset" value="다시작성">
				<input type="button" value="목록보기" onclick="location='book_main.jsp'">
			</th>
		</tr>

	</table>
</form>

<%@ include file="admin_bottom.jsp"%>