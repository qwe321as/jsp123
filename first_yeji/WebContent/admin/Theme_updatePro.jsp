<%@page import="thron.throndao"%>
<%@page import="catego.catebean"%>
<%@page import="catego.catedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTf-8"); %>
<%
int num = Integer.parseInt(request.getParameter("num"));
String genre = request.getParameter("genre");
String subject= request.getParameter("subject");
throndao dao = throndao.getInstance();
int cnt = dao.update(genre,subject,num);
String msg = "";
if(cnt>0){
	msg="수정 성공";
	
}else{
	msg="수정 실패";
}
%>
<script type="text/javascript">
alert('<%=msg%>');
location.href="Theme_main.jsp";
</script>
