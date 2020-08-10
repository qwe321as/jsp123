<%@page import="Movie.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 insertProc.jsp
 <%
 request.setCharacterEncoding("UTF-8");
 %>
 <jsp:useBean id="bean" class="Movie.MovieBean"/>
 <jsp:setProperty property="*" name="bean"/>
 
 <% 
 MovieDao dao= MovieDao.getInstance();  
     
 
 System.out.print("insertproc: "+dao);

 if(bean.getMemo()==null){
	 bean.setMemo("없음");
 }

 if(bean.getName()==null){
	 bean.setName("이름없음");
 }
 if(bean.getGenre() == null){
	 bean.setGenre("선택한 항목 없음");
 }else{
	 String [] genre = request.getParameterValues("genre");
	 String str = "";
	 for(int i=0; i<genre.length; i++){
		 str+=genre[i] +" ";
	 }
	 bean.setGenre(str);
 }
 int cnt = dao.insertData(bean);  
 if(cnt==1){
	 response.sendRedirect("select.jsp");
 }else{
	 response.sendRedirect("insertForm.jsp");
 }
 %>