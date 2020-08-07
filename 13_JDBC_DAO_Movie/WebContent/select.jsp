<%@page import="java.util.ArrayList"%>
<%@page import="Movie.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="dao" class="Movie.MovieDao" />
<%
ArrayList<MovieBean> list = dao.getAll(); %>
 <script type="text/javascript">
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
 function alldelete() {
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
function insert() {
	location.href = "insertForm.jsp";
}
</script>
<input type="button" value="추가" onclick="insert()"> 
<input type="button" value="삭제" onclick="alldelete()">
<form action="deleteAll.jsp" name="myform">
<table border="1">
<tr style="background-color: pink">
<td> <input type="checkbox" name="alcheck" onclick="allch(this)"></td>
<th>번호</th>
<th>아이디</th>
<th>이름</th>
<th>나이</th>
<th>좋아하는 장르</th>
<th>즐겨보는 시간대</th>
<th>동시 관객수</th>
<th>영화개선사항</th>
<th>수정</th>
<th>삭제</th>
</tr>
<tr>
<%for(MovieBean bean : list){ %>
<td><input type="checkbox" name="row" value="<%=bean.getNum()%>"></td>
<td><%=bean.getNum() %></td>
<td><%=bean.getId() %></td>
<td><%=bean.getName() %></td>
<td><%=bean.getAge() %></td>
<td><%=bean.getGenre()%></td>
<td><%=bean.getTime() %></td>
<td><%=bean.getPartner() %></td>
<td><%=bean.getMemo() %></td>
<td><a href="updateForm.jsp?num=<%=bean.getNum() %>">수정</a></td>
<td><a href="deleteProc.jsp?num=<%=bean.getNum() %>">삭제</a></td>

</tr>
<%} %>
</table>
</form>