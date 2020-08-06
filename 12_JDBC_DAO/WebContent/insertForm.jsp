<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form name="myform" action="insertProc.jsp" method="post">
		<table border=1>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>입고일</td>
				<td><input type="date" name="buy"> </td>
			</tr>

			<tr>
				<td>배송비</td>
				
<td>				
<%
for(int i = 0; i<kind.length; i++){
%>
<%=kind[i] %> <INPUT TYPE="radio" NAME="kind" VALUE="<%=kind[i] %>"><%
}
%>
	</td>			
				
			</tr>
			<tr>
				<td>구입가능 서점</td>
			<td><%
			for(int i = 0; i<bookstore.length; i++){
				%>
				<input type="checkbox" name="bookstore" value="<%=bookstore[i] %>">	<%=bookstore[i] %>		
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
						<option value="<%=count[i]%>"><%=count[i] %></option>
						
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

