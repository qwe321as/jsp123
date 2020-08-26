<%@page import="thron.throndao"%>
<%@page import="catego.catebean"%>
<%@page import="catego.catedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTf-8"); %>
<%
String genre = request.getParameter("genre");
String subject= request.getParameter("subject");
throndao dao = throndao.getInstance();
int cnt = dao.insert(genre, subject);
String msg = "";
if(cnt>0){
	msg="삽입 성공";
	
}else{
	msg="삽입 실패";
}
%>
<script type="text/javascript">
alert('<%=msg%>');
location.href="Theme_main.jsp";
</script>
