<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="dao" class="book.bookDao"></jsp:useBean>
	<jsp:useBean id="bean" class="book.bookBean"/>
	<jsp:setProperty property="*" name="bean" />
	
<%request.setCharacterEncoding("UFT-8"); 
int cnt = dao.update(bean);
%>  