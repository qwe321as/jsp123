<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="book.bookDao"/>
<%
String [] row = request.getParameterValues("row");
int cnt = dao.deleteAll(row);
if(cnt>0){
	response.sendRedirect("select.jsp");
}   
%>