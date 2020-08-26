<%@page import="quizz.quizzdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTf-8"); 
int qnum = Integer.parseInt(request.getParameter("qnum"));
quizzdao dao = quizzdao.getInstance();
int cnt = dao.delete(qnum);
String msg = "";
if(cnt>0){
	msg="삭제 완료";
	
}else{
	msg="삭제 실패";
}
%>
<script type="text/javascript">
alert('<%=msg%>');
location.href="Quiz_main.jsp";
</script>
