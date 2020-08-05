<%@page import="myPkg.simpleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String message = request.getParameter("message");
	out.println("넘어온데이터 : " + message + "<BR>");
%>
<%
	simpleBean sb = new simpleBean();
	sb.setMsg(message);
	out.println("message1: " + sb.getMsg() + "<BR>");
%>
<!-- simpleBean sb2 = new simpleBean(); -->
<jsp:useBean id="sb2" class="myPkg.simpleBean" />
<!-- 참조변수를 아이디에씀 클래스는 패키지.클래스 형식으로 써야함 객체 생성가능 -->
<%
	sb2.setMsg(message);
	out.println("sb2.getMsg() :" + sb2.getMsg() + "<BR>");
%>
<jsp:useBean id="sb3" class="myPkg.simpleBean" />
<jsp:setProperty property="msg" value="예지는착해" name="sb3"/>
<!-- ↑SET 대신해서  sb3.setMsg value는 바로 넣는 값 param은 가져오는 값
param과  property 가 같으면 파람은 생략할수있당
-->
sb3.getMsg(): <%=sb3.getMsg() %> <br>
sb3.getMsg(): <jsp:getProperty property="msg" name="sb3"/>

<jsp:useBean id="sb4" class="myPkg.simpleBean" /> <br>
<jsp:setProperty property="msg" param="message" name="sb4" />
sb4.getMsg(): <jsp:getProperty property="msg" name="sb4" /> <br>