<%@page import="book.bookdao"%>
<%@page import="java.io.File"%>
<%@page import="catego.catedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTf-8"); %>
<%
int bnum = Integer.parseInt(request.getParameter("bnum"));
String bimage = request.getParameter("bimage");
String bcontents= request.getParameter("bcontents");
bookdao dao = bookdao.getInstance();
ServletContext sc = config.getServletContext();
String delPath = sc.getRealPath("/admin/book");
File dir = new File(delPath);
File delFile = new File(dir,bimage);
File delFile2 = new File(dir,bcontents);
if(delFile.exists()){
	if(delFile.delete()||delFile2.delete()){
		%>
		<script type="text/javascript">
		alert("이미지 파일,text파일 삭제 성공");

</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("이미지 파일,text파일 삭제 실패");

</script>
		<%
		
	}
}
int cnt = dao.deleteBook(bnum);
String msg = "";
if(cnt>0){
	msg="삭제 완료";
	
}else{
	msg="삭제 실패";
}
%>
<script type="text/javascript">
alert('<%=msg%>');
location.href="book_main.jsp";
</script>

