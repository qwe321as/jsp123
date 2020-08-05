<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <!-- HttpServletRequest request = new HttpServletRequest() -->
   
요청정보 전송방식 : <%=request.getMethod() %> <br> 
요청 URI : <%=request.getRequestURI() %> <br>
컨텍스트 경로 : <%=request.getContextPath() %> <br> 
    <hr>
<form action="Ex01_result.jsp" method="get">
	이름 : <input type="text" name="name" id="n" value="예지"> <br>
	나이 : <input type="text" name="age" id="a" value="24"> <br>
	주소 : <input type="text" name="addr" id="ad" value="인천광역시"> <br>
	
	<input type="submit" value="확인">
		
</form>    
<!-- 
인풋태그안에 네임이 없으면 안됨!!!!!!! 
value를 담기위해서는 name이 꼭있어야함!!
아이디 속성에는 담지 못함!!!
class Person{
	private String name;
	private int age;
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getName(){
		return name;
	}
}

웹브라우저의 '요청정보'를 저장하는 객체

Person per = new Person();
per.setName("길동");

Date d = new Date();
d.toString();

 -->





