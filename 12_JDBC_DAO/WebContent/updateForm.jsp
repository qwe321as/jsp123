<%@page import="book.bookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="dao" class="book.bookDao"/>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	bookBean bean = dao.getupdate(num);
	%>
<html>
<head>


<title>Insert title here</title>
</head>
<%
String [] bookstore ={"교보문고", "알라딘", "yes24", "인터파크"};
String [] count ={"1", "2", "3", "4","5"};
String [] kind ={"카드", "핸드폰"};
%>
<body>
	<h1>도서 정보 입력</h1>
	<form name="myform" action="updateProc.jsp" method="post">
		<table border=1>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="<%=bean.getTitle() %>"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author" value="<%=bean.getAuthor() %>"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher" value="<%=bean.getPublisher()%>"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="<%=bean.getPrice()%>"></td>
			</tr>
			<tr>
				<td>입고일</td>
				<td><input type="date" name="buy" value="<%=bean.getBuy() %>"> </td>
			</tr>

			<tr>
				<td>배송비</td>
				
<td>				
<%
for(int i = 0; i<kind.length; i++){
%>
<%=kind[i] %> <INPUT TYPE="radio" NAME="kind" VALUE="<%=kind[i] %>"
<%
 if(bean.getKind().equals(kind[i]))
 { %> checked <% }
%>


><%
}
%>
	</td>			
				
			</tr>
			<tr>
				<td>구입가능 서점</td>
			<td><%
			for(int i = 0; i<bookstore.length; i++){
				%>
				<input type="checkbox" name="bookstore" value="<%=bookstore[i] %>"
				
				<%
				
				if(bookstore[i].contains(bean.getBookstore())){
					%> checked <%
				}
				
				%>
				
				
				>	<%=bookstore[i] %>		
				<%}
			%></td>
			
				<!-- <td>교보문고 <input type="checkbox" name="bookstore" value="kyobo">
					알라딘 <input type="checkbox" name="bookstore" value="aladin">
					yes24 <input type="checkbox" name="bookstore" value="yes24">
					인터파크 <input type="checkbox" name="bookstore" value="interpark">
				</td> -->
				
			</tr>
			<tr>
				<td>보유수량</td>
				<td>
					<select name="count">
					<%
					for(int i=0; i<count.length; i++){
					%>	
						<option value="<%=count[i]%>"
						
						<%
						if(count[i].equals(bean.getCount())){
							%> selected <%
						}
						
						%>
						
						
						><%=count[i] %></option>
						
					<%}
					
					%>
						<!-- <option value="선택">선택</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option> -->
					</select>
				</td>
			</tr>

		</table>
		<br> 
		<input type="submit" value="전송" onclick="return inputCheck()"> 
		<input type="reset"	value="취소">
	</form>
</body>
</html>

