<%@page import="java.util.ArrayList"%>
<%@page import="login.loginbean"%>
<%@page import="login.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String email = request.getParameter("email");
logindao dao = logindao.getInstance();
String id=dao.findid(name,email);
String url,msg="";
if(id.length()==0){
	msg="가입된 회원 정보가 없습니다.";
	url="FineId.jsp";
}else{
	msg= "아이디는는 "+id+"입니다.";
	url="login2.jsp";
}
%>

<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>