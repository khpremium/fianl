<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#sendmail')
								.on(
										'click',
										function() {
											if ($('#subject').val() == ''
													|| $('#from').val() == ''
													|| $('#password').val() == ''
													|| $('#contents').val() == '') {
												alert('빈 칸이 있습니다.');
												return false;
											}
											var str = $('#from').val();
											var res = str.split("@");
											if (res[1] != 'gmail.com') {
												alert('gmail을 사용해주세요.');
												return false;
											}

											var maildata = 'subject='
													+ $('#subject').val()
													+ '&from='
													+ $('#from').val()
													+ '&password='
													+ $('#password').val()
													+ '&contents='
													+ $('#contents').val();
											$
													.ajax({
														type : 'POST',
														dataType : 'text',
														url : 'sendMail2.do',
														data : maildata,
														success : sendMail2,
														error : function(
																request,
																status, error) {
															alert('PW확인해주세요.');
															alert('PW가 맞으면  https://myaccount.google.com/security > 보안 > 보안 수준이 낮은 앱의 액세스 > 사용 으로 변경해주세요.');
														}
													});
										});
					});

	function sendMail2(res) {
		alert('메일전송 완료');
		$('#subject').val('');
		$('#from').val('');
		$('#password').val('');
		$('#contents').val('');
	}
</script>
</head>
<body>

	<div class="inner">

		<h2>Contact Me</h2>

		<!-- <form action="sendMail2.do" method="post"> -->

		<div class="field half first">
			<label for="name">Subject</label> <input name="subject" id="subject"
				type="text" placeholder="Subject">
		</div>
		<div class="field half">
			<label for="from">Email</label> <input name="from" id="from"
				type="email" placeholder="Email(Use Gmail)">
		</div>
		<div class="field half">
			<label for="from">Password</label> <input name="password"
				id="password" type="password" placeholder="Password">
		</div>
		<div class="field">
			<label for="contents">Message</label>
			<textarea name="contents" id="contents" rows="6"
				placeholder="Message"></textarea>
		</div>
		<ul class="actions" style="text-align: center;">
			<li><input id="sendmail" value="Send Message" class="button alt"
				type="submit"></li>
		</ul>
		<!-- </form> -->

		<ul class="icons">
			<li><a href="#" class="icon round fa-twitter"><span
					class="label">Twitter</span></a></li>
			<li><a href="#" class="icon round fa-facebook"><span
					class="label">Facebook</span></a></li>
			<li><a href="#" class="icon round fa-instagram"><span
					class="label">Instagram</span></a></li>
		</ul>

		<div class="copyright">
			&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>.
			Images: <a href="https://unsplash.com">Unsplash</a>.
		</div>

	</div>

</body>
</html>