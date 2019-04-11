<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}]
    ul{list-style-type: none !important;}
    .btn-primary{
    background-color: #F64747 !important;
    border-color: #F64747 !important;}
    a:hover{text-decoration: none !important;}

#header {
		background-color: transparent;
		color: #fdd1d1;
		cursor: default;
		height: 3.25em;
		left: 0;
		line-height: 3.25em;
		position: fixed;
		text-align: right;
		top: 1em;
		width: 100%;
		z-index: 10001;
		padding: 0 1.5em;
	}

		#header.alt {
			top: 0;
			background: #F64747;
		}

		#header .logo {
			display: inline-block;
			height: inherit;
			left: 1.5em;
			line-height: inherit;
			margin: 0;
			padding: 0;
			position: absolute;
			top: 0;
		}

		#header .logo a {
			font-size: 1.25em;
			color: #555;
			font-weight: 600;
			text-decoration: none;
		}

			#header .logo a:hover {
				color: #555;
			}

		#header .logo span {
			font-weight: 300;
			font-size: .8em;
			color: #555;
		}

	#header > a {
		-moz-transition: color 0.2s ease-in-out;
		-webkit-transition: color 0.2s ease-in-out;
		-ms-transition: color 0.2s ease-in-out;
		transition: color 0.2s ease-in-out;
		display: inline-block;
		color: inherit;
		text-decoration: none;
	}

	#header > a[href="#menu"] {
		text-decoration: none;
		-webkit-tap-highlight-color: transparent;
		background: rgba(255, 255, 255, 0.15);
		border-radius: 100%;
		height: 2.5em;
		width: 2.5em;
		line-height: 2.5em;
		color: #555;
		text-align: center;
	}

		#header > a[href="#menu"]:before {
			content: "";
			-moz-osx-font-smoothing: grayscale;
			-webkit-font-smoothing: antialiased;
			font-family: FontAwesome;
			font-style: normal;
			font-weight: normal;
			text-transform: none !important;
		}

		#header > a[href="#menu"]:hover {
			color: rgba(255, 255, 255, 0.25);
			background: none;
			box-shadow: 0 0 0 1px rgba(255, 255, 255, 0.25);
		}

		#header > a[href="#menu"]:before {
			margin: 0;
		}

		#header > a[href="#menu"] span {
			display: none;
		}

	@media screen and (max-width: 736px) {

		#header > a {
			padding: 0 0.5em;
		}

	} /* end header */
/* Menu */

	#menu {
		-moz-transform: translateX(20em);
		-webkit-transform: translateX(20em);
		-ms-transform: translateX(20em);
		transform: translateX(20em);
		-moz-transition: -moz-transform 0.5s ease, box-shadow 0.5s ease, visibility 0.5s;
		-webkit-transition: -webkit-transform 0.5s ease, box-shadow 0.5s ease, visibility 0.5s;
		-ms-transition: -ms-transform 0.5s ease, box-shadow 0.5s ease, visibility 0.5s;
		transition: transform 0.5s ease, box-shadow 0.5s ease, visibility 0.5s;
		-webkit-overflow-scrolling: touch;
		background: rgba(0,0,0,0.5);
		box-shadow: none;
		color: #ffffff;
		height: 100%;
		max-width: 80%;
		overflow-y: auto;
		padding: 3em 2em;
		position: fixed;
		right: 0;
		top: 0;
		visibility: hidden;
		width: 20em;
		z-index: 10002;
	}

		#menu > ul {
			margin: 0 0 1em 0;
		}

		#menu > ul.links {
			list-style: none;
			padding: 0;
		}

		#menu > ul.links > li {
			padding: 0;
		}

		#menu > ul.links > li > a:not(.button) {
			border: 0;
			border-top: solid 1px rgba(255, 255, 255, 0.25);
			color: inherit;
			display: block;
			line-height: 3.5em;
			text-decoration: none;
		}
	
		#menu > ul.links > li > .button {
			display: block;
			margin: 0.5em 0 0 0;
		}
	
		#menu > ul.links > li:first-child > a:not(.button) {
			border-top: 0 !important;
		}

		#menu .close {
			text-decoration: none;
			-moz-transition: color 0.2s ease-in-out;
			-webkit-transition: color 0.2s ease-in-out;
			-ms-transition: color 0.2s ease-in-out;
			transition: color 0.2s ease-in-out;
			-webkit-tap-highlight-color: transparent;
			border: 0;
			color: #fbb5b5;
			cursor: pointer;
			display: block;
			height: 3.25em;
			line-height: 3.25em;
			padding-right: 1.25em;
			position: absolute;
			right: 0;
			text-align: right;
			top: 0;
			vertical-align: middle;
			width: 7em;
		}

		#menu .close:before {
			content: "";
			-moz-osx-font-smoothing: grayscale;
			-webkit-font-smoothing: antialiased;
			font-family: FontAwesome;
			font-style: normal;
			font-weight: normal;
			text-transform: none !important;
		}

		#menu .close:before {
			font-size: 1.25em;
		}

		#menu .close:hover {
			color: #ffffff;
		}

		@media screen and (max-width: 736px) {

			#menu .close {
				height: 4em;
				line-height: 4em;
			}

		}

		#menu.visible {
			-moz-transform: translateX(0);
			-webkit-transform: translateX(0);
			-ms-transform: translateX(0);
			transform: translateX(0);
			box-shadow: 0 0 1.5em 0 rgba(0, 0, 0, 0.2);
			visibility: visible;
		}

		@media screen and (max-width: 736px) {

			#menu {
				padding: 2.5em 1.75em;
			}

		}	/* end menu */	    
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    var filename = [];
    
    
    $(document).ready(function(){
		$("#b_content").val(
				$("#b_content").val().replace(/<br\s?\/?>/g, "\n"));
         $("#btnUpdate").click(function(){
          updateProcess();
        });//end btnSave()
        
        $("#btnCancel").click(function(){
        	location.href ='suggestView.do?b_num='+$("#b_num").val()+'&currentPage='+$("#currentPage").val()
        });
         
        
         
     	// 내 PC 첨부파일 시작
     	var userfile = '';
     	$('#userpc').on('click', function() {
     		userfile = $('<input type="file" id="userfile" />');
     		userfile.click(); 
     		userfile.change(function() {
     			//console.log($(userfile[0]).val());
     			var partname = $(userfile[0]).val().substring($(userfile[0]).val().lastIndexOf("\\") + 1);
     			//console.log("partname",partname);
     			var str = '<p><input type="checkbox" />' + partname + '</p>';
     			$('.fileDrop').append(str);
     			var dataList = userfile[0].files[0];
     			//console.log(dataList);
     			filename.push(dataList);
     		});
     	});
     	// 내 PC 첨부파일 끝
     	
     	// 첨부 파일 드래그 시작
     	var obj = $('.fileDrop');
     	
     	// dragover : Drag중 Mouse가 현재 위치한 Element
     	obj.on('dragover', function(e) {
     		e.preventDefault();
     		$(this).css('border', '1px solid #0B85A1');
     	});
     	
     	obj.on('drop', function(e) {
     		e.preventDefault();
     		// $(obj).empty();
     		var files = e.originalEvent.dataTransfer.files;
     		for(var i = 0; i < files.length; i++) {
     			obj.append('<p><input type="checkbox" />' + files[i].name + '</p>');
     			filename.push(files[i]);
     		}
     		console.log(filename);
     		
     	});
     	// 첨부 파일 드래그 끝
     	

     	// 첨부 파일 삭제 시작
     	$(document).on('click', '.fileDrop input', function() {
     		$(this).parent().remove();
     		filename = [];
     	});
     	// 첨부 파일 삭제 끝
     	
     	//기존 파일에 change 이벤트 있을 시,
     	var check ='';
     	$(document).on('click', 'input[name=fchange]', function(){
     		 check=$("input[name=fchange]:checked").parent().text();
     		 alert(check);
     	});
     	
     	$("#fileChange").click(function(){
     		$.ajax({
     			type:"GET",
     			url:"fileChange.do?f_name="+check+"&b_num="+${dto.b_num},
     		    success:function(res){
     		    	$("#files p").remove();
     		    	$.each(res, function(index, value){
     		   		  var data = $("<p><input type='checkbox' name='fchange'/>"+value.f_name+"</p>");
     		   	      $('#files').append(data);
     		    	});
     		    	
     		   		alert("삭제 성공");		
     		   }
     
     		});
     	});//end filesChange()
     	
     	
    });//end ready()

    function updateProcess(){
    	var form_Data = new FormData();
    	form_Data.append('b_num', $("#b_num").val()); 
     	form_Data.append('b_content', $("#b_content").val().replace(/\n/gi, '<br/>'));
     	form_Data.append('user_id', $("#user_id").val());
     	form_Data.append('title', $("#title").val())
 

        if(filename) {
 		for(var index in filename) {
 			alert(filename[index]);
 			form_Data.append('filename', filename[index]);
 		}
 	  }   
       
    	$.ajax({
    		type: 'POST',
    		dataType: 'json',
    		url: 'Update.do',
    		data: form_Data,
    		//아래 세개는 첨부파일
    		contentType: false,
    		enctype: 'multipart/form-data',
    		processData: false,
    		success:location.href ="suggestView.do?b_num="+${dto.b_num}+"&currentPage="+${currentPage}
    		
    	}); 
    }//end savePro()

</script>

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Blog Home - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="SHINnara/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="SHINnara/css/blog-home.css" rel="stylesheet">

</head>

<body>
<jsp:include page="../joinMain/newIndex.jsp"></jsp:include>
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">
        <h1 class="my-4">관리자 글 수정
          <small></small>
        </h1>


        <!-- Blog Post -->   
     <div class="card mb-4">
     <!-- 여기에 글쓰기 공간!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
     <form name="frm" id="frm" method="post" enctype="multipart/form-data" style="margin-top: 3%; margin-bottom: 3%" >             
		<table>
			<tr>
				<td width="20%" align="center">제목</td>
				<td>						 
				<input type="text" id="title" name="title" size="40" value="${dto.title }">
				</td>
			</tr>

			<tr>
				<td width="20%" align="center">내용</td>
				<td><textarea id="b_content" name="b_content" rows="15" cols="70" style="overflow-y:auto;" >${dto.b_content }</textarea></td>
			</tr>
		</table>
		
		<!-- !!!!!!!!!!!!!!!!첨부파일  -->
		<div id="attatch" style="margin-left: 5%" >
		   <label for="userpc"> 파일추가 </label>
		   <span id="userpc" style="cursor:pointer;margin-left:3.5%; " >내 PC</span>
		</div>
	    <div class="fileDrop" style="border-color: blue; width: 70%; height: 110px; margin-left: 18%; overflow-y: auto;">
	    </div>
	    
	    <!-- 기존 첨부파일 -->
	    &emsp;&emsp; 기존 파일 

	    <div id="files" style="border:1px; border-color: blue; width: 70%; height: 110px; margin-left: 18%; overflow-y: auto;">
	    <input type="button" id="fileChange" value="삭제" style="float: right;">
	    <c:forEach items="${fdto }" var="fdto">
	         <p><input type="checkbox" name="fchange"/>${fdto.f_name}</p>
	         <input type="hidden" name="f_name" value="${fdto.f_name}">
	         <input type="hidden" name="f_num" value="${fdto.f_num}">
	     </c:forEach>
	    </div>


        <input type="hidden" name="b_num" id="b_num" value="${dto.b_num }">
        <input type="hidden" name="currentPage" id="currentPage" value="${currentPage }">
		<input type="hidden" name="user_id" id="user_id" value="${dto.user_id }">
	  <div id="btnSpace" style="margin-top: 3%; margin-left: 40% ">
		<input type="button" id="btnUpdate" value="수정하기" /> 
		<input type="button" id="btnCancel" value="취소" />
	  </div>	
	</form>
 </div>
      <div  style="margin-bottom: 7%; margin-top:7%; margin-left: 50%;">
      <a href="List.do?currentPage=${currentPage}"style="color: #F64747 !important">목록으로 돌아가기</a>
      </div>
	
        <!-- Pagination -->
      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4" style="margin-top: 8% !important">


      </div>

    <!-- /.row -->

  </div>
  </div>
  <!-- /.container -->
  <!-- Bootstrap core JavaScript -->
  <script src="SHINnara/vendor/jquery/jquery.min.js"></script>
  <script src="SHINnara/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="SHINnara/js/jquery.scrolly.min.js"></script>
  <script src="SHINnara/js/jquery.scrollex.min.js"></script>  
  <script src="SHINnara/js/skel.min.js"></script>
  <script src="SHINnara/js/util.js"></script>
  <script src="SHINnara/js/main.js"></script>
  <script src="SHINnara/js/jquery.min.js"></script>
</body>

</html>
