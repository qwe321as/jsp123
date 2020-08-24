<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css">
<style type="text/css">
/* body {
	background-color: #FFEBF5;
} */
#divs {
	width: 100%;
	height: auto;
}


.pink {
	background: #FFEBF5;
	width: 100%;
	height: 28%;
	position: absolute;
}
#title{
position: absolute;
left: 50%;
top: 50%; 
width: 60%; 
height: 60%; 
-webkit-transform: translate(-50%,-50%); 
-ms-transform: translate(-50%,-50%); 
transform: translate(-50%,-50%);

}
#logout{
 width:40;
 height:40;
 position: absolute;
 right: 20px;
}
#mem{
position: absolute;
right: 60px;
top:17px;
}
</style>
<%
request.setCharacterEncoding("UTF-8");
String memid = (String)session.getAttribute("memid");
%>
<div class=pink>
<img src="<%=request.getContextPath() %>/img/log2.png" id="title" alt="메인">
<span id="mem"><font size="3"><%=memid %>님</font> </span>
<a href="<%=request.getContextPath()%>/logout.jsp">
<img alt="로그아웃" id="logout" src="<%=request.getContextPath() %>/img/logout.png">
</a></div>
<div class="main">
	<table width="100%" height="50" border="0">
		<tr height="20px">
			<th>
			<a href="<%=request.getContextPath() %>/main.jsp">
			<font size="5" class="line">Home </font> </a></th>
			<th><a href="<%=request.getContextPath() %>/book.jsp">
			<font size="5" class="line">Book</font></a></th>
			<th><a href="<%=request.getContextPath() %>/Report/board_main.jsp"><font size="5" class="line">Report</font></a></th>
			<th><a href="<%=request.getContextPath() %>/board/board_main.jsp"><font size="5" class="line">Debate</font></a></th>
			<th><a href="<%=request.getContextPath() %>/Quiz.jsp"><font size="5" class="line">Quiz</font></a></th>
		</tr>
	</table>

<div>
