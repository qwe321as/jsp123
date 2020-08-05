<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="Ex03_result2.jsp" method="post" >
이름 : <input type="text" name="name" value="예지"> <br>
나이 : <input type="text" name="age" value="24"> <br>
성별 : <input type="radio" name="gender" value="m"> 남자
     <input type="radio" name="gender" value="f" checked> 여자  <br>
취미 : 
<select name="hobby"> 
<option value="연극보기">연극보기</option>
<option value="영화보기">영화보기</option>
<option value="전시화관람">전시회관람</option>
<option value="뮤지컬보기">뮤지컬보기</option>

<option value="책읽기">책읽기</option>
</select><br>
색선택 : 
<select name="color"> 
<option value="blue">파란색</option>
<option value="green">초록색</option>
<option value="red">빨간색</option>
<option value="yellow">노란색</option>
</select>
<br>
 <input type="submit" value="보내기"> <br>
 </form>