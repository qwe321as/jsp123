<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%int num =13; %>
<%if(num>10){ %>
10보다 크다.
<% }
    else if(num<10){%>
10보다 작다.
<% }
    else{%>
10과 같다.
<% } %>
<hr>
<%
int num1 = 8; 
 if(num1>10){ 
	out.print("10보다 크다.");
 }
 else if(num1<10){
	out.print("10보다 작다.");
 }
 else{
	out.print("10와 같다.");
 } 
%>
<!-- 표현식은 값이 바뀔때 변수 출력할떄 쓴다. 그냥 글출력은 그냥쓴다 -->