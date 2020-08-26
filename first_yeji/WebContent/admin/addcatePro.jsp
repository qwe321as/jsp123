<%@page import="catego.catedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String genre = request.getParameter("genre");
String code = request.getParameter("code");
catedao dao = catedao.getInstance();
String msg,url="";
int cnt =dao.insert(genre,code);
if(cnt>0){
	msg="추가성공";
	url="cate_main.jsp";
}else{
	msg="실패";
	url="addcate.jsp";
}

%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>