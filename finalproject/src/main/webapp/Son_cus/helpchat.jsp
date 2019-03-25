<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="../Son_cus/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	//웹 소켓 객체를 저장할 변수를 선언
	var websocket;
	
	$(document).ready(function(){
			//웹 소켓 연결
			websocket = new WebSocket("ws://localhost:8090/myfinal/chatws.do");
			//웹 소켓 이벤트 처리
			websocket.onopen = onOpen;
			websocket.onmessage = onMessage;
			websocket.onclose = onClose;
			
			/* if(chatList != null){
				for(var index in chatList){
					$("#chatMessageArea").append(chatList[index] + "<br/>");
				}
			} */
		//전송 버튼을 누를 때 이벤트 처리
		$('#sendBtn').on('click',function(){
			/* var nick = $('#nickname').val(); */
			var nick = getParameterByName("id");
			var msg = $('#message').val();
			
			//메세지 전송
			websocket.send(nick + ":" + msg);
			
			//메세지 입력창 초기화
			$('#message').val('');
		});
		
		//message 창에서 enter를 눌렀을 때도 메시지를 전송
		//키보드를 누를 때 이벤트 처리
		$('#message').keypress(function(e){
			if(e.keyCode == 13){
				$('#sendBtn').click();
			}
		});
	});
	
	//WebSocket이 연결된 경우 호출되는 함수
	function onOpen(evt){
		console.log("웹 소켓에 연결 성공");
	}
	
	//WebSocket 이 연결 해제된 경우 호출되는 함수
	function onClose(evt){
		console.log("웹소켓에 연결 해제");
	}
	
	//서베어서 메시지가 왔을 때 호출되는 함수
	function onMessage(evt){
		//서버가 전송한 메시지 가져오기
		var data = evt.data;
		/* chatList.push(data); */
		$("#chatMessageArea").append(data + "<br/>");
	}
	
	//파라미터 id받기
	function getParameterByName(name) {
   	 name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
   	 var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
     	   results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	
}
	</script>
</head>

<body>
<div class="col-md-4">
<h5 class="card-header">1:1 고객상담센터</h5>
<div class="card-body" style="height: 200px;">
	<div id="chatMessageArea"></div>
</div>
<div>
	<input type="text" id="message" style="width: 85%;" /><input id="sendBtn" type="button"
		value="전송" style="width: 15%;">
</div>
</div>
</body>
</html>