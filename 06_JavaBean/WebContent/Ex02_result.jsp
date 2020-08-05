<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DTO.InputBean"%>
    
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="bean" class="DTO.InputBean" />

<%-- <jsp:setProperty property="name" name="bean"/>
<jsp:setProperty property="jumsu" name="bean"/>
<jsp:setProperty property="group" name="bean"/>
<jsp:setProperty property="song" name="bean"/> --%>
<jsp:setProperty property="*" name="bean"/>
이름: <jsp:getProperty property="name" name="bean"/> 
<jsp:getProperty property="jumsu" name="bean"/> <BR><BR>
<%-- <jsp:getProperty property="group" name="bean"/> --%>
<%
String[] subject = { "국어", "영어", "수학", "사회", "과학" };
int [] jumsu = bean.getJumsu();
for(int i=0; i<bean.getJumsu().length; i++){
	out.println(subject[i] + ":");	
	out.print(jumsu[i] + " ");
}
%>
<br>
<% 
String [] group = bean.getGroup();
for(int i =0; i<group.length; i++){
	out.print(group[i]+" ");
}
%>

<br>

노래: <jsp:getProperty property="song" name="bean"/> 
