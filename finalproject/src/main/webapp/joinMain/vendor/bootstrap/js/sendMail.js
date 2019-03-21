var code;
var codecheck = false;

function emailSend() {
	alert(emailcheck);
	if(emailcheck == true) {
		alert(document.getElementById("email").value());
		if(document.getElementById("email").value() != ""){
			alert("이메일을 전송하였습니다.");
		}
		else{
			alert("이메일을 입력해주세요.");
		}
	}else{
		alert("이메일이 올바르지 않습니다.");
	}
// Ajax 통신으로 서버에 Data를 전송하고 Return 받습니다.
    $.ajax({
        // type을 설정합니다.
        type : 'POST',
        url : "SendEmail",
        // 사용자가 입력하여 id로 넘어온 값을 서버로 보냅니다.
        data : {"receiver" : reg_frm.email.value
        	},
        dataType : "text",
        // 성공적으로 값을 서버로 보냈을 경우 처리하는 코드입니다.
        success : function(email_code) {
            // 서버에서 Return된 값으로 중복 여부를 사용자에게 알려줍니다.
            if(email_code != null){
           		code = email_code;
            } else{
            	alert("실패");
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

function emailcode_button(){
	var emailcode = code;
	var remailcheck = reg_frm.emailcheck.value;
	if(emailcode == emailcheck){
		alert("메일이 인증되었습니다.");
		codecheck = true;
	}
	else{
		alert("인증코드를 다시 입력해주세요.");
		codecheck = false;
	}
}

//아이디 중복체크
var emailCheck= false;

function email_Check(){
	var email = $('#email').val();
	
	if(email.indexOf("@") == -1){
		if(email == ""){
			$('#emailCheckMessage').html("");
			emailCheck = false;
		}
		else{
			$('#emailCheckMessage').html('이메일 주소가 아닙니다.');
			emailCheck = false;
		}
	}
	else{
		$.ajax({
			type:'POST',
			url:'emailCheck',
			data: {email : email},
			success: function(result){
				if(result != 0){
					$('#emailCheckMessage').html('사용할 수 없는 이메일입니다.');
					emailCheck = false;
				}
				else{
					if(email == ""){
						$('#emailCheckMessage').html("");
						emailCheck = false;
					}
					else{
						$('#emailCheckMessage').html('사용할 수 있는 이메일입니다.');
						emailCheck = true;
					}
				}
			}
		});
	}
}