<%@page import="catego.catebean"%>
<%@page import="catego.catedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTf-8"); %>
<%
int cnum = Integer.parseInt(request.getParameter("cnum"));
String genre = request.getParameter("genre");
String code = request.getParameter("code");
catedao dao = catedao.getInstance();
int cnt = dao.update(genre,code,cnum);
String msg = "";
if(cnt>0){
	msg="수정 성공";
	
}else{
	msg="수정 실패";
}
%>
<script type="text/javascript">
alert('<%=msg%>');
location.href="cate_main.jsp";
</script>
