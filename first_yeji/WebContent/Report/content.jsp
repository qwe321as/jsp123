<%@page import="readbook.readDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main_top.jsp"%>
<jsp:useBean id="bean" class="readbook.readBean" />
<%
request.setCharacterEncoding("UTF-8");
readDao dao = readDao.getInstance();
int num = Integer.parseInt(request.getParameter("num"));
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
System.out.println(num);
bean = dao.select(num);

%>
<style type="text/css">
body{
width:100%;
text-align: center;
}
table{
margin:0auto;
}

</style>
<h3>글내용보기</h3>
<table border="1" width="500" align="center" cellspacing="0">
	<tr>
		<th>글번호</th>
		<td><%=num %></td>
		<th>조회수</th>
		<td><%=bean.getContent() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=bean.getWriter()%></td>
		<th>작성일</th>
		<td><%=sdf.format(bean.getReg_date()) %></td>
	</tr>
	<tr>
		<th>글제목</th>
		<td colspan="1"><%=bean.getTitle() %></td>
		<th>책</th>
		<td colspan="1"><%=bean.getBook() %></td>
	</tr>
	<tr>
		<th>글내용</th>
		<td  colspan="3"> <%=bean.getContent() %></td>
	</tr>
	<tr>
		<td colspan="4"  width="125" align="right" >
			<input type="button" value="글수정" onclick="location='updateForm.jsp?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>'"> 
			<input type="button" value="글삭제" onclick="location='deleteForm.jsp?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>'"> 
			<input type="button" value="글목록" onclick="location='board_main.jsp?pageNum=<%=pageNum%>'">
			</td>
	</tr>
</table>
<%@include file="../main_bottom.jsp"%>
