<%@page import="DTO.CheckboxBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- CheckboxBean bean = new CheckboxBean(); -->
<jsp:useBean id="bean" class="DTO.CheckboxBean" />
<jsp:setProperty property="name" name="bean" />
<jsp:setProperty property="fruit" name="bean" />
이름 :
<jsp:getProperty property="name" name="bean" /><br>
과일 :
<jsp:getProperty property="fruit" name="bean" /><br>
과일2 :
<%
	String fruit[] = bean.getFruit();
	if (fruit == null) {
		out.println("선택한과일이없습니다.");
	}

	else {
		for (int i = 0; i < bean.getFruit().length; i++) {
			out.print(fruit[i] + " ");
		}
	}
%>