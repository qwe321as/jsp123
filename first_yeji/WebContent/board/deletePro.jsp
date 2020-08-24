<%@page import="board.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
int num = Integer.parseInt(request.getParameter("num"));
String password = request.getParameter("password");
boardDao dao = boardDao.getInstance();
int cnt = dao.delete(num,password);
System.out.println(cnt);
if(cnt>0){
	response.sendRedirect("board_main.jsp");
}else{
	%>
	<script type="text/javascript">
	alert("일치하지 않는 비밀번호입니다.")
	history.go(-1);
</script>
	<%}

%>