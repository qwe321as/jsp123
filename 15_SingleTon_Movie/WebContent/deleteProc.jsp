<%@page import="Movie.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  deleteProc.jsp
  <%
  MovieDao dao= MovieDao.getInstance();  

  System.out.print("deletproc: "+dao);
  int num = Integer.parseInt(request.getParameter("num"));
  int cnt = dao.deleteData(num);
  if(cnt>0){
	  response.sendRedirect("select.jsp");
  }
  
  %>