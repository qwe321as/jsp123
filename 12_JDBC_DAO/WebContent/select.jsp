<%@page import="book.bookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="book.bookDao"/>
<%
request.setCharacterEncoding("UTF-8"); 
ArrayList<bookBean> list = dao.getAllbook();
%>
<script type="text/javascript">
function insert() {
	location.href="insertForm.jsp";
}
function allch(obj) {
	rowobj = document.getElementsByName("row");
	if(obj.checked){
		for (var i = 0; i < rowobj.length; i++) {
			rowobj[i].checked = true;
		}
	}else{
		for (var i = 0; i < rowobj.length; i++) {
			rowobj[i].checked = false;
		}
	}
}
function selectdelete() {
	flag=false;
	rowobj = document.getElementsByName("row");
	for (var i = 0; i < rowobj.length; i++) {
		if (rowobj[i].checked) {
			flag=true;
		}
	}
	if (!flag) {
		alert("하나라도 채크하세용");
		return;
	}
	document.myform.submit();
	
}
</script>
<form name="myform" action="deleteAll.jsp">
<input type="button" value="삭제" onclick="selectdelete()" >
<input type="button" value="추가" onclick="insert()" >
<table border= "1">
<tr><td><input type="checkbox" name="alcheck" onclick="allch(this)"></td>
<th>번호</th>
<th>제목</th>
<th>저자</th>
<th>출판사</th>
<th>가격</th>
<th>입고일</th>
<th>배송비</th>
<th>구입가능 서점</th>
<th>보유수량</th>
<th>수정</th>
<th>삭제</th>
</tr>
<% 
for(bookBean bean : list){
%>
<tr>
<td><input type="checkbox" name="row" value="<%=bean.getNum()%>"></td>
<td><%=bean.getNum()%></td>
<td><%=bean.getTitle()%></td>
<td><%=bean.getAuthor()%></td>
<td><%=bean.getPublisher()%></td>
<td><%=bean.getPrice()%></td>
<td><%=bean.getBuy()%></td>
<td><%=bean.getKind()%></td>
<td><%=bean.getBookstore()%></td>
<td><%=bean.getCount()%></td>
<td><a href="updateForm.jsp?num=<%=bean.getNum() %>">수정</a></td>
<td><a href="deleteProc.jsp?num=<%=bean.getNum() %>">삭제</a></td>

<%} %>
</table>
</form>