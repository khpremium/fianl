//아이디 찾기
var emailCheck = true;

function check_ok(){
	if(document.getElementById("name").value == ""){
		alert("이름을 입력해주세요.");
		reg_frm.name.focus();
		return false;
	}
	
	if (document.getElementById("email").value == "") {
		alert("이메일을 입력해주세요.");
		reg_frm.email.focus();
		return false;
	}
	
	else if(codecheck == false){
		alert("이메일 인증을 해주세요.");
		reg_frm.emailcheck.focus();
		return false;
	}
	
	return true;
}