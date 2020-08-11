<%@page import="board.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
deletePro.jsp
<%
boardDao dao = boardDao.getInstance();
String passwd = request.getParameter("passwd");
int num = Integer.parseInt(request.getParameter("num"));
int cnt = dao.deleteArticle(num,passwd);
if(cnt>0){
	response.sendRedirect("list.jsp");
}else{
	%>
<script type="text/javascript">
	alert("비밀번호가 잘못됨");
	history.go(-1);
</script>
<%
}	

%>