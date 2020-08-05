<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
session2.jsp <HR>

<% request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("password");

String sid =(String)session.getAttribute("id");
out.println("sid : " + sid + "<BR>");
String spw =(String)session.getAttribute("passwd");
out.println("spw1 : " + spw + "<BR>");

//session.invalidate(); //세션은 어디서든 사용가능하지만 이거 만나면 무효화 됨ㅋ 둘다 무효화됨 뒤로갔다가 다시 들어와서 새로고침하면

out.println("아이디 : "+id+"<br>"+"비밀번호 : "+pw +"<hr>");

String sports = request.getParameter("sports");
String game = request.getParameter("game");

out.println("스포츠 : "+sports+"<br>"+"게임 : "+game +"<hr>");
%>