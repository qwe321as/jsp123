
var isCheck = false;
var isChange=false;
var use="";

$(function() {
	$('input[name=id]').keydown(function(){
		$('#idmessage').css('display','none');
		isChange=true;
		use ="";
	});
});

function writeSave(){
 
	if($('input[name=id]').val()==""){
		alert("아이디입력하세요");
		$('input[name=id]').focus();
		return false;
	}
   if(use=="impossible"){
		alert("이미 사용중인 아이디입니다.");
		return false;
	}
   if(isCheck==false||isChange ==true){
		alert("중복체크하세요!");

		return false;
	}
   
   if($('input[name=password]').val()==""){
      alert("비밀번호를 입력하세요");
      $('input[name=password]').focus();
      return false;
   }
   
   if (pwsame=="비번불일치") {
	alert("비밀번호 비밀번호확인 불일치");
	return false;
}
   
   
   
}//writeSave
function duplicate() {
	isCheck=true;
	isChange=false;
	$.ajax({
		url:"id_check_proc.jsp",
		data:({userid:$('input[name=id]').val()}),
		
		success:function(data){
			
			if ($('input[name=id').val()=="") {
				$('#idmessage').html('<font color=red> 아이디 입력 누락 </font>');
				$('#idmessage').show();
				use = "impossible";
			}
			else if($.trim(data)=='YES') {
				$('#idmessage').html('<font color=blue>사용 가능</font>');
				$('#idmessage').show();
				use = "possible";
			}else{
				$('#idmessage').html('<font color=red>사용 불가능</font>');
				$('#idmessage').show();
				use = "impossible";
			}
		}
		
	});//ajax

}   

function passwd_keyup() {
	
	if($('input[name=password').val()!=$('input[name=repassword').val()){
		$('#pwmessage').html('<font color=red> 비밀번호와 비밀번호확인 불일치</font>');
		$('#pwmessage').show();
		pwsame = "비번불일치";
	}else{
		$('#pwmessage').html('<font color=blue> 비밀번호와 비밀번호확인 일치</font>');
		$('#pwmessage').show();
		pwsame = "비번일치";
			}
}