<%@page import="quizz.quizzdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String book = request.getParameter("book");
String question = request.getParameter("question");
String answer = request.getParameter("answer");
System.out.println(book);
String msg,url="";
quizzdao dao = quizzdao.getInstance();
int cnt =dao.insert(book,question,answer);
if(cnt>0){
	msg="추가성공";
	url="Quiz_main.jsp";
}else{
	msg="실패";
	url="addQuiz.jsp";
}

%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>