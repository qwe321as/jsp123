<%@page import="login.loginbean"%>
<%@page import="login.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
logindao dao = logindao.getInstance();
String id = request.getParameter("id");
String password = request.getParameter("password"); 

loginbean baen = dao.getMemberInfo(id,password);
String msg,url="";
if(baen!=null){
	msg="가입한 회원입니다.";
	String _name = baen.getName();
	int _no = baen.getNo();
	if(_name.equals("어드민")){
		url=request.getContextPath()+"/admin/serch.jsp";
	}else{
		url=request.getContextPath()+"/main.jsp";
		
	}
	session.setAttribute("memid", _name);
	session.setAttribute("memno",_no);
}else{
	url="login2.jsp";
	msg="가입하지 않은 회원입니다.";
}
%>
<script type="text/javascript">
alert("<%=msg %>")
location.href="<%=url %>";
</script>