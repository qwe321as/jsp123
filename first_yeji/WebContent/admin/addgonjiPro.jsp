<%@page import="java.sql.Timestamp"%>
<%@page import="gonji.gonjidao"%>
<%@page import="gonji.gonjibean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="gonji.gonjibean"/>
<jsp:setProperty property="*" name="bean"/>
<%
gonjidao dao = gonjidao.getInstance();
Timestamp today=new Timestamp(System.currentTimeMillis());
bean.setReg_date(today);
String msg,url="";
int cnt =dao.insert(bean);
if(cnt>0){
	msg="추가성공";
	url="gonji_main.jsp";
}else{
	msg="실패";
	url="addgonji.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>