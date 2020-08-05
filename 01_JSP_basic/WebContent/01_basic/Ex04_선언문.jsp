<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%! 
    public int add(int a, int b){
    return a+b;
    }
    public int sybtract(int x, int y){
    return x-y;
    }%>
    <%
int value1 =10;
int value2 =20;
int addResult =add(value1, value2);
int subResult =sybtract(value1, value2);%>
결과 : <%=value1 %>+<%=value2 %> = <%=addResult %>
<br>
결과2: <%=value1 %>+<%=value2 %> = <%=subResult %>