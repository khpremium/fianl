/* var passchk = 0; */
$(document).ready(function() {
	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var phoneRule = /^[0-9]{10,11}$/;
	$('button').on('click', function() {
		if($('#non_name').val() == '') {
			alert('이름을 확인해주세요.');
			return false;
		} else if(!emailRule.test($('#non_email').val())) {
			alert('이메일을 확인해주세요.');
			return false;
		} else if(!phoneRule.test($('#non_phonenumber').val())) {
			alert('전화번호를 확인해주세요.');
			return false;
		} else if($('#non_pass').val() == '') {
			alert('비밀번호를 확인해주세요.');
			return false;
		} else {
			$('#select').submit();
		}
	});
	
	$('#non_phonenumber').on('keyup', function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	/* $('#non_pass').on('keyup', function() {
		if(!/^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test($(this).val())) {
			$('#passmsg').text('안됩니다.');
			passchk = 0;
		} else {
			$('#passmsg').text('');
			passchk = 1;
		}
	}); */
});