<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#chatOpenBtn').on('click', function(){
			if('${sessionScope.id}'==null){
				alert('로그인후 이용가능합니다.');
				return false;
			}
			 var scWidth = screen.availWidth;
			 var scHeight = screen.availHeight;

			 var left = (parseInt(scWidth)-400);   // 창의 왼쪽 간격을
			 var top = (parseInt(scHeight)-400); //창의 높이를
			window.open('Son_cus/helpchat.jsp?id=${sessionScope.id}','1:1문의','width=350, height=300, left='+left+', top='+top+'');
		});
	});
</script>
<script>
  window.kakaoAsyncInit = function () {
    Kakao.init('50742c997666074c6366ef280ae6e6f2');
    Kakao.PlusFriend.createChatButton({
      container: '#plusfriend-chat-button'
    });
  };

  (function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//developers.kakao.com/sdk/js/kakao.plusfriend.min.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'kakao-js-sdk'));
</script>
</head>
<body>

<h5 class="card-header">고객상담센터</h5>

<div>
	<table>
		<tr>
		<td style="vertical-align: middle;">
		<%-- login
		<c:if test="null==(String)session.getAttribute('id')"></c:if> --%>
		<input id="chatOpenBtn" type="button" value="문의 오픈채팅" style="  padding:5px; border:'2px solid #ccc'; '-webkit-border-radius': 5px; border-radius: 5px;">
		</td>
		<td style="vertical-align: middle;">
		<!-- 카톡1:1 -->
		<div id="plusfriend-chat-button" data-plusfriend-id="_xfAXUj" data-title="consult" data-size="small" data-color="yellow" data-shape="pc" data-support-multiple-densities="true"></div>		
		
		</td>
		</tr>
	</table>	
</div>

</body>
</html>