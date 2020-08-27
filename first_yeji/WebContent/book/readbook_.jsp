<%@page import="book.bookbean"%>
<%@page import="book.bookdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="text.read"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	read re = read.getInstance();
	bookdao dao = bookdao.getInstance();
	ArrayList<String[]> list = re.gettext(bnum);
	bookbean bean = dao.selectone(bnum);
%>
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
.img{
text-align: center;
margin-top: 5%;
}
body {
	background-color: #FFEBF5;
}
.home{
position: absolute;
top: 14%;
left: 42%;

}
.content {
	position: absolute;
	top: 16%;
	left: 23%;
	font-size: 14;
	z-index: 2;
	color: black;
}

.content2 {
	position: absolute;
	top: 20%;
	left: 55%;
	font-size: 14;
	color: black;
}

h1 {
	align-content: center;
}

</style>
<body>
</body>
<div class="img">	<img id="book" width="70%" height="80%" alt="책" src="img/book.png"></div>
<div class="content">
	<h1><%=bean.getTitle()%></h1>

	<%
		switch (list.size()) {
		case 3:
			for (int i = 0; i < 2; i++) {
				for (int j = 0; j < 13; j++) {
	%>
	<%=list.get(i)[j]%><br>
	<%
		}
			}
			break;
		case 21:
			for (int i = 0; i < 2; i++) {
				for (int j = 0; j < 13; j++) {
	%>
	<%=list.get(i)[j]%><br>
	<%
		}
			}
	%>
	<%
		break;
		case 15:
			for (int i = 0; i < 2; i++) {
				for (int j = 0; j < 13; j++) {
	%>
	<%=list.get(i)[j]%><br>
	<%
		}
			}
	%>
	<%
		break;
		case 41:
			for (int i = 0; i < 2; i++) {
				for (int j = 0; j < 13; j++) {
	%>
	<%=list.get(i)[j]%><br>
	<%
		}
			}
	%>
	<%
		break;
		case 17:
			for (int i = 0; i < 2; i++) {
				for (int j = 0; j < 13; j++) {
	%>
	<%=list.get(i)[j]%><br>
	<%
		}
			}
			break;
		}
	%>
</div>
<div class="content2">
	<%
		switch (list.size()) {
		case 21:
			for (int i = 2; i < 4; i++) {
				for (int j = 0; j < 13; j++) {
	%>
	<%=list.get(i)[j]%><br>
	<%
		}
			}
			break;
		case 15:
			for (int i = 2; i < 4; i++) {
				for (int j = 0; j < 13; j++) {
	%>
	<%=list.get(i)[j]%><br>
	<%
		}
			}
	%>
	<%
		break;
		case 41:
			for (int i = 2; i < 4; i++) {
				for (int j = 0; j < 13; j++) {
	%>
	<%=list.get(i)[j]%><br>
	<%
		}
			}
	%>
	<%
		break;
		case 17:
			for (int i = 2; i < 4; i++) {
				for (int j = 0; j < 13; j++) {
	%>
	<%=list.get(i)[j]%><br>
	<%
		}
			}
			break;

		}
	%>
</div>
<a href="book_main.jsp"	>
<img width="80px" src="img/home.png" value="home" class="home"/>
</a>
