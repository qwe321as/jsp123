	function writeSave()
	{
		if ($('input[name=writer]').val() == "") {
			alert("이름을 입력하세요");
			$('input[name=writer]').focus();
			return false;
		}
		if ($('input[name=subject]').val() == "") {
			alert("제목을 입력하세요");
			$('input[name=subject]').focus();
			return false;
		}
		if ($('input[name=email]').val() == "") {
			alert("Email을 입력하세요");
			$('input[name=email]').focus();
			return false;
		}
		if ($('#adc').val() == "") {
			alert("내용을 입력하세요");
			$('#adc').focus();
			return false;
		}
		if ($('input[name=passwd]').val() == "") {
			alert("비밀번호을 입력하세요");
			$('input[name=passwd]').focus();
			return false;
		}
	}