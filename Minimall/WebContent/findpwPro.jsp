<%@page import="my.member.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findidPro.jsp

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdto" class="my.member.memberDTO"/>

<%
memberDao mdao = memberDao.getInstance();
String name = request.getParameter("name");
String rrn1 = request.getParameter("rrn1");
String rrn2 = request.getParameter("rrn2");
String id = request.getParameter("id");
mdto = mdao.getMemberfindpw(name,rrn1,rrn2,id);

String msg="";
 if(mdto!=null){
	msg=mdto.getPassword();

} else{
	msg="없는 회원";
}

 %>
 <script type="text/javascript">
alert("<%=msg%>"+"입니다.");
location.href="main.jsp";
</script>
 