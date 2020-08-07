<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="dao" class="Movie.MovieDao"/>
 <%
String [] row = request.getParameterValues("row");
  int cnt = dao.deleteall(row);
 if(cnt>0){
	 response.sendRedirect("select.jsp");
 }
 
 %>