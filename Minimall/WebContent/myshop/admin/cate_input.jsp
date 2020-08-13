<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<td colspan="6">
<form action="cate_input_proc.jsp" method="post" name="myform" >
<table border="1" width="350" align="center">
<tr>
<td bgcolor="pink" align="center">
<b>카테고리 코드</b></td>
<td>
<input type="text" name="code">
</td>
</tr>
<tr>
<td bgcolor="pink" align="center">
<b>카테고리 이름</b></td>
<td>
<input type="text" name="cname">
</td>
</tr>
<tr>
<td colspan="2" align="center" bgcolor="#FFF0F8">
<input type="submit" value="등록">
<input type="reset" value="취소">
</td>
</tr>
</table>
</form>
</td>
<%@ include file="bottom.jsp" %>