<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<b>글삭제</b>
<%@include file="color.jsp"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
int pageNum= Integer.parseInt(request.getParameter("pageNum"));
%>
<script type="text/javascript" src="jquery.js"></script> 
<script type="text/javascript">
function deleteSave() {
	if(document.delFrom.passwd.value==""){
		alert("비밀번호를 입력하세요");
		document.delFrom.passwd.focus();
		return false;
	}
}


</script>
<style>
body {
	width: 100%;
	text-align: center;
}

table {
	margin: 0auto;
}
</style>
<body bgcolor="<%=bodyback_c%>">

</body>

<form method="post" action="deletePro.jsp" name="delFrom" onsubmit="return deleteSave()">
<table border="1" width="500" align="center" cellspacing="0">
<tr>
<th width="125" align="center" bgcolor="<%=value_c%>">
비밀번호를 입력하주세요</th>
</tr>
<tr>
<td align="center">
<input type="hidden" name="num" value="<%=num %>">
비밀번호: <input type="password" name="passwd" size="8" maxlength="12">
</td>
</tr>
<tr>
<td width="125" align="center" bgcolor="<%=value_c%>">
<!-- <input type="submit" value="글삭제" onclick="return deleteSave()">-->
<input type="submit" value="글삭제" >
<input type="button" value="글목록" onclick="location='list.jsp?pageNum=<%=pageNum%>'">
</td>
</tr>
</table>
</form>