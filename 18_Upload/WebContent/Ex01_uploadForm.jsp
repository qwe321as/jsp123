<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="Ex01_uploadProc.jsp" enctype="multipart/form-data">
이름:<input type="text" name="name"><br><br>
<input type="file" name="filename"><br><br>
<input type="submit" value="업로드"><br><br>
</form>

<!-- cos.jar->업로드시 필요한 jar파일 

*파일 업로드의 규칙
1.cos.jar파일 lib에 넣는다
2.method = post로한다
3.enctype속성 설정
-->