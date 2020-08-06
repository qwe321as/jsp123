<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="emart.EmartDao" />
<jsp:useBean id="bean" class="emart.EmartBean" />
<jsp:setProperty property="*" name="bean" />
<%
	if(bean.getApprove()==null){
		bean.setApprove("결재안함");
	}
	if(bean.getAgree()==null){
		bean.setAgree("비동의");
	}else{
		bean.setAgree("동의");
	}
	
	if (bean.getProduct() == null) {
		bean.setProduct("선택한 항목 없음");
	} else {
		String[] product = request.getParameterValues("product");
		String str = "";
		for (int i = 0; i < product.length; i++) {
			str += product[i] + " ";
		}
		bean.setProduct(str);
	}
	int cnt = dao.updateData(bean);
	if (cnt == 1) {
		response.sendRedirect("select.jsp");
	} else {
		response.sendRedirect("updateForm.jsp");
	}
%>