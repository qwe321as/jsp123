
function Check() {
	if($('input[name=id]').val()==""){
		alert("id를 입력하세요");
		$('input[name=id]').focus();
		return false;
	}
	if($('input[name=email]').val()==""){
		alert("email를 입력하세요");
		$('input[name=email]').focus();
		return false;
	}
}
function Check2() {
	if($('input[name=name]').val()==""){
		alert("name을 입력하세요");
		$('input[name=name]').focus();
		return false;
	}
	if($('input[name=email]').val()==""){
		alert("email를 입력하세요");
		$('input[name=email]').focus();
		return false;
	}
}
function writeSave()
{
	if ($('input[name=title]').val() == "") {
		alert("제목을 입력하세요");
		$('input[name=title]').focus();
		return false;
	}
	if ($('#adc').val() == "") {
		alert("내용을 입력하세요");
		$('#adc').focus();
		return false;
	}
	if ($('input[name=password]').val() == "") {
		alert("비밀번호을 입력하세요");
		$('input[name=password]').focus();
		return false;
	}
}
function deleteSave() {
	if($('input[name=password]').val()==""){
		alert('비밀번호를 입력하세요');
		$('input[name=password]').focus();
		return false;
	}

}
function updateSave() {
	if($('input[name=title]').val()==""){
		alert('제목을 입력하세요');
		$('input[name=title]').focus();
		return false;
	}
	if($('input[name=content]').val()==""){
		alert('내용를 입력하세요');
		$('input[name=content]').focus();
		return false;
	}
	if($('input[name=password]').val()==""){
		alert('비밀번호를 입력하세요');
		$('input[name=password]').focus();
		return false;
	}
}
function cateSave() {
	if($('input[name=genre]').val()==""){
		alert('장르이름을 입력하세요');
		$('input[name=genre]').focus();
		return false;
	}
	if($('input[name=code]').val()==""){
		alert('장크코드를 입력하세요');
		$('input[name=code]').focus();
		return false;
	}
}

function thrsave() {
	if($('input[name=genre]').val()==""){
		alert('책이름을 입력하세요');
		$('input[name=genre]').focus();
		return false;
	}
	if($('input[name=subject]').val()==""){
		alert('주제를 입력하세요');
		$('input[name=subject]').focus();
		return false;
	}


}

function BookSave(){
	if($('input[name=title]').val()==""){
		alert('책이름을 입력하세요');
		$('input[name=title]').focus();
		return false;
	}
	if($('input[name=author]').val()==""){
		alert('작가를 입력하세요');
		$('input[name=author]').focus();
		return false;
	}
	if($(':radio[name="publisher"]:checked').length < 1){
		alert('출판사를 입력하세요');
		return false;
	}
	if($('input[name=pcontents]').val()==""){
		alert('내용을 입력하세요.');
		$('input[name=pcontents]').focus();
		return false;
	}
	if($('input[name=bpasswd]').val()==""){
		alert('비밀번호를 입력하세요');
		$('input[name=bpasswd]').focus();
		return false;
	}
	
	
}



