<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  deleteProc.jsp
  <jsp:useBean id="dao" class="Movie.MovieDao"/>
  <%
  int num = Integer.parseInt(request.getParameter("num"));
  int cnt = dao.deleteData(num);
  if(cnt>0){
	  response.sendRedirect("select.jsp");
  }
  
  %>