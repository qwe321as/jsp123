<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main_top.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script2.js"></script>
<style type="text/css">
body{
width:100%;
text-align: center;
}
table{
margin:0auto;
}

</style>
<h3>글쓰기</h3>
<form method="post" name="writeform" onsubmit="return writeSave()" action="writePro.jsp" >
	<table border="1" width="500" align="center" cellspacing="0">

		<tr>
			<td align="center">이름</td>
			<td><input type="text" readonly="readonly" name="writer" value="name"> 
			<input type="hidden" name="writer" value="name"></td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td><textarea id="abc" name="content" row="13" cols="50"></textarea></td>
		</tr>
		<tr>
			<td align="center">비밀번호</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td colspan="2" align="center" headers="30">
			<input type="submit" value="글쓰기"> 
				<input type="reset" value="다시작성"> 
				<input type="button" value="목록보기" onclick="location='board_main.jsp'">
		</tr>

	</table>
</form>
<%@include file="../main_bottom.jsp"%>
