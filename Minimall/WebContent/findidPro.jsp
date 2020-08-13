<%@page import="my.member.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findpwPro.jsp

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdto" class="my.member.memberDTO"/>

<%
memberDao mdao = memberDao.getInstance();
String name = request.getParameter("name");
String rrn1 = request.getParameter("rrn1");
String rrn2 = request.getParameter("rrn2");
mdto = mdao.getMemberByrrn(name,rrn1,rrn2);

String msg="";
 if(mdto!=null){
	msg=mdto.getId();

} else{
	msg="없는 회원";
}

 %>
 <script type="text/javascript">
alert("<%=msg%>"+"입니다.");
location.href="main.jsp";
</script>
 