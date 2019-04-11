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
    .menu .hide{display:none;}
    ul{list-style-type: none}
    a:hover{text-decoration: none !important;}
    .media-body h4, .media-body p{display: inline;}
    #cityList a{color: #6c757d;}
    #cityList a:hover{color:#F64747 !important;}
    .btn-primary{
    background-color: #F64747 !important;
    border-color: #F64747 !important;}
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

		}    
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- Bootstrap core JavaScript -->
<!--   <script src="SHINnara/vendor/jquery/jquery.min.js"></script>
  <script src="SHINnara/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
<script>
    var filename = [];
    
    
    $(document).ready(function(){
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
        
        $("#searchBtn").click(function(){
        	var searchWord = $("#searchWord").val();
        	$.ajax({
        		type: 'GET',
        		url: "boardSearchList.do?searchWord="+searchWord,
        		success: location.href ="boardSearchList.do?searchWord="+searchWord
        	});
        	
        });//end search
        
         $("#CC").on('change',CCselected); 
         
         $("#btnSave").click(function(){
          saveProcess();
          //$("#frm").attr('action','suggestWrite.do').submit();
        });//end btnSave()
        
        $("#btnList").click(function(){
        	location.href ='BoardList.do'
        });//end Lsit
         
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
     		//console.log(filename);
     	});
     	// 첨부 파일 드래그 끝
     	

     	// 첨부 파일 삭제 시작
     	$(document).on('click', '.fileDrop input', function() {
     		$(this).parent().remove();
     		filename = [];
     	});
     	// 첨부 파일 삭제 끝
     	
     	//  div등 form 내부 요소에 담아서 보내기 
     	
     	$(".forCity").click(function(){
        	var city_code = $(this).attr('id');
        	
        	$.ajax({
     		    type : "GET",
    			url : "BoardCityList.do?city_code="+city_code,
    		    success: location.href="BoardCityList.do?city_code="+city_code
    			
        	});
        	
        })//end forCity
     	
    });//end ready()

    function CCselected(){
    	var selectedCountry = $("#CC option:selected").val();
    	$.ajax({
    		type: "GET",
    		url:"chkCity.do?country_code="+selectedCountry,
    		dataType:"json",
    		success:function(res){
            	$("#city").empty();
            	var select = $('<option value="none">도시를 선택하세요</option>');
            	$("#city").append(select);
                $.each(res, function(i, value){ 	
                	var option = $('<option value="'+value.city_code+'">'+value.city_name+'</option>');              	
                	$("#city").append(option);
                  });
    		  }
        }); 
    }//end CCselected()
    
    
    function saveProcess(){
    	var form_Data = new FormData();
     	form_Data.append('city_code', $("#city option:selected").val()); 
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
    		url: 'boardWrite.do',
    		data: form_Data,
    		//아래 세개는 첨부파일
    		contentType: false,
    		enctype: 'multipart/form-data',
    		processData: false,
    		success: location.href ="BoardList.do"
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
        <h1 class="my-4">여행 후기 작성
          <small></small>
        </h1>


        <!-- Blog Post -->   
     <div class="card mb-4">
     <!-- 여기에 글쓰기 공간!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
     <form name="frm" id="frm" method="post" enctype="multipart/form-data" style="margin-top: 3%; margin-bottom: 3%" > 
     <div id="selectCity" style="margin-left: 5%" >
	        <label for="cityCode">도시선택</label> 
	        
			<select name="country_code" id="CC" style="margin-left:3.5%; width: 120px;" >
			  <option>국가</option>
			  <option value="KO">한국</option>
			  <option value="CN">중국</option>
			  <option value="JP">일본</option>
			  <option value="VN">베트남</option>
			  <option value="TH">태국</option>
		    </select>   
		    <select name="city_code" id="city" style="width: 160px;">
		      <option value="none2">국가를 선택하세요</option>
		    </select>
     </div>             
		<table>
			<tr>
				<td width="20%" align="center">제목</td>
				<td>						 
				<input type="text" id="title" name="title" size="40" /></td>
			</tr>

			<tr>
				<td width="20%" align="center">내용</td>
				<td><textarea id="b_content" name="b_content" rows="15" cols="70" style="overflow-y:auto;"></textarea></td>
			</tr>
		</table>
		
		<!-- !!!!!!!!!!!!!!!!첨부파일  -->
		<div id="attatch" style="margin-left: 5%" >
		   <label for="userpc"> 첨부파일 </label>
		   <span id="userpc" style="cursor:pointer;margin-left:3.5%; " >내 PC</span>
		</div>
	    <div class="fileDrop" style="border-color: blue; width: 70%; height: 110px; margin-left: 18%; overflow-y: auto;"></div>
	    <div id="files"></div>

       
		<input type="hidden" name="user_id" id="user_id" value="${sessionScope.id }">
	  <div id="btnSpace" style="margin-top: 3%; margin-left: 40% ">
		<input type="button" id="btnSave" value="글쓰기" class="btn btn-primary" style="height: 35px; width: 65px; font-size:small; text-align: center; "/> 
		<input type="button" id="btnList" value="취소" class="btn btn-primary" style="height: 35px; width: 53px; font-size:small; text-align: center; "/>
	  </div>	
	</form>
 </div>
      <div  style="margin-bottom: 7%; margin-top:7%; margin-left: 50%;">
      <a href="BoardList.do?currentPage=${currentPage}" style="color: #F64747 !important">목록으로 돌아가기</a>
      </div>
	
        <!-- Pagination -->
      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4" style="margin-top: 6% !important">

        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">검색하기</h5>
          <div class="card-body">
            <div class="input-group">
              <input type="text" class="form-control" id="searchWord" placeholder="제목 또는 내용 ">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button" id="searchBtn">검색</button>
              </span>
            </div>
          </div>
        </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">둘러보기</h5>
          <div class="card-body" id="cityList">
            <div class="row">
              <ul>
              <li>
                 <a href="BoardList.do" >전체보기</a>
              </li>
              <li class ="menu">
                 <a href="#">한국</a>
                 <ul class="hide">
                   <li><a href="#" id="SEO" class="forCity">서울</a></li>
                   <li><a href="#" id="PUS" class="forCity">부산</a></li>
                   <li><a href="#" id="CJU" class="forCity">제주</a></li>
                 </ul>
              </li>
              
              <li class ="menu">
                 <a href="#">중국</a>
                 <ul class="hide">
                   <li><a href="#" id="PEK" class="forCity">베이징</a></li>
                   <li><a href="#" id="TAO" class="forCity">칭다오</a></li>
                   <li><a href="#" id="SHA" class="forCity">상하이</a></li>
                 </ul>
              </li>
              
              <li class ="menu">
                 <a href="#">일본</a>
                 <ul class="hide">
                   <li><a href="#" id="TYO" class="forCity">도쿄</a></li>
                   <li><a href="#" id="OSA" class="forCity">오사카</a></li>
                   <li><a href="#" id="OKA" class="forCity">오키나와</a></li>
                 </ul>
              </li>        
              
             <li class ="menu">
                 <a href="#">베트남</a>
                 <ul class="hide">
                   <li><a href="#" id="DAD" class="forCity">다낭</a></li>
                 </ul>
              </li>      

             <li class ="menu">
                 <a href="#">태국</a>
                 <ul class="hide">
                   <li><a href="#" id="BKK" class="forCity">방콕</a></li>
                 </ul>
              </li>                                 
           </ul>  
            </div>
          </div>
        </div>

        <!-- Side Widget -->


      </div>

    <!-- /.row -->

  </div>
  </div>
  <!-- /.container -->
  <script src="SHINnara/js/jquery.scrolly.min.js"></script>
  <script src="SHINnara/js/jquery.scrollex.min.js"></script>  
  <script src="SHINnara/js/skel.min.js"></script>
  <script src="SHINnara/js/util.js"></script>
  <script src="SHINnara/js/main.js"></script>
  <script src="SHINnara/js/jquery.min.js"></script>

</body>

</html>
