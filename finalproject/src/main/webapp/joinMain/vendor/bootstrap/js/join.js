//이메일 
$('#email').change(function(){
	$("#email option:selected").each(function() {
		if ($(this).val() == '1') {//직접입력일 경우
			$("#email02").val(""); //값 초기화 
			$("#email02").attr("disabled",false); //활성화
		} else { //직접입력이 아닐경우
			$("#email02").val($(this).text()); //선택값 입력
			$("#email02").attr("disabled", true); //비활성화
		}
	});	
});

//비밀번호 일치 확인
function passwordCheckFunction(){
	var passwd = $('#password').val();
	var passwdcheck = $('#passwordCheck').val();
	
	if (passwd != passwdcheck) {
		$('#errRePasswd').html('비밀번호가 서로 일치하지 않습니다.');
	} else {
		if(passwd == "" && passwdcheck == ""){
			$('#errRePasswd').html('');
		} else {
			$('#errRePasswd').html('비밀번호가 일치합니다.');
		}
	}
	
	if(passwd.length < 6){
		$('#errPasswd').html('비밀번호는 6자리 이상');
	}else {
		$('#errPasswd').html('');
	}
}

function nameFunction() {
	var name = $('#name').val();
	
	if(name == "") {
		$('#errCustNm').html('이름을 입력해주세요.')
	}else {
		$('#errCustNm').html('');
	}
}


//아이디 중복체크
function idFunction(){
	var id = $('#id').val();
	$.ajax({
		type:'POST',
		url:'/myfinal/idCheck.do',
		data: {id : id},
		success: function(data){
			 if($.trim(data)==0){
	                $('#errCustID').html("사용가능");                
	            }else{
	                $('#errCustID').html("사용불가");
	            }
	        },
	        error:function(){
	                alert("에러입니다");
	        }
	    });
}
/*
$('#joinBtn').on('click', function(){	
	//값이 비어있으면 넘기지 말기
	var tags = document.getElementsByTagName('input');
	var bool = false;
	
	for (el of tags) {
		if (el.value) {
			bool = true;
		} else {
			bool = false;
			break;
		}
	}
	return bool;
});
*/
var checkCode;

$('#checkbutton').on('click', function() {
	var nodes = document.getElementsByName('email');
	var receiver = '';
	
	receiver = nodes[0].value + '@' + nodes[1].value;

	alert("이메일을 전송했습니다.");
	
	$.ajax({
		url : '/myfinal/emailSend.do',
		type : 'POST',
		data : {
			receiver: receiver
		},
		success : function(code) {
			alert(code);
			checkCode = code;
		},
		error : function(err) {
			alert("이메일 전송 오류 : 관리자에게 문의하세요.");
		}
	});
});



function check_button(){
	var codecheck = false;
	
	var emailcode = checkCode;
	var emailcheck = $('#inputCode').val();
	
	if(emailcode == emailcheck){
		alert("메일이 인증되었습니다.");
		codecheck = true;
	}
	else if(emailcode != emailcheck){
		alert("인증코드를 다시 입력해주세요.");
		codecheck = false;
	}
}

$(document).ready(function() {
	$('#joinCancle').on('click', function(){
		location.href="index.do";
	});
});


