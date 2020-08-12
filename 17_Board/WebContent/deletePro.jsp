<%@page import="board.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
deletePro.jsp
<%
boardDao dao = boardDao.getInstance();
String passwd = request.getParameter("passwd");
int num = Integer.parseInt(request.getParameter("num"));
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
int cnt = dao.deleteArticle(num,passwd);
int count = dao.getArticleCount();//전체 레코드 갯수 리턴

if(cnt>0){
	int pageSize=10;
	int pageCount = count / pageSize +(count % pageSize == 0 ? 0:1);
	if(pageNum>pageCount){
		
	response.sendRedirect("list.jsp?pageNum="+(pageNum-1));}
	else{
	response.sendRedirect("list.jsp?pageNum="+pageNum);
		
	}
}else{
	%>
<script type="text/javascript">
	alert("비밀번호가 잘못됨");
	history.go(-1);
</script>
<%
}	

%>