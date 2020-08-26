<%@page import="java.util.ArrayList"%>
<%@page import="book.bookdao"%>
<%@page import="book.bookbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/script2.js"></script>
<%
request.setCharacterEncoding("UTF-8");
bookdao dao = bookdao.getInstance();
ArrayList<bookbean> list = dao.getall();
%>
<h1>주제추가하기</h1>
<form action="addthePro.jsp" method="post" onsubmit="return thrsave()">
	<table border="1" align="center" cellspacing="0">
		<tr>
			<th align="center">책이름</th>
			<td>
			<select name="genre">
						<%
							if (list.size() == 0) {
						%><option value="">장르 없음</option>
						<%
							} else {
								for (int i=0; i<list.size(); i++) {
									bookbean cbean = list.get(i);
						%>
						<option value="<%=cbean.getTitle()%>">
							<%=cbean.getTitle()%>
							[<%=cbean.getGenre()%>]
						</option>
						<%
							}
							}
						%>
				</select>
				</td>
		</tr>
		<tr>
		<tr>
			<th>주제</th>
			<td><input type="text" name="subject"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="추가하기">
				<input type="button" value="목록이동하기"
				onclick="location.href='<%=request.getContextPath()%>/admin/Theme_main.jsp'">
			</td>
		</tr>
	</table>
</form>
<%@ include file="admin_bottom.jsp"%>