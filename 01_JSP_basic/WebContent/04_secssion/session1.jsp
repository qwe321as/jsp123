<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
session 내장 객체<hr>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("password");

out.println("아이디는 : "+id+"<br>"+"비밀번호는 : "+pw +"<hr>");

session.setAttribute("id", id); //입력한 값이 김이라면 abc=김  같은 세션모두 어디서든 사용 가능하다.
session.setAttribute("passwd", pw); 
session.setMaxInactiveInterval(10);//10초만 세션을 유지하겠다. 
%>
<form action="session2.jsp" method="post">
<!-- 아이디 : --> <input type="text" name="id" value="<%=id %>" readonly> <BR>
<!-- 비밀번호 : --> <input type="text" name="password"value="<%=pw %>" readonly><BR> 
<!-- disabled 이건안넘어감 --> 
<!-- hidden 숨기는것 --> 
→가장 좋아하는 스포츠를 선택하세요<br>
<input type="radio" name="sports" value="태권도"> 태권도
<input type="radio" name="sports" value="검도"> 검도
<input type="radio" name="sports" value="유도"> 유도
<input type="radio" name="sports" value="탁구"> 탁구
<input type="radio" name="sports" value="농구"> 농구
<hr>
→가장 좋아하는 게임를 선택하세요<br>
<select name="game">
<option value="리그오브레전드">리그오브레전드</option>
<option value="오버워치">오버워치</option>
<option value="베틀그라운드">베틀그라운드</option>
</select>
<input type="submit" value="전송">
</form>