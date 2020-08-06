<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="emart.EmartDao" />
deleteAll.jsp
<br><BR>
<%
String [] row = request.getParameterValues("row");
for (int i = 0; i < row.length; i++) {
	System.out.println(row[i] + " ");

}

int cnt = dao.deletecheckData(row);
if (cnt > 0) {
	response.sendRedirect("select.jsp");
}

%>