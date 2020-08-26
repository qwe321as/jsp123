<%@page import="thron.throndao"%>
<%@page import="catego.catedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTf-8"); 
int num = Integer.parseInt(request.getParameter("num"));
throndao dao = throndao.getInstance();
int cnt = dao.delete(num);
String msg = "";
if(cnt>0){
	msg="삭제 완료";
	
}else{
	msg="삭제 실패";
}
%>
<script type="text/javascript">
alert('<%=msg%>');
location.href="Theme_main.jsp";
</script>
