$(document).ready(function(){

$("#CmWriteBtn").click(function(){
	var form_Data = new FormData();
	form_Data.append('user_id',$("#user_id").val());
	form_Data.append('cm_content',$("#cm_content").val());
	form_Data.append('board_b_num',$("#board_b_num").val());
	form_Data.append('b_num',$("#b_num").val());
	form_Data.append('currentPage',$("#currentPage").val());
	
	$.ajax({
		   type : "POST",
		   url : "boardCommentWrite.do",
		   data : form_Data,
		   processData: false,
		   contentType: false,
		   success : location.href ='boardView.do?b_num='+$("#b_num").val()+'&currentPage='+$("#currentPage").val()
    });//end ajax()
	
	$('#cm_content').val('');
}); // end wirteBtn ()


$(document).on("click","#BtnBox button",function(){ 
	if($(this).text()=='삭제'){
		var message = confirm("정말 삭제하시겠습니까?");
		if(message==true){
		var drno = $(this).prop("id");
		$.ajax({
			   type : "GET",
			   url : "commentDelete.do?cm_num="+drno,
			   success : location.href ='boardView.do?b_num='+$("#b_num").val()+'&currentPage='+$("#currentPage").val()
	    });//end ajax()
		}
	}
});//end delete()

$(document).on("click","#BtnBox button",function(){ 
	if($(this).text()=='수정'){
		var drno = $(this).prop("id");
		$("#cmCon").attr("contenteditable","true");
		$("#cmCon").focus();
		$("button").hide();
        $("#comment").append(
        		$('<div id="BtnBox" style="margin-left: 72%; margin-top: 2px;">'+
        		  '<p>'	+
        		  '<button id="'+drno+'" class="btn btn-primary" style="height: 35px; width: 80px; font-size:small; text-align: center;">수정하기</button>'+
        		  '<button  class="btn btn-primary" style="height: 35px; width: 53px; font-size:small; text-align: center; margin-left:10px;">취소</button></p></div>')
        );
    }

});//end modifyForm()

$(document).on("click","#BtnBox button",function(){
	if($(this).text()=='수정하기'){
		var form_Data = new FormData();
		var drno = $(this).prop("id");
		var cm_content = $("#cmCon").text();
		form_Data.append('cm_num',drno);
		form_Data.append('cm_content',cm_content);
		$.ajax({
			   type : "GET",
			   url : "commentModify.do?cm_num="+drno+"&cm_content="+cm_content,
			   success : location.href ='boardView.do?b_num='+$("#b_num").val()+'&currentPage='+$("#currentPage").val()
		});//end ajax()

	}
});//end modifyPro()



$(document).on("click","#BtnBox button",function(){
	if($(this).text()=='취소'){
		location.href ='boardView.do?b_num='+$("#b_num").val()+'&currentPage='+$("#currentPage").val();
	}
});//end cancel



});//end ready();

 
 
 
 