<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="empl.emplDao" />

deleteAll.jsp
<BR>
<BR>
<%
	String[] rowcheck = request.getParameterValues("rowcheck");

	for (int i = 0; i < rowcheck.length; i++) {
		System.out.println(rowcheck[i] + " ");

	}

	int cnt = dao.deletecheckData(rowcheck);
	if (cnt > 0) {
		response.sendRedirect("select.jsp");
	}
%>