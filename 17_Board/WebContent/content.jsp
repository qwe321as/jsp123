<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.boardBean"%>
<%@page import="board.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="color.jsp"%>
<style>
body {
	width: 100%;
	text-align: center;
}

table {
	margin: 0auto;
}
</style>
<script type="text/javascript">
	

</script>
<body bgcolor="<%=bodyback_c%>">
</body>
<jsp:useBean id="bean" class="board.boardBean" />
<%
	request.setCharacterEncoding("UTF-8");
	boardDao dao = boardDao.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	bean = dao.select(num);
	System.out.println("num:"+bean.getNum());
	System.out.println("red:"+bean.getRef());
	System.out.println("step:"+bean.getRe_step());
	System.out.println("level:"+bean.getRe_level());
	
%>
<b>글 내용 보기</b>
<form method="post" name="content" action=" " >
	<table  border="1" width="500" align="center" cellspacing="0">
		<tr>
			<td width="125" align="center" bgcolor="<%=value_c%>">글번호</td>
			<td><%=bean.getNum()%></td>
			<td  width="125" align="center"bgcolor="<%=value_c%>">조회수</td>
			<td><%=bean.getReadcount()%></td>
		</tr>
		<tr>
			<td width="125" align="center" bgcolor="<%=value_c%>">작성자</td>
			<td><%=bean.getWriter()%></td>
			<td width="125" align="center" bgcolor="<%=value_c%>">작성일</td>
			<td><%=sdf.format(bean.getReg_date()) %></td>
		</tr>
		<tr>
			<td width="125" align="center" bgcolor="<%=value_c%>">글제목</td>
			<td colspan="3"><%=bean.getSubject()%></td>

		</tr>
		<tr>
			<td width="125" align="center" bgcolor="<%=value_c%>">글내용</td>
			<td colspan="3"><%=bean.getContent()%></td>
		</tr>
		<tr>
			<td colspan="4"  width="125" align="right" bgcolor="<%=value_c%>">
			<input type="button" value="글수정" onclick="location='updateForm.jsp?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>'"> 
			<input type="button" value="글삭제" onclick="location='deleteForm.jsp?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>'"> 
			<input type="button" value="답글쓰기" onclick="location='replyForm.jsp?ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>'"> 
			<input type="button" value="글목록" onclick="location='list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
	</table>
</form>