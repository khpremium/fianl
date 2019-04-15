<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Bare - Start Bootstrap Template</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$("#findBtn2").click(function() {
	$.ajax({
		url:"/myfinal/find_pw.do",
		type: "POST",
		data: {
			id: $("#id").val(),
			email: $("#email").val(),
		},
		success:function(res) {
			alert(res);
		},
	})
});
</script>
<!-- Bootstrap core CSS -->

<link href="joinMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="joinMain/vendor/bootstrap/css/idSearch.css" rel="stylesheet"> -->
<style type="text/css">
#div1 {
	margin-top: 8% ;
}

#div2 {
	margin-top: 8% ;
}
fieldset {
    border: 1px solid black;
	width: 40%;
	background-color: #FAFAFA; 
	padding: 4%;
	float:left; 
	margin-right: 5%; 
	margin-left:5%;
}

hr {
	color: blue;
	width: 80%;
}
#nana {
	 margin-left:18%;
	 
}body.subpage {
		padding-top: 3.125em;
	}

	@-moz-keyframes reveal-header {
		0% {
			top: -4em;
			opacity: 0;
		}

		100% {
			top: 0;
			opacity: 1;
		}
	}

	@-webkit-keyframes reveal-header {
		0% {
			top: -4em;
			opacity: 0;
		}

		100% {
			top: 0;
			opacity: 1;
		}
	}

	@-ms-keyframes reveal-header {
		0% {
			top: -4em;
			opacity: 0;
		}

		100% {
			top: 0;
			opacity: 1;
		}
	}

	@keyframes reveal-header {
		0% {
			top: -4em;
			opacity: 0;
		}

		100% {
			top: 0;
			opacity: 1;
		}
	}

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
				color: black;
				font-weight: 600;
				text-decoration: none;
			}

				#header .logo a:hover {
					color: black;
				}

			#header .logo span {
				font-weight: 300;
				font-size: .8em;
				color: black;
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
				color: #FFF;
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

			}

	@media screen and (max-width: 980px) {

		body.subpage {
			padding-top: 50px;
		}

		#header {
			height: 50px;
			line-height: 50px;
		}

			#header > h1 {
				left: 1em;
			}

				#header > h1 a {
					font-size: 1em;
				}

	}

	@media screen and (max-width: 480px) {

		#header {
			min-width: 320px;
			top: 0;
			font-size: .9em;
			background: rgba(0, 0, 0, 0.9);
		}

	}
	#main{
	    margin-top: 5%;
    	margin-left: 38%;
    	padding: 2% 7% 2% 7%;
    }

</style>
<meta charset="utf-8">

</head>
<body>
	<!-- Header -->
	<header id="header">
<div class="logo"><a href="main.do">KH AIR<span>(주)</span></a></div>
	</header>
   
   <!-- Page Content -->
	<div id="div1">
			<fieldset >
				<h5>아이디 찾기</h5>	
				<hr/>
				<br/>
				<div>
					이메일&emsp;&emsp;<input type="text" name="email1" id="email1" style="width: 50%;">	
				</div>
				<br/>
				<br/>
					<p id="nana"></p>
				<br/>
				<br/>
				<div style="margin-left: 27%;">
					<button type="button" id="findBtn">찾기</button>&emsp;
					<button type="button" onclick="history.go(-1);">취소</button>
				</div>
			
			</fieldset>

		<form action="find_pw.do" method="post">
		<fieldset>
			<h5>비밀번호 찾기</h5>
			<hr/>
			<br/>
			<div>
				아이디&emsp;&emsp;<input type="text" id="id" name="id" style="width: 50%;"/>
			</div>
			<br/>
			<div>
				이메일&emsp;&emsp;<input type="text" id="email" name="email" style="width: 50%;"/>
			</div>
			<br/>
			<p id="test"></p>
			<br/>
			<div style="margin-left: 27%;">
				<button type="submit" id="findBtn2" >찾기</button>&emsp;
				<button type="button" onclick="history.go(-1);">취소</button>
			</div>
		</fieldset>
		</form>
		<form action="/myfinal/main.do">
			<button type="submit" id="main" class="btn btn-secondary">메인으로 돌아가기</button>
		</form>
	</div>

	
	
   <!-- Bootstrap core JavaScript -->
   <script src="joinMain/vendor/jquery/jquery.min.js"></script>
   <script src="joinMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="joinMain/vendor/bootstrap/js/idSearch.js"></script>
  
</body>

</html>