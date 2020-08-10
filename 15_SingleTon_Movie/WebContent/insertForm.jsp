<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

insertForm.jsp
<br>
<br>
<style type="text/css">
td:first-child {
	width:150px;
	
}
</style>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
  $(document).ready(function () {
	//alert(1234);
	var isCheck=false;//중복채크 눌렀는지 안눌렀는지
	var use;
	var isChange=false;//아이디 상태가 변했는지 안변했는지
	
	$('#id_check').click(function () {
		//alert(2);
		isChange=false;
	isCheck = true;
	if($('input[name=id]').val()==""){
		alert("아이디를 입력하세요");
		return;
	}
	$.ajax({
		//화면의 일부만 변화되게 함
		url : "id_check_proc.jsp",
		data:({
			//꼭 데이터로 써야한다 밑은 변수라서 아무거나괜찮다
			userid:$('input[name=id]').val()
		}),success : function (data) {
		if($.trim(data)=='YES'){//공백제거하고 yes랑 같은지 비교
			$('#idmessage').html('<font color=red> 사용가능합니다.</font>');
			$('#idmessage').show();
		use = "possible";
		}else{//공백제거하고 노랑 같은지 비교
			$('#idmessage').html('<font color=red> 이미 사용중인아이디입니다.</font>');
			$('#idmessage').show();
		use = "impossible";
			
		}	
		}
	});
	
	});
	$('input[name=id]').keydown(function () {
		isChange=true;
		$('#idmessage').css('display','none');
	});
	$('#sub').click(function () {
		//alert(21123);
		if(use=="impossible"){
			alert("이미 사용중인 아이디입니다.");
			return false;
		}else if(isCheck==false||isChange ==true){
			alert("중복채크하세요!");
			return false;
		}else if($('input[name=id]').val()==""){
			alert("아이디입력하세요");
			return false;
		}
	});
	
});
</script>
<%
  String [] genre={"공포","다큐","액션","애니메이션"};
  String [] time={"08~10","10~12","12~14","14~16","16~18","18~20"};
  String [] partner={"1","2","3","4"};
  
  %>
<h2>영화 선호도 조사</h2>
<form action="insertProc.jsp" method="post">
	<table border="1" width="700px">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value="IU">
			<input type="button" id="id_check" value="중복확인"> 
				<span id="idmessage" style="display: none" >가나다라</span></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="아이유"></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" value="23"></td>
		</tr>
		<tr>
			<td>좋아하는 장르</td>
			<td>
				<%
			for(int i =0; i<genre.length; i++){
				
				%><input type="checkbox" name="genre" value="<%=genre[i] %>">
				<%=genre[i] %> <%	
			}
			%> <!-- <input type="checkbox" name="genre" value="공포">공포
				<input type="checkbox" name="genre" value="다큐">다큐 
				<input type="checkbox" name="genre" value="액션">액션 
				<input type="checkbox" name="genre" value="애니메이션">애니메이션 -->
			</td>

		</tr>

		<tr>
			<td>즐겨보는 시간대</td>
			<td><select name="time">
					<%for(int i=0; i<time.length; i++){
						%>
					<option value="<%=time[i] %>"><%=time[i] %></option>
					<% } %>

					<!-- <option value="08~10">08~10</option>
					<option value="10~12">10~12</option>
					<option value="12~14">12~14</option>
					<option value="14~16">14~16</option>
					<option value="16~18">16~18</option>
					<option value="18~20">18~20</option> -->
			</select></td>
		</tr>

		<tr>
			<td>동반 관객수</td>
			<td>
				<%for(int i =0; i<partner.length ; i++){ %> <input type="radio"
				name="partner" value="<%=partner[i]%>"><%=partner[i]%> <%} %>

				<!-- <input type="radio" name="partner" value="1">1
				<input type="radio" name="partner" value="2">2 
				<input type="radio" name="partner" value="3">3 
				<input type="radio" name="partner" value="4">4  -->
			</td>
		</tr>

		<tr>
			<td>영화관 개선사항</td>
			<td><textarea name="memo" cols="40" rows="3">value는 여기에 넣기</textarea>
			</td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" value="가입하기" id="sub">
				<input type="button" value="뒤로"></td>
		</tr>
	</table>
</form>
