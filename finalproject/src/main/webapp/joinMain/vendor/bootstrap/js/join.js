
//아이디 중복체크
function idFunction(){
	var id = $('#id').val();
	
	if(id.length < 6){
		$('#errCustID2').html('비밀번호는 6자리 이상');
	}else {
		$('#errCustID2').html('');
	}
	
	$.ajax({
		type:'POST',
		url:'/myfinal/idCheck.do',
		data: {id : id},
		success: function(data){
			 if(data ==0){
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

//비밀번호
$('input[type=password]').focusout(function(){
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
	
	var regex = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	if(!regex.test($("#password").val())){
		alert("영어/숫자/특수문자 조합으로 입력해주세요.");
		return false;
	};
});

//이름
function nameFunction() {
	var name = $('#name').val();
	
	if(name == "") {
		$('#errCustNm').html('이름을 입력해주세요.')
	}else {
		$('#errCustNm').html('');
	}
}

//이메일 
$('#email').change(function(){
	$("#email option:selected").each(function() {
		if ($(this).val() == '1') {//직접입력일 경우
			$("#email02").val(""); //값 초기화 
			$("#email02").attr("readonly",false); //활성화
		} else { //직접입력이 아닐경우
			$("#email02").val($(this).text()); //선택값 입력
			$("#email02").attr("readonly", true); //비활성화
		}
	});	
});

var checkEmail = false;

//이메일 중복확인
function emailFunction(){

	var email1 = $("#email01").val();
	var email2 = $("#email02").val();
	var aa = email1 + '@' + email2;
	alert(aa);
	
	$.ajax({
		type: 'POST',
		url: '/myfinal/emailCheck.do',
		data: {'email' : aa},
		success: function(data) {
				if($.trim(data)==0) {
					alert("사용가능");
					checkEmail = true;
				}else{
					alert("사용 불가능");
				}
			},
		error:function(){
			alert("에러입니다");
		}
	});
}
 
var checkCode;

$('#checkbutton').on('click', function() {
/*	var nodes = document.getElementsByName('email');
	var receiver = '';
	
	receiver = nodes[0].value + '@' + nodes[1].value;
*/
	
	if (checkEmail == false) {
		alert("중복확인 먼저하세요.");
		return;
	}
		
	
	var email1 = $("#email01").val();
	var email2 = $("#email02").val();
	
	var aa = email1 + '@' + email2;
	
	alert("이메일을 전송했습니다.");
	
	$.ajax({
		url : '/myfinal/emailSend.do',
		type : 'POST',
		data : {
			receiver : aa
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

var codecheck = false;

//메일 인증
function check_button(){

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

//전화번호 정규표현식
$(function(){
    $("#phoneNum01").on('keydown', function(e){
       // 숫자만 입력받기
        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
					
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
		{
	  	    e.preventDefault();
		}
	    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
	        if($(this).val() == '') return;
	
	        // 기존 번호에서 - 를 삭제합니다.
	        var trans_num = $(this).val().replace(/-/gi,'');
	      
	        // 입력값이 있을때만 실행합니다.
	        if(trans_num != null && trans_num != '')
	        {
	            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
	            if(trans_num.length==11 || trans_num.length==10) 
	            {   
	                // 유효성 체크
	                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	                
	            }
	            else 
	            {
	                alert("유효하지 않은 전화번호 입니다.");
	                $(this).val("");
	                $(this).focus();
	            }
	      }
	});  
});

//취소 버튼
$(document).ready(function() {
	$('#joinCancle').on('click', function(){
		location.href="/myfinal/main.do";
	});
});

$("#joinBtn").on('click', function(){
	
	if(codecheck == false){
		alert("이메일 인증코드를 확인해주세요");
		return false;
	}
	var input = document.querySelectorAll('.inputText');
	var bool = false;
	
	for (el of input) {
		if (el.value) {
			bool = true;
		} else {
			bool = false;
			break;
		}
	}
	
	if (bool) {
		$('#joinForm').submit();
	}else {
		alert('모든 값을 입력해 주세요.');
	}
	
});