<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao"class="emart.EmartDao"/>
<jsp:useBean id="bean"class="emart.EmartBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
request.setCharacterEncoding("UTF-8");
int cnt = dao.insertData(bean);
if(cnt>0){
	response.sendRedirect("select.jsp");
}else{
	response.sendRedirect("insertForm.jsp");
}


%>