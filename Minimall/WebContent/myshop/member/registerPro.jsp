<%@page import="my.member.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
registerPro.jsp
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bean" class="my.member.memberDTO" />
<jsp:setProperty property="*" name="bean" />
<%
	memberDao mdao = memberDao.getInstance();
	String msg, url = "";
	int cnt = mdao.insetData(bean);
	if (cnt > 0) {
		msg = "가입 성공";
		url = request.getContextPath() + "/main.jsp";
		/* http://localhost:8080/Minimall/main.jsp */
	} else {
		msg = "가입 실패";
		url = "register.jsp";
	}
%>

<script type="text/javascript">
alert("<%=msg%>"+"했습니다.");
location.href="<%=url%>";
</script>
