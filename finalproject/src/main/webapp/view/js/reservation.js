var IMP = window.IMP; // 생략가능
IMP.init('imp56323824'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
var one = 0;
var two = 0;
var p_count = Number($('#p_count').text());
var price = 0;
var pointchk = false;

$(document).ready(function() {
	// 비행편 라디오버튼 클릭 이벤트
	$(document).on('click', 'table input[name="dept"]', depFlightProcess);
	$(document).on('click', 'table input[name="arrv"]', arvFlightProcess);
	
	// 네이버페이 생성
	var oPay = Naver.Pay.create({
		"mode" : "development", // development or production
		"clientId" : "u86j4ripEt8LRfPGzQ8", // clientId
		"openType" : "layer",
		"onAuthorize" : function(oData) {
/*
layer 타입을 사용했을 때 페이지 전환 없이 구현이 가능하도록 지원되며, 그 외의 경우는 returnUrl 로 참조 정보와 함께 redirect 됩니다.
oData 객체에는 결제 인증 결과와 전달한 returnUrl 정보가 함께 전달되며,
이 정보는 이후 승인 요청 처리를 위한 정보 (resultCode, resultMessage, returnUrl, paymentId, reserveId 등) 입니다.
전달되는 값은 https://developer.pay.naver.com/docs/v2/api#payments-payments_window 의 성공 & 실패 응답 값을 참조해주세요.
 */
			if (oData.resultCode === "Success") {
				// 네이버페이 결제 승인 요청 처리
				alert('결제성공');
				$('#payment_chk').val(1);
				$('form').submit();
			} else {
				// 필요 시 oData.resultMessage 에 따라 적절한 사용자 안내 처리
				alert('결제실패\n사유:' + oData.resultMessage);
				$('#payment_chk').val(0);
			}
		}
	});

	//직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
	$('#naverpayment').on("click", function() {
		if ($('#dep_airinfo_flight').val() == '' || $('#arv_airinfo_flight').val() == '') {
			alert('비행편을 선택해주세요.');
			return false;
		}
		
		oPay.open({
			"merchantUserKey" : "123",
			"merchantPayKey" : "123",
			"productName" : "항공권",
			"totalPayAmount" : "1000",
			"taxScopeAmount" : "1000",
			"taxExScopeAmount" : "0",
			"returnUrl" : "payment.do"
		});
	});

	// 카카오페이 버튼 클릭시 이벤트
	$('#kakaopayment').on('click', function() {
		if ($('#dep_airinfo_flight').val() == '' || $('#arv_airinfo_flight').val() == '') {
			alert('비행편을 선택해주세요.');
			return false;
		}

		$.ajax({
			type : 'POST',
			url : 'kakaoPro.do',
			data : 'name=' + $('#resName').text() + '&price=' + $('.totalPrice').text() + '&p_count=' + p_count,
			dataType : 'json',
			success : function(res) {
				window.open(res.next_redirect_pc_url,'_blank','width=400, height=600, left=580, top=200');
			}
		});
		// alert($('#resName').text());
		
		return false;
	});
	
	$('#payment').on('click', function() {
		if ($('#dep_airinfo_flight').val() == '' || $('#arv_airinfo_flight').val() == '') {
			alert('비행편을 선택해주세요.');
			return false;
		}
		
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트',
			amount : 100,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
			if ( rsp.success ) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
		
		return false;
	});
	
	$(document).on('click', '#pointBtn', pointUse);
	
});

function pointUse(e) {
	$('.point').removeClass('non');
	pointchk = true;
	e.preventDefault();
	$(e).val('포인트 사용 취소');
	$(document).on('click', '#pointBtn', pointCancel);
}

function pointCalcel(e) {
	$('.point').addClass('non');
	pointchk = false;
	e.preventDefault();
	$(e).val('포인트 사용');
	$(document).on('click', '#pointBtn', pointUse);
}

function priceProcess() {
	price = Number($('.price').text());
	if(pointchk) {
		price = price - $('.point').val();
		$('#usePoint').val($('.point').val());
	}
}

// 카카오페이 실행결과
function kakaoResultProcess(res) {
	if (res == 'cancel')
		alert('결제가 취소되었습니다.');
	else if (res == 'fail')
		alert('결제에 실패하였습니다.');
	else {
		$('#payment_chk').val(1);
		$('form').submit();
	}
}

function depFlightProcess() {
	var parent = $(this).parent().parent();
	var num = Number($(parent).children('td:eq(4)').text());
	if(one == 0) {
		if(two == 0) {
			$('.dep_airinfo_flight').text($(parent).children('td:eq(1)').text());
			$('#dep_airinfo_flight').val($(parent).children('td:eq(1)').text());
			$('.price').text(num);
			$('.totalPrice').text(num * p_count);
		} else {
			var currNum = Number($('.price').text());
			$('.dep_airinfo_flight').text($(parent).children('td:eq(1)').text());
			$('#dep_airinfo_flight').val($(parent).children('td:eq(1)').text());
			$('.price').text(currNum + num);
			$('.totalPrice').text((currNum * p_count) + (num * p_count));
		}
	} else {
		var currNum = Number($('.price').text());
		$('.dep_airinfo_flight').text($(parent).children('td:eq(1)').text());
		$('#dep_airinfo_flight').val($(parent).children('td:eq(1)').text());
		$('.price').text(currNum - one + num);
		$('.totalPrice').text((currNum * p_count) - (one * p_count) + (num * p_count));
	}
	one = num;
}

function arvFlightProcess() {
	var parent = $(this).parent().parent();
	var num = Number($(parent).children('td:eq(4)').text());
	if(two == 0) {
		if(one == 0) {
			$('.arv_airinfo_flight').text($(parent).children('td:eq(1)').text());
			$('#arv_airinfo_flight').val($(parent).children('td:eq(1)').text());
			$('.price').text(num);
			$('.totalPrice').text(num * p_count);
		} else {
			var currNum = Number($('.price').text());
			$('.arv_airinfo_flight').text($(parent).children('td:eq(1)').text());
			$('#arv_airinfo_flight').val($(parent).children('td:eq(1)').text());
			$('.price').text(currNum + num);
			$('.totalPrice').text((currNum * p_count) + (num * p_count));
		}
	} else {
		var currNum = Number($('.price').text());
		$('.arv_airinfo_flight').text($(parent).children('td:eq(1)').text());
		$('#arv_airinfo_flight').val($(parent).children('td:eq(1)').text());
		$('.price').text(currNum - two + num);
		$('.totalPrice').text((currNum * p_count) - (two * p_count) + (num * p_count));
	}
	two = num;
}