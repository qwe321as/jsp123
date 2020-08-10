<%@page import="Movie.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
 <% 
 MovieDao dao= MovieDao.getInstance();  
 System.out.print("deleteall: "+dao);
String [] row = request.getParameterValues("row");
  int cnt = dao.deleteall(row);
 if(cnt>0){
	 response.sendRedirect("select.jsp");
 }
 
 %>