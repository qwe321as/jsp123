<%@page import="Movie.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8");%>
 <jsp:useBean id="bean" class="Movie.MovieBean"/>
 <jsp:setProperty property="*" name="bean"/>
 <%
 MovieDao dao= MovieDao.getInstance();  

 System.out.print("updateproc: "+dao);

 if(bean.getMemo()==null){
	 bean.setMemo("없음");
	 
 }
 if (bean.getGenre() == null) {
		bean.setGenre("선택한 항목 없음");
	}else{
		 String [] genre = request.getParameterValues("genre");
		 String str = "";
		 for(int i=0; i<genre.length; i++){
			 str+=genre[i] +" ";
		 }
		 bean.setGenre(str);
	 }
 if(bean.getId()==null){
	 bean.setId("아이디없음");
	 
 }
 if(bean.getName()==null){
	 bean.setName("이름없음");
 }
 int cnt = dao.update(bean);   
 if(cnt>0){
	 response.sendRedirect("select.jsp");
 }
 
 %>