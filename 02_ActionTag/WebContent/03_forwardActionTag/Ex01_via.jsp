<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
Ex01_via.jsp<br><br>

<%

request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	
	out.print(name +","+pw +"<br>");
	
	System.out.println(name +","+pw);
	
%>
<!-- forward 액션태그 -->
<%-- <jsp:forward page="Ex01_result.jsp"/> --%>
<jsp:forward page="Ex01_result.jsp">
	<jsp:param value="제주" name="addr"/>
</jsp:forward>

<!-- 

forward
Response.sendRedirect

공통점 : 두가지다 중간에 거쳐가느 페이지 이다.

Response.sendRedirect 
출력페이지의 경로가 마지막 페이지이다.
옮기는걸 차례로 입력해서 옮겨야 함(ex response.sendRedirect("res2.jsp?abc="+msg);)이런식으로
foward
마지막 출력 페이지를 거쳐가는 페이지로 출력한다.
request객체를 공유 한다. sendRedirect처럼 입력하지 않아도 된다.
한글처리는 via에서 한번만 하면된당
 -->









