<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
updateProc.jsp<br><br>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="empl.emplDao"/>
<jsp:useBean id="bean" class="empl.emplBean"/>
<jsp:setProperty name="bean" property="*"/>
<%
	int cnt = dao.updateData(bean);
	if(cnt == 1){
		response.sendRedirect("select.jsp");
	}else{
		response.sendRedirect("updateForm.jsp");
	}
%>