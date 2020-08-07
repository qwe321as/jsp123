<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 insertProc.jsp
 <%
 request.setCharacterEncoding("UTF-8");
 %>
 <jsp:useBean id="dao" class="Movie.MovieDao"/>
 <jsp:useBean id="bean" class="Movie.MovieBean"/>
 <jsp:setProperty property="*" name="bean"/>
 
 <%
 if(bean.getMemo()==null){
	 bean.setMemo("없음");
	 
 }
 if(bean.getId()==null){
	 bean.setId("아이디없음");
	 
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