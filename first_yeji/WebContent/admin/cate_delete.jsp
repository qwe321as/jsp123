<%@page import="catego.catedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTf-8"); 
int cnum = Integer.parseInt(request.getParameter("cnum"));
catedao dao = catedao.getInstance();
int cnt = dao.deleteCate(cnum);
String msg = "";
if(cnt>0){
	msg="삭제 완료";
	
}else{
	msg="삭제 실패";
}
%>
<script type="text/javascript">
alert('<%=msg%>');
location.href="cate_main.jsp";
</script>
