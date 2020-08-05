<%@page import="Member.member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	String[] hobby = request.getParameterValues("hobby");
	String str = " ";
	for(int i = 0 ; i<hobby.length; i++){
		str += hobby[i]+" ";
	}
	out.println("<br>requset <BR> 이름 :" + name + " 나이 :" + age + " 전화번호 :" + tel + " 주소:" + addr );
	out.println("취미: "+str+"<hr>");
	member mb = new member();
	mb.setName(name);
	mb.setAge(age);
	mb.setTel(tel);
	mb.setAddr(addr);
	mb.setHobby(str);
	out.println("mb 객체생성 <br>" + " 이름 :" + mb.getName() + " 나이 :" + mb.getAge() + "살 주소 :" + mb.getAddr() + " 전화번호 :"
			+ mb.getTel() + " 취미 :" + mb.getHobby() + "<hR>");
%>
<jsp:useBean id="mb1" class="Member.member" />
<%-- <jsp:setProperty property="name" name="mb1" />
<jsp:setProperty property="age" name="mb1" />
<jsp:setProperty property="addr" name="mb1" />
<jsp:setProperty property="tel" name="mb1" /> 모두우우우우 우우우우우우ㅜ우출력하겠따!--%>
<jsp:setProperty property="*" name="mb1" />
<%	mb1.setHobby(str); 
//이거 입력안하면 값이 하나만 들어간다.%>
<table border="1" style="width: 200px; text-align: center">
<tr>
<th colspan="2" bgcolor="pink">mb1</th>
</tr>
<tr>
<td>이름</td> <td>
<jsp:getProperty property="name" name="mb1" /></td> </tr>
<tr><td>나이</td> <td>
<jsp:getProperty property="age" name="mb1" />
</td></tr>
<tr><td>주소</td> <td>
<jsp:getProperty property="addr" name="mb1" />
</td></tr>
<tr><td>전화번호</td> <td>
<jsp:getProperty property="tel" name="mb1" />
</td></tr>
<tr><td>취미</td> <td>
<jsp:getProperty property="hobby" name="mb1" />
</td></tr>
</table>