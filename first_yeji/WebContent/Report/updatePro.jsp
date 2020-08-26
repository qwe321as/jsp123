<%@page import="readbook.readDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="readbook.readBean"/>
<jsp:setProperty property="*" name="bean" />
<%
readDao dao = readDao.getInstance();
int cnt = dao.update(bean);
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