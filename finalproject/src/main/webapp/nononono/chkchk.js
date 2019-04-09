$(document).ready(function(){
	$(document).on('click','#clientBtn',clientProcess);
	$(document).on('click','#airinfoBtn',airinfoProcess);
	$(document).on('click','#airinfoUpdateBtn',airinfoUpdateSelectProcess);
	$(document).on('click','#reservationUpdateBtn',reservationUpdateSelectProcess);
	
	
	
});



function clientProcess(){
	var id = $(this).prev().val();
	$.ajax({
		type:'GET',
		dataType:'text',
		url:'clientChkProcess.do?id='+id,
		success: function(res) {
			if(res!=0){
				alert('선택 회원의 예약내역을 먼저 삭제해주세요');
				console.log(res);
				return false;
			}else{
				location.href ='clientDelete.do?id='+id;
			}
		}
	});
	return false;
}//end clientProcess



function airinfoProcess(){
	var flight = $(this).prev().val();
	$.ajax({
		type:'GET',
		dataType:'text',
		url:'airinfoChkProcess.do?flight='+flight,
		success: function(res){
			if(res!=0){
				alert('선택 비행기의 예약내역을 먼저 삭제해주세요');
				return false;
			}else{
				location.href='airinfoDelete.do?flight='+flight;
			}
		}
	});
	return false;
}//end airinfoProcess

function airinfoUpdateSelectProcess(){
	var flight = $(this).next().val();
	alert(flight);
	

	$.ajax({
		type:'GET',
		dataType:'text',
		url:'airinfoUpdate.do?flight='+flight,
		success: function(res){
			location.href='airinfoUpdate.do?flight='+flight;
		}
	});	
}


function reservationUpdateSelectProcess(){
	var rv_num = $(this).next().val();
	alert(rv_num);
	

	$.ajax({
		type:'GET',
		dataType:'text',
		url:'reservationUpdate.do?rv_num='+rv_num,
		success: function(res){
			location.href='reservationUpdate.do?rv_num='+rv_num;
		}
	});	
}

