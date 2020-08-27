<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
/* request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String filename= request.getParameter("filename");
System.out.println(name);
System.out.println(filename); ->enctype="multipart/form-data"이거떔에 안됨
------------------------------------------------------ */
String encType = "UTF-8";
String saveFolder = "img";
ServletContext sc = config.getServletContext();
String configFolder = sc.getRealPath("img");
System.out.println(configFolder);//웹서버 폴더의 경로를 알려쥼
String requestFolder=request.getContextPath()+"/"+saveFolder;

System.out.println(requestFolder);//딱 /18_Upload이렇게나옴
MultipartRequest multi = null;
int maxSize=1024*1024*5;
multi = new MultipartRequest (request,configFolder,maxSize,encType,new DefaultFileRenamePolicy()); //파일 업로드
Enumeration files = multi.getFileNames();
//Enumeration<String> files = multi.getFileNames(); 파일이름 찾기위해서 씀
String file = (String)files.nextElement(); 
String fn = multi.getFilesystemName(file);
System.out.println(file);
System.out.println(fn);
String org = multi.getOriginalFileName(file);
System.out.println("org="+org);
String fullpath = requestFolder + "/"+fn;
%>

<!-- 
C:\JSP_yeji\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\18_Upload
new DefaultFileRenamePolicy() 이거쓰면 이름이 같은 사진에 1,2,3 이 붙이면서 저장된다.

 -->
 이름: <%=multi.getParameter("name") %><br><BR>
 <img alt="이미지" src="<%=fullpath%>" width="300px" height="300px"/>