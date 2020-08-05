<%@page import="Book.book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <h2>도서 정보 입력 내용입니다.</h2>
<%
request.setCharacterEncoding("UTF-8");
String title = request.getParameter("title");
String author = request.getParameter("author");
String publisher = request.getParameter("publisher");
int price = Integer.parseInt(request.getParameter("price"));
String date = request.getParameter("date");
String [] bookstore = request.getParameterValues("bookstore");
String kind = request.getParameter("kind");
String count = request.getParameter("count");
String str=" ";
 for(int i=0; i<bookstore.length; i++ ){
	str +=bookstore[i]+" ";
} 
%>
<table border="1" style="width: 300px">
<tr><td>제목</td><td>
<%=title %>
</td>
</tr>
<tr>
<td>저자</td><td>
<%=author %>
</td>
</tr>
<tr>
<td>출판사</td><td>
<%=publisher %>
</td>
</tr>
<tr>
<td>가격</td><td>
<%=price %>원
</td>
</tr>
<tr><td>
입고일</td><td>
<%=date %>
</td>
</tr>
<tr>
<td>배송비</td><td>
<%=kind %>
</td>
</tr>
<tr>
<td>구입가능 서점</td><td>
<%=str %>
</td>
</tr>
<tr>
<td>보유수량</td><td>
<%=count %>
</td>
</tr>
</table>

<%
book bo = new book();
bo.setTitle(title);
bo.setAuthor(author);
bo.setPublisher(publisher);
bo.setPrice(price);
bo.setDate(date);
bo.setKind(kind);
bo.setBookstore(str);
bo.setCount(count);
%>
<hr>
<table border="1" style="width: 300px">
<tr><td>제목</td><td>
<%=bo.getTitle() %>
</td></tr>
<tr><td>작가</td><td>
<%=bo.getAuthor() %>
</td></tr>
<tr><td>출판사</td><td>
<%=bo.getPublisher() %>
</td></tr>
<tr><td>가격</td><td>
<%=bo.getPrice() %>
</td></tr>
<tr><td>입고일</td><td>
<%=bo.getDate() %>
</td></tr>
<tr><td>배송비</td><td>
<%=bo.getKind() %>
</td></tr>
<tr><td>구입가능서점</td><td>
<%=bo.getBookstore() %>
</td></tr>
<tr><td>보유수량</td><td>
<%=bo.getCount() %>
</td></tr>
</table>
<jsp:useBean id="bo1" class="Book.book" />
<jsp:setProperty property="*" name="bo1"/>
<%bo1.setBookstore(str);%>

<hr>
<table border="1" style="width: 300px">
<tr><td>제목</td><td>
<jsp:getProperty property="title" name="bo1"/>
</td></tr>
<tr><td>작가</td><td>
<jsp:getProperty property="author" name="bo1"/>
</td></tr>
<tr><td>출판사</td><td>
<jsp:getProperty property="publisher" name="bo1"/>
</td></tr>
<tr><td>가격</td><td>
<jsp:getProperty property="price" name="bo1"/>
</td></tr>
<tr><td>입고일</td><td>
<jsp:getProperty property="date" name="bo1"/>
</td></tr>
<tr><td>배송비</td><td>
<jsp:getProperty property="kind" name="bo1"/>
</td></tr>
<tr><td>구입가능서점</td><td>
<jsp:getProperty property="bookstore" name="bo1"/>
</td></tr>
<tr><td>보유수량</td><td>
<jsp:getProperty property="count" name="bo1"/>
</td></tr>
</table>