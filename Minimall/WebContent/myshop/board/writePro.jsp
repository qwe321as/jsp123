<%@page import="java.sql.Timestamp"%>
<%@page import="board.boardDao"%>
<%@page import="board.boardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
writePro.jsp<br><Br>
<%
request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bean" class="board.boardBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
//System.currentTimeMillis() <-현재시간 얻어오는 
boardDao dao = boardDao.getInstance();
Timestamp today=new Timestamp(System.currentTimeMillis());
bean.setReg_date(today);
//getRemoteAddr()<-입력한 곳의 아이피 주소를 얻어오는
String ip=request.getRemoteAddr();
bean.setIp(ip);
int cnt = dao.insertArticle(bean);
System.out.println(cnt);
if(cnt>0){
	response.sendRedirect("list.jsp");
}else{
	response.sendRedirect("writeform.jsp");
}

%>
