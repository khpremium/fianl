<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
    ul{list-style-type: none}
    .hide{margin-left: 20%; list-style-type: disc;}
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script src="SHINnara/js/star.js"></script>
<script src="SHINnara/js/boardComment.js"></script>
<script>
    $(document).ready(function(){
    	
    	
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
        
        starRating();
        
        $("#searchBtn").click(function(){
        	var searchWord = $("#searchWord").val();
        	$.ajax({
        		type: 'GET',
        		url: "boardSearchList.do?searchWord="+searchWord,
        		success: location.href ="boardSearchList.do?searchWord="+searchWord
        	});
        	
        });//end search

        
        $("#delete").click(function(){
        	var message = confirm("정말 삭제하시겠습니까?");
        	if(message==true){
        	$("#form").attr("action", "boardDelete.do");
        	}; 
        });
        
        $("#modify").click(function(){
        	$("#form").attr("action", "boardUpdateForm.do");
        });        
        
        $("#heartBox a").click(function(){
        	$(this).attr("href",like_func());
        })
        
        $(".forCity").click(function(){
        	var city_code = $(this).attr('id');
        	
        	$.ajax({
     		    type : "GET",
    			url : "BoardCityList.do?city_code="+city_code,
    		    success: location.href="BoardCityList.do?city_code="+city_code
    			
        	});
        	
        })//end forCity
        

    });//end ready()
    function like_func(){
    	
        var userLikeChk = $("#userLikeChk").val(); //좋아요 눌린 상태로 클릭 -> 좋아요 취소 메소드
        var user_id= $("#user_id").val();
        var b_num = $("#b_num").val();
        var param = $("#form").serialize();
    	$.ajax({
 		    type : "POST",
 		    dataType: "json",
			url : "likeProcess.do",
			data: param,
		    success : function(res){
 		    	if(res.likeChk==2)
		    		$("#heartBox img").attr("src","SHINnara/images/1378418749 (1).png");
		    	else
		    		$("#heartBox img").attr("src","SHINnara/images/heart-outline (1).png");
		    	$("#heart").text(res.likeCount);
		    	$("#userLikeChk").val(res.likeChk); 
		    	
		    }	 
        });//end ajax
    };//end likefunc()
</script>

 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <meta name="description" content="">
 <meta name="author" content="">

  <!-- Bootstrap core CSS -->
 <link href="SHINnara/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
  <!-- Custom styles for this template -->
 <link href="SHINnara/css/blog-home.css" rel="stylesheet">
 <link href="SHINnara/css/stars.css" rel="stylesheet">

</head>
</head>
<body>

	<header id="header">
		<div class="logo"><a href="index.html">Road Trip <span>by TEMPLATED</span></a></div>
		<a href="#menu"><span>Menu</span></a>
	</header>
<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index.html">Home</a></li>
			<li><a href="generic.html">Generic</a></li>
			<li><a href="elements.html">Elements</a></li>
		</ul>
	</nav>

  <!-- Page Content -->
  <div class="container" id="container">

    <div class="row">
    
      <!-- Post Content Column -->
      <div class="col-lg-8">
      
      <c:forEach var="boardDTO" items="${vList}">
        <!-- Title -->
        <h1 class="mt-4" >${boardDTO.title}</h1>

        <!-- Author -->
        <p class="lead">
          by
          ${boardDTO.user_id}
        </p>

        <hr>

        <!-- Date/Time -->
        <form id="form">
        <p>Posted on <fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short" value="${boardDTO.upload_date}" /> 
           <input type="hidden" name="title"  value="${boardDTO.title}">            
           <input type="hidden" name="b_content"  value="${boardDTO.b_content}">     
           <input type="hidden" name="city_code" value="${boardDTO.city_code}" /> 
           <input type="hidden" name="b_num" id="b_num" value="${boardDTO.b_num}" /> 
           <input type="hidden" name="user_id" id="user_id" value="${boardDTO.user_id}"/>
           <input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" />
           <input type="hidden" value=" ${boardDTO.b_category_c_num }" id="b_category_c_num" name="b_category_c_num">
           <%-- <c:if test="${sessionScope.user_id eq boardDTO.user_id }"> --%>
           <input type="submit" id="delete" value="삭제" class="btn btn-primary" style="height: 35px; width: 53px; font-size:small; text-align: center; margin-left: 60%;">
           <input type="submit" id="modify" value="수정" class="btn btn-primary" style="height: 35px; width: 53px; font-size:small; text-align: center;">
           <%-- </c:if> --%>
        </p>
        </form>
        <hr>

        <!-- Preview Image -->
        <!-- 갤러리 시작 -->
<%--         <%@ include file="/SHINnara/gallery.jsp" %> --%>
      <%--   <c:set var="filename" value="${files}" scope="request" /> 
        <jsp:include page="gallery.jsp" flush ="false"/>     --%>
        <c:forEach items="${files }" var="data">
          <p><img src="SHINnara/images/${data }"  style="width: auto; height: 400px;"/></p>
        </c:forEach>
        <!-- 글내용 출력 -->
        ${boardDTO.b_content }
        
        
               
       <br/><br/><br/><br/><br/><br/><hr>

        <!-- Post Content -->
   
        <!-- 좋아요 박스 -->        
        <div id="heartBox">
        <c:choose>
          <c:when test="${boardDTO.userLikeChk ==2}">
             <a href="#" ><img src="SHINnara/images/1378418749 (1).png" style="width:20px; height: 20px;"></a>
          </c:when>
          <c:when test="${boardDTO.userLikeChk ==1}">
             <a href="#" ><img src="SHINnara/images/heart-outline (1).png" style="width:20px; height: 20px;"></a>
          </c:when>
        </c:choose>
             &nbsp;좋아요 &nbsp;<span id="heart">${likeCount}</span>
        </div>
        </c:forEach> 
        
        
        <hr>
       
        <!-- Comments Form -->
      <div class="Comment" id="Comment">
      <h4>댓글 작성</h4>
       <c:forEach var="boardDTO" items="${vList}">
        <form name="commentFrm" id="commentFrm" action="commentWrite.do">
        <input type="hidden" name="user_id" id="user_id" value="test01">
        <input type="hidden" name="board_b_num" id="board_b_num" value="${boardDTO.b_num}">
        <div class="card my-4" style="position: inherit; width: 100%; height: 100px;">
        <!-- 별점 시작 -->
        
          <!-- <h5 class="card-header">Leave a Comment:</h5> -->
          
          <div class="card-body" style="height: 50px;">
              <div class="form-group">
                <textarea class="form-control" style="width: 80%; margin: 0;"  rows="2" name="cm_content" id="cm_content"></textarea>
                <button type="button" id="CmWriteBtn" class="btn btn-primary" style="margin-left: 5%;margin-bottom: 5%;" >
                                     등록</button>
          </div>
          </div>
        </div>
        </form>
        <!-- end commentform  -->
        
        <!-- Single Comment -->
        <h4>댓글 목록</h4>
        <hr>
        <c:if test="${empty cmList }">
           <div id="cmCon" style="margin-left: 7%; font-size:medium; margin-top: 2%; margin-bottom: 2%;" contenteditable="false" >등록된 댓글이 없습니다.</div>
        </c:if>
        <c:forEach var="CmDTO" items="${cmList}">
        <div id="comment" class="comment">
        <div class="media mb-4" style="border:1px solid rgba(0,0,0,.125);width: 91%;margin-bottom: 0 !important;" id="commentArea">
          <div class="media-body" id="${cmDTO.cm_num }">
            <h4 class="mt-0" style="margin-left: 3%; border-bottom-color: black;" id="user_id">${CmDTO.user_id }</h4>
            
            <div id="cmCon" style="margin-left: 7%; font-size:medium; margin-top: 2%; margin-bottom: 2%;" contenteditable="false" >${CmDTO.cm_content}</div>
          </div>
       </div>
       </div>   
        <div id="BtnBox" style="margin-left: 76%; margin-top: 2px;">
          <p>
           <button id="${CmDTO.cm_num}" class="btn btn-primary" style="height: 35px; width: 53px; font-size:small; text-align: center;">수정</button> 
           <button id="${CmDTO.cm_num}" class="btn btn-primary" style="height: 35px; width: 53px; font-size:small; text-align: center; ">삭제</button>
          </p>
        </div>
        <%--         
        <c:if test="${session.user_id eq CmDTO.user_id}">
           <p>
             <input type="button" id="cmModifyBtn" value="수정">
             <input type="button" id="cmDeleteBtn" value="삭제">
           </p>
        </c:if> --%>
       </c:forEach>  <!-- 댓글 forEach -->

      
      
      </c:forEach>
      </div>
      <!-- end comment -->
      <div  style="margin-bottom: 7%; margin-top:7%; margin-left: 50%; ">
      <a href="BoardList.do?currentPage=${currentPage}" style="color: #F64747 !important">목록으로 돌아가기</a>
      </div>
      
    </div>  
    <!-- end blogcontent -->  
    
      <!-- Sidebar Widgets Column -->
      <div class="col-md-4" style="padding-top: 100px;">

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
          <div class="card-body"  id="cityList">
            <div class="col-lg-6">
              <ul class="list-unstyled mb-0">
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
      
      <!-- end sidebar -->
        
      </div>
      
        
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

<!--   Bootstrap core JavaScript -->
<!--   <script src="SHINnara/vendor/jquery/jquery.min.js"></script>
  <script src="SHINnara/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
  <script src="SHINnara/js/jquery.scrolly.min.js"></script>
  <script src="SHINnara/js/jquery.scrollex.min.js"></script>  
  <script src="SHINnara/js/skel.min.js"></script>
  <script src="SHINnara/js/util.js"></script>
  <script src="SHINnara/js/main.js"></script>
  <script src="SHINnara/js/jquery.min.js"></script>

</body>
</html>