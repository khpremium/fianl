$(document).ready(function(){
	$(document).on('click','#clientBtn',clientProcess);
	$(document).on('click','#airinfoBtn',airinfoProcess);
	$(document).on('click','#clientUpdateBtn',clientUpdateSelectProcess);
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




function clientUpdateSelectProcess(){
	var id = $(this).next().val();
	alert(id);
	// 이동하는 컨트롤러 호출
	// 이동만 -> 데이터?????
	// 데이터를 가져올 수 있게 해줘야 함
	// 필요한 데이터 ? => 유저 정보 다
	// 유저정보 - 테이블 - 테이블 select 가져오기 가능
	// select 하는 기준 -> 기본키 -> id
	// id 가져와서 컨트롤러에 넘겨주면
	// 컨트롤러에서 아이디로 유저정보를 가져오면 됨
	// 여기서 해야될거 -> 이부분이 어디인가 -> 이동하는 컨트롤러 호출 -> id 가져와서 컨트롤러에 넘겨주면
	// id는 가져옴 -> 뒷부분에서 컨트롤러를 호출하면서 id를 넘겨주면 됨
	// 
	
	$.ajax({
		type:'GET',
		dataType:'text',
		url:'clientUpdate.do?id='+id,
		success: function(res){
			location.href='clientUpdate.do?id='+id;
		}
	});	
}


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

