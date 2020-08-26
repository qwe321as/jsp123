<%@page import="thron.throndao"%>
<%@page import="java.beans.beancontext.BeanContext"%>
<%@page import="catego.catedao"%>
<%@page import="catego.catebean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/script2.js"></script>
<jsp:useBean id="bean" class="thron.thronbean"/>
<jsp:setProperty property="*" name="bean"/>
<%
throndao dao = throndao.getInstance();
int num = Integer.parseInt(request.getParameter("num"));
 bean = dao.selectone(num);
 System.out.println(bean.getNum());
%>
<h1>토론 주제 
수정하기</h1>
<form action="theme_updatePro.jsp" method="post" onsubmit="return cateSave()">
	<table border="1" align="center" cellspacing="0" >
		<tr>
			<th>번호</th>
			<td><input readonly="readonly" type="text" name="cnum" value="<%=num %>" >
			<input type="hidden" name="cnum"    value="<%=num %>"></td>
		</tr>
		<tr>
			<th>책이름</th>
			<td><input type="text" name="genre"  value="<%=bean.getGenre()%>" ></td>
		</tr>
		<tr>
		<th>주제</th>
		<td><input type="text" name="code"  value="<%=bean.getSubject()%>" ></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="수정하기">
				<input type="button" value="목록이동하기"
				onclick="location.href='<%=request.getContextPath()%>/admin/Theme_main.jsp'">
			</td>
		</tr>
	</table>
</form>
<%@ include file="admin_bottom.jsp"%>