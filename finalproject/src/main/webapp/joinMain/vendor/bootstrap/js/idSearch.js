$(document).ready(function(){
	$("#findBtn").on("click", function() {
		$.ajax({
			type: 'GET',
			url: 'find_id.do?email=' + $("#email1").val(),
			dataType: 'text',
			success: emailCheck
		});
		$("#nana").show();
	});
});

function emailCheck(res){
	if(res != "") {
		$('#nana').text('아이디는' + res+ '입니다');
	}else {
		$('#nana').text('가입된 아이디가 없습니다');
	}
	
}
