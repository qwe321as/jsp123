<%@page import="java.sql.Timestamp"%>
<%@page import="board.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
writePro.jsp<br><Br>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
boardDao dao = boardDao.getInstance();
Timestamp today=new Timestamp(System.currentTimeMillis());
bean.setReg_date(today);
int cnt = dao.insertArticle(bean);
if(cnt>0){
	response.sendRedirect("board_main.jsp");
}else{
	response.sendRedirect("writeform.jsp");
}

%>