<%@page import="board.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%request.setCharacterEncoding("UTF-8"); %>
	<%@include file="../display/mall_top.jsp" %>
	
updatePro.jsp
<jsp:useBean id="bean" class="board.boardBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
boardDao dao2 = boardDao.getInstance();
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
int cnt = dao2.updatebean(bean);
if(cnt>0){
	response.sendRedirect("list.jsp?pageNum="+pageNum);
}else{
	%>
<script type="text/javascript">
	alert("비밀번호가 잘못됨");
	history.go(-1);
</script>
<%
}	

%>