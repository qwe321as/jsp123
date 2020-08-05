<%@page import="empl.emplBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="empl.emplDao"/>
<%
request.setCharacterEncoding("UTF-8");
int mid = Integer.parseInt(request.getParameter("mid"));
System.out.println("mid:" + mid);
emplBean bean = dao.getEmlebyMid(mid);
    %>
	<h2>회원 수정폼</h2>
	<form action="updateProc.jsp" method="post">
	<input type="hidden" name="mid" value="<%=bean.getMid() %>">
		이름  : <input type="text" name="name" value="<%=bean.getName() %>"><br><br>
		부서번호 :
		<select name="did" >
<!-- 			<option value="1" selected="selected">1</option>
			<option value="2">2</option>
			<option value="3">3</option> -->	
<%
				for(int i=1;i<=3;i++){
					
			%>
					<option value="<%=i%>" 
					<% if(bean.getDid()== i) 
					{%> selected <% } %> > <%=i%> </option>
			<%					
				}
			%>
		</select><br><br>
		급여     : <input type="text" name="salary" value="<%=bean.getSalary() %>"><br><br>
		<input type="submit" value="수정하기">
	</form>

