<%@page import="thron.throndao"%>
<%@page import="catego.catedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String genre = request.getParameter("genre");
String subject = request.getParameter("subject");
throndao dao =  throndao.getInstance();
String msg,url="";
int cnt =dao.insert(genre,subject);
if(cnt>0){
	msg="추가성공";
	url="Theme_main.jsp";
}else{
	msg="실패";
	url="theme.jsp";
}

%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>