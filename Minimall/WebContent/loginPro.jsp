<%@page import="my.member.memberDao"%>
<%@page import="my.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
memberDao mdao = memberDao.getInstance();
String id = request.getParameter("id");
String password = request.getParameter("password"); 
memberDTO mdto = mdao.getMemberInfo(id,password);
String msg,url="";
if(mdto!=null){
	msg="가입한 회원입니다.";
	String _id = mdto.getId();
	if(_id.equals("admin")){
		url="myshop/admin/main.jsp";
	}else{
		url=request.getContextPath()+"/myshop/display/mall.jsp";
		
	}
}else{
	url="main.jsp";
	msg="가입하지 않은 회원입니다.";
}
%>
<script type="text/javascript">
alert("<%=msg %>")
location.href="<%=url %>";
</script>