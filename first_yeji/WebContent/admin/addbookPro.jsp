<%@page import="java.io.FileInputStream"%>
<%@page import="book.bookdao"%>
<%@page import="book.bookbean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8"); %>
<%
ServletContext sc = config.getServletContext();
int maxSize=1024*1024*5;
String encType = "UTF-8";
String uploadDir = sc.getRealPath("/admin/book");
MultipartRequest mr = new MultipartRequest(request,uploadDir,maxSize,encType,new DefaultFileRenamePolicy());
String title = mr.getFilesystemName("title");
System.out.println(title);
String bimage = request.getParameter("bimage");
System.out.println(bimage);
String bcontents = request.getParameter("bcontents");
System.out.println(bcontents);
bookdao dao = bookdao.getInstance();
int cnt = dao.insert(mr);
String msg,url="";
if(cnt>0){
	msg="책 등록 성공";
	url="book_main.jsp";
}else{
	msg="책 등록실패";
	url="addbook.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url %>";

</script>
