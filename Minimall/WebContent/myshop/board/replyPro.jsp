<%@page import="java.sql.Timestamp"%>
<%@page import="board.boardDao"%>
<%@page import="board.boardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
writePro.jsp<br><Br>
<%@include file="../display/mall_top.jsp" %>

<%
request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bean" class="board.boardBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
//System.currentTimeMillis() <-현재시간 얻어오는 
boardDao dao2 = boardDao.getInstance();
Timestamp today=new Timestamp(System.currentTimeMillis());
bean.setReg_date(today);
//getRemoteAddr()<-입력한 곳의 아이피 주소를 얻어오는
String ip=request.getRemoteAddr();
bean.setIp(ip);
int cnt = dao2.replyArticle(bean);
System.out.println(cnt);
if(cnt>0){
	response.sendRedirect("list.jsp");
}else{
	%>
	<script type="text/javascript">
	history.go(-1);
</script>
	<%
}

%>
