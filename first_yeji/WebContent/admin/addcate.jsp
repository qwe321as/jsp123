<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/script2.js"></script>
<h1>장르추가하기</h1>
<form action="addcatePro.jsp" method="post" onsubmit="return cateSave()">
	<table border="1" align="center" cellspacing="0">
		<tr>
			<th>장르이름</th>
			<td><input type="text" name="genre"></td>
		</tr>
		<th>장르코드</th>
		<td><input type="text" name="code"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="추가하기">
				<input type="button" value="목록이동하기"
				onclick="location.href='<%=request.getContextPath()%>/admin/cate_main.jsp'">
			</td>
		</tr>
	</table>
</form>
<%@ include file="admin_bottom.jsp"%>