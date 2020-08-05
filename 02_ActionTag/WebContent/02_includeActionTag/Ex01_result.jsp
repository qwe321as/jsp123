<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result.jsp <br>
<%
request.setCharacterEncoding("UTF-8");	
String name = request.getParameter("name");
String pw = request.getParameter("pw");

out.println("이름: "+name+"<BR> 비밀번호:"+pw);

%>
<hr>
<%-- 액션태그는 코드 복사가 아니라 실행시킨후에 결과물을 가져옴 <jsp:include page="Ex01_body.jsp" /> --%> 
<jsp:include page="Ex01_body.jsp" >
	<jsp:param value="인천" name="addr"/> 
</jsp:include>
<!-- 정보 추가 개념임 -->
<%--지시어는 코드르 그대로 복사해서 넣는다고 생각하면됨 <%@include file="Ex01_body.jsp" %> --%>


