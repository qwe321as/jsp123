<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
cate_input_proc.jsp<br>
<%
request.setCharacterEncoding("UTF-8");
String code = request.getParameter("code");
String cname = request.getParameter("cname");
CategoryDao dao =CategoryDao.getInstance();
int cnt = dao.getinsterChar(code,cname);
String msg,url="";
if(cnt>0){
	msg="등록성공";
	url="cate_list.jsp";
}else{
	msg="등록실패";
	url="cate_input.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>
