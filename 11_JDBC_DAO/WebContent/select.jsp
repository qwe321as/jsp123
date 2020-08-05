<%@page import="emart.EmartBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="emart.EmartDao" />
<%
request.setCharacterEncoding("UTF-8");
ArrayList<EmartBean> list = dao.getAllemart();
%>
<script type="text/javascript">
function insert() {
	location.href="insertForm.jsp";
}
function allch(obj) {
	var rowobj = document.getElementsByName("row");
	rowcnt = rowobj.length;
	if (obj.checked) {
		for (var i = 0; i < rowcnt; i++) {
			rowobj[i].checked = true;
		}
	} else {
		for (var i = 0; i < rowcnt; i++) {
			rowobj[i].checked = false;
		}

	}
}
function selectDelete() {
	flag = false;
	rowobj = document.getElementsByName("row");
	for (var i = 0; i < rowobj.length; i++) {
		if (rowobj[i].checked) {
			flag=true;
		}
	}
	if (!flag) {
		alert("하나라도 채크하세요")
		return;
	}
	document.myform.submit();
}
</script>
<form name="myform" action="deleteAll.jsp">
<input type="button" value="삭제" onclick="selectDelete()">
<input type="button" value="추가" onclick="insert()">
<table border="1">
<tr>
<td><input type="checkbox" name="allcheck" onclick="allch(this)" ></td>
<th>번호</th>
<th>아이디</th>
<th>비번</th>
<th>상품</th>
<th>시간대</th>
<th>결재</th>
<th>동의</th>
<th>수정</th>
<th>삭제</th>
</tr>
<tr>
<%
for(EmartBean bean : list){
	
%>
<tr>
<td><input type="checkbox" name="row" value="<%=bean.getNum() %>"></td>
<td><%=bean.getNum()%></td>
<td><%=bean.getId()%></td>
<td><%=bean.getPw()%></td>
<td><%=bean.getProduct()%></td>
<td><%=bean.getTime()%></td>
<td><%=bean.getApprove()%></td>
<td><%=bean.getAgree()%></td>
<td><a href="updateForm.jsp?num=<%=bean.getNum()%>">수정</a></td>
<td><a href="deleteProc.jsp?num=<%=bean.getNum()%>">삭제</a></td>
</tr>
<%	
}
%>
</table>
</form>