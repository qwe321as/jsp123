<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="book.bookDao"/>
<%
int num = Integer.parseInt(request.getParameter("num"));
int cnt = dao.deleteData(num);
if(cnt>0){
	response.sendRedirect("select.jsp");
}
%>