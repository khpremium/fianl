$(document).ready(function(){

$("#CmWriteBtn").click(function(){
	var form_Data = new FormData();
	var selected = $('#commentFrm input:radio[name=star-input]:checked').val();
	form_Data.append('rate',selected);
	form_Data.append('user_id',$("#user_id").val());
	form_Data.append('cm_content',$("#cm_content").val());
	form_Data.append('board_b_num',$("#board_b_num").val());
	form_Data.append('b_num',$("#b_num").val());
	form_Data.append('currentPage',$("#currentPage").val());
	
	$.ajax({
		   type : "POST",
		   url : "commentWrite.do",
		   data : form_Data,
		   processData: false,
		   contentType: false,
		   success : location.href ='suggestView.do?b_num='+$("#b_num").val()+'&currentPage='+$("#currentPage").val()
    });//end ajax()
	
	$('#cm_content').val('');
	$('#commentFrm input:radio[name=star-input]').prop("checked",false);
	$('#rateOut').text("0");
}); // end wirteBtn ()


$(document).on("click","#BtnBox button",function(){ 
	if($(this).text()=='삭제'){
		var message = confirm("정말 삭제하시겠습니까?");
		if(message==true){
		var drno = $(this).prop("id");
		$.ajax({
			   type : "GET",
			   url : "commentDelete.do?cm_num="+drno,
			   success : location.href ='suggestView.do?b_num='+$("#b_num").val()+'&currentPage='+$("#currentPage").val()
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
			   success : location.href ='suggestView.do?b_num='+$("#b_num").val()+'&currentPage='+$("#currentPage").val()
		});//end ajax()

	}
});//end modifyPro()



$(document).on("click","#BtnBox button",function(){
	if($(this).text()=='취소'){
		location.href ='suggestView.do?b_num='+$("#b_num").val()+'&currentPage='+$("#currentPage").val();
	}
});//end cancel



});//end ready();
/*
 function CmInserList(res){
	 $('#comment').empty();    
	 $.each(res, function(index, value){
		 var source =
			 '<div class="media mb-4" style="border:1px solid rgba(0,0,0,.125); width: 90% ;" id="commentArea">'+
			 '<div class="media-body"><h4 class="mt-0"style="margin-left: 3%;">{{user_id}}</h4><p style="margin-left: 3%;">님의 평점{{rate}} 점</p>'+
			 '<div id="cmCon" style="margin-left: 7%;font-size:medium; margin-top: 2%; margin-bottom: 2%" >{{cm_content}}</div></div></div>';
		 
		 var template = Handlebars.compile(source);
		 $('#comment').append(template(value));
	 });
 }//end CmInsertList()
*/ 
 
 
 
 