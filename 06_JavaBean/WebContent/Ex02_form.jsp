<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String[] subject = { "국어", "영어", "수학", "사회", "과학" };
%>
<form action="Ex02_result.jsp" method="post">
	이름 : <input type="text" name="name" value="수영"><br> 과목 점수<br>
	<%
		for (int i = 0; i < subject.length; i++) {
			out.println(subject[i] + ":");
	%>
	<input type="text" name="jumsu" value="1"> <br>
	<%
		}
	%>
	<!-- 국어 : <input type="text" name="jumsu" value="1"><br> -->
	<!-- 영어 : <input type="text" name="jumsu" value="2"><br>
		   수학: <input type="text" name="jumsu" value="3"><br> -->
	<hr>
	좋아하는 걸그룹: <br>
	<!-- multiple select에서도 다중선택가능 컨트롤누르고 해야함 -->
	<select name="group" multiple size="5">
		<option value="블랙핑크">블랙핑크</option>
		<option value="레드벨벳">레드벨벳</option>
		<option value="소녀시대">소녀시대</option>
		<option value="원더걸스">원더걸스</option>
		<option value="트와이스">트와이스</option>
		<option value="에이핑크">에이핑크</option>
	</select>
	<hr>
	<input type="radio" name="song" value="좋은날"> 좋은날 &nbsp;&nbsp; <input
		type="radio" name="song" value="너랑나"> 너랑나&nbsp;&nbsp; <input
		type="radio" name="song" value="별이진다네"> 별이진다네 &nbsp;&nbsp; <input
		type="radio" name="song" value="단발머리"> 단발머리&nbsp;&nbsp; <br>
	<br> <input type="submit" value="전송">
</form>