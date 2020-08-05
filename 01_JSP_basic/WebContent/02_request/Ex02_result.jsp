<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
Ex02_result.jsp
<%
String num1 = request.getParameter("num1");
String num2 = request.getParameter("num2");

int a = Integer.parseInt(num1);
int b = Integer.parseInt(num2);
int c =1;
for(int i = 0; i<b; i++){
	c=c*a;
}
out.println(c);
%>
<hr><% 
int mul = 1;
int count = 0;
while(count<b){
	mul = mul*a;
	count++;
} 
%>
 결과 : <%=mul %> 
 