<%@page import="empl.emplBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="empl.emplDao" />
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<emplBean> list = dao.getAllempl();
	System.out.println("select.jsp al.size():" + list.size());
%>
<script type="text/javascript">
	function allDelete(obj) {
		//alert(2);
		//obj = document.getElementsByName("rowcheck");
		//var chkobj = document.myform.rowcheck; 네임이 rowcheck인 것들의 정보를 가져와라
		//alert(obj.checked); obj는 this->alldelete를 의미한다.  
		var chkobj = document.getElementsByName("rowcheck");
		rowcnt = chkobj.length;
		if (obj.checked) {
			for (var i = 0; i < rowcnt; i++) {
				chkobj[i].checked = true;
			}
		} else {
			for (var i = 0; i < rowcnt; i++) {
				chkobj[i].checked = false;
			}

		}
	}
	function insert() {
		//alert(1);
		location.href = "insertForm.jsp";
	}
	function selectDelete() {
		flag = false;
		var chkobj = document.getElementsByName("rowcheck"); 
		for (var i = 0; i < chkobj.length; i++) {
			if (chkobj[i].checked) {
				flag = true;
			}
		}
		if (!flag) {
			alert("하나라도 채크하세요.");
			return;
		}
		document.myform.submit();	
				//submit 누른것처럼 동작하세요

	}
</script>
<form name="myform" action="deleteAll.jsp">
	<input type="button" value="삭제" onclick="selectDelete()"> <input
		type="button" value="추가" onclick="insert()">
	<table border="1"
		style="width: 500px; border-color: blue; text-align: center; align-content: center;">
		<tr style="background-color: yellow">
			<td><input type="checkbox" name="allcheck"
				onclick="allDelete(this)"></td>
			<th>아이디</th>
			<th>이름</th>
			<th>부서번호</th>
			<th>급여</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
			for (emplBean bean : list) {
		%>
		<tr>
			<td><input type="checkbox" name="rowcheck" value="<%=bean.getMid()%>"></td>
			<td><%=bean.getMid()%></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getDid()%></td>
			<td><%=bean.getSalary()%></td>
			<td><a href="updateForm.jsp?mid=<%=bean.getMid()%>">수정</a></td>
			<td><a href="deleteProc.jsp?mid=<%=bean.getMid()%>">삭제</a></td>
		</tr>
		<%
			}
		%>
	</table>
</form>
<!-- <a href="insertForm.jsp">삽입</a> -->
