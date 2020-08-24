<%@page import="java.util.ArrayList"%>
<%@page import="login.loginbean"%>
<%@page import="login.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String email = request.getParameter("email");
logindao dao = logindao.getInstance();
String pw =dao.findpw(id,email);
String url,msg="";
if(pw.length()==0){
	msg="가입된 회원 정보가 없습니다.";
	url="FinePw.jsp";
}else{
	msg= "비밀번호는 "+pw+"입니다.";
	url="login2.jsp";
}
%>

<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>