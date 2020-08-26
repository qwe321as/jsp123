<%@page import="login.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean"  class="login.loginbean"/>
<jsp:setProperty property="*" name="bean"/>
<%
logindao dao = logindao.getInstance();
String msg,url="";
int cnt = dao.insertid(bean);
if(cnt>0){
	msg="가입 성공";
	url="login2.jsp";
}else{
	msg="가입 실패";
	url="singup2.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>