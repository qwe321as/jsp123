<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
deleteProc.jsp<br><br>
<jsp:useBean id="dao" class="myPkg.MemberDao"/>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	System.out.println("deleteProc.jsp num:" + num); 
	int cnt = dao.deleteData(num);
	if(cnt==1){
		response.sendRedirect("select.jsp");
	}
	
%>
  