/*function logincheck_on() {
	if (loginFrm.id.value == "" || loginFrm.pass.value == "") {
		alert("아이디나 비밀번호를 확인하세요");
		return false;
	}
	return true;
}
*/

$(document).ready(function() {
	$("#login").click(function(){
		var userId =$("#id").val();
		var userPw =$("#password").val();
		if(userId === "") {
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return;
		}
		if(userPw === "") {
			alert("비밀번호를를 입력하세요");
			$("#userPwd").focus();
			return;
		}
	});
	
	//저장된 쿠키값을 가져와서 id칸에 넣어준다 없으면 공백처리
	var key = getCookie("key");
	$("#id").val(key);
	
	if($("#id").val() != ""){
		$("#idSave").attr("checked", true);
	}
	
	$("#idSave").change(function() {
		if($("idSave").is(":checked")){
			setCookie("key", $("#id").val(), 1);
		}else{
			deleteCookie("key");
		}
	});
	
	$("#id").keyup(function() {
		if($("#idSave").is(":checked")){
			setCookie("key", $("#id").val(), 1);
		}
	});
});

function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}


