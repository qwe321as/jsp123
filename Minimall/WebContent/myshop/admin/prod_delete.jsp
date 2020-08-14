<%@page import="java.io.File"%>
<%@page import="my.shop.productDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
int pnum = Integer.parseInt(request.getParameter("pnum"));
String pimage= request.getParameter("pimage");
System.out.println(pimage);
ServletContext sc = config.getServletContext();
String delPath = sc.getRealPath("/myshop/images");//<-이땐 글자임
File dir = new File(delPath); //<-파일로 만드는 작업 이제 파일됨
File delFile = new File(dir,pimage); //<-dir 폴더 안에 pimage파일을 delfile이 가지고 있음

if(delFile.exists()){
	if(delFile.delete()){
		%>
		<script type="text/javascript">
		alert("이미지 파일 삭제 성공");

</script>
		<%
	}
}

productDao dao =productDao.getInstance();
int cnt = dao.deleteprodu(pnum);
String msg="";
if(cnt>0){
	msg="상품삭제성공";
}else{
	msg="상품삭제실패";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="prod_list.jsp";

</script>
<%-- String pname= request.getParameter("pname"); 타입이 파일인걸 넘어올떈 안됨 <jsp:usebean 안됨 
MultipartRequest(request<-from에서 넘어오는 모든정보 
				 uploadDir<-업로드할 위치
				 업로드할 파일의 최대용량
				 변수 타입
				 마지막은 중복되 파일을 이름변환해서 처리)
C:\JSP_yeji\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Minimall\ <- sc.getRealPath("")
C:\JSP_yeji\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Minimall\myshop\images --%>
