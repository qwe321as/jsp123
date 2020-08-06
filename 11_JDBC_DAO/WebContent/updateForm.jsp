<%@page import="emart.EmartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="emart.EmartDao" />
<%
int num = Integer.parseInt(request.getParameter("num"));
EmartBean bean = dao.getEmartbyMid(num);
System.out.println(bean.getId());
System.out.println(bean.getAgree());
String [] product ={"식품", "의류", "도서", "가구"};
String [] time ={"9시~11시", "11시~1시", "1시~5시", "5시~9시"};
String [] approve ={"카드", "핸드폰"};
%>
<h2>이마트 상품 구매 내역</h2>
<FORM name="myform" METHOD="post" ACTION="updateProc.jsp">
	<input type="hidden" name="num" value="<%=bean.getNum()%>"> 
	<span>아이디:</span> <INPUT TYPE="text" NAME="id" value="<%=bean.getId()%>"><br>
	<span>비번 :</span> <INPUT TYPE="password" NAME="pw" value="<%=bean.getPw()%>"><br>
	<p>
		 <span>구매상품:</span>
		<%
	for(int i = 0; i<product.length; i++ ){
	%><input type="checkbox" name="product" value="<%=product[i] %> "
			<%
			if(bean.getProduct().contains(product[i]))
			{%> checked <%}%>
			> 
			<%= product[i]%>
	      <%
      }
   %>
	<p>
		<span>배송시간 :</span> 
		<SELECT NAME="time">
			<OPTION VALUE="선택">선택</OPTION>
			<%
 		for(int i =0; i<time.length; i++){
 			%>
			<OPTION VALUE="<%=time[i] %>" 
			<%if(bean.getTime().equals(time[i]))
				{ %> selected <% }%>>
				<%=time[i] %>
			</OPTION>
			<%    
 		}
 		%>
		</SELECT>
	<p>

		<span>결재방법:</span>
		<%
for(int i = 0; i<approve.length; i++){
%>
		<%=approve[i] %>
		<INPUT TYPE="radio" NAME="approve" VALUE="<%=approve[i] %>"
		<%if(bean.getApprove().equals(approve[i])){
			%>checked<%
		} %>
		
		>
		<%
}
%>
	
	<p>
		<span>결재 동의합니다. </span> <INPUT TYPE="checkbox" NAME="agree" id="agree"
		<% if(bean.getAgree().equals("동의"))
		{%>checked<%}
 		%>
			>
		
	<p>

		<INPUT TYPE="submit" value="수정하기" onClick="return check()">
</FORM>
