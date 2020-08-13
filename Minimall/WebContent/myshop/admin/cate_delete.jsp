<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTf-8"); 
int cnum = Integer.parseInt(request.getParameter("cnum"));
CategoryDao dao = CategoryDao.getInstance();
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
location.href="cate_list.jsp";
</script>
