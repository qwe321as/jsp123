<%@page import="java.beans.beancontext.BeanContext"%>
<%@page import="catego.catedao"%>
<%@page import="catego.catebean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/script2.js"></script>
<jsp:useBean id="bean" class="catego.catebean"/>
<jsp:setProperty property="*" name="bean"/>
<%
catedao dao = catedao.getInstance();
int cnum = Integer.parseInt(request.getParameter("cnum"));
 bean = dao.selectone(cnum);
 System.out.println(bean.getCnum());
%>
<h1>장르 수정하기</h1>
<form action="cate_updatePro.jsp" method="post" onsubmit="return cateSave()">
	<table border="1" align="center" cellspacing="0">
		<tr>
			<th>번호</th>
			<td><input readonly="readonly" type="text" name="cnum" value="<%=cnum %>" >
			<input type="hidden" name="cnum"    value="<%=cnum %>"></td>
		</tr>
		<tr>
			<th>장르이름</th>
			<td><input type="text" name="genre"  value="<%=bean.getGenre()%>"></td>
		</tr>
		<th>장르코드</th>
		<td><input type="text" name="code"  value="<%=bean.getCode()%>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="수정하기">
				<input type="button" value="목록이동하기"
				onclick="location.href='<%=request.getContextPath()%>/admin/cate_main.jsp'">
			</td>
		</tr>
	</table>
</form>
<%@ include file="admin_bottom.jsp"%>