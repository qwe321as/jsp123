<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int a=123;
switch(a%3){
case 0:
	out.print("3의 배수입니다.");
	break;
default:
	out.print("3의 배수가 아닙니다.");
}
%>