<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="book.bookDao"/>
<jsp:useBean id="bean" class="book.bookBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
if(bean.getTitle() == null){
	bean.setTitle("제목없음");
}
if(bean.getAuthor() == null){
	bean.setAuthor("작가없음");
}
if(bean.getPublisher() == null){
	bean.setPublisher("출판사없음");
}

if(bean.getKind() == null){
	bean.setKind("배송비선택안함");
}

if (bean.getBookstore() == null) {
	bean.setBookstore("선택한 항목 없음");
} else {
	String[] bookstore = request.getParameterValues("bookstore");
	String str = "";
	for (int i = 0; i < bookstore.length; i++) {
		str += bookstore[i] + " ";
	}
	bean.setBookstore(str);
}
int cnt = dao.insertData(bean);
if (cnt == 1) {
	response.sendRedirect("select.jsp");
} else {
	response.sendRedirect("insertForm.jsp");
}



%>