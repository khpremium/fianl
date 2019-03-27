<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Register</title>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- 업데이트 -->
  <script src="nononono/chkchk.js"></script>
  
  

  <!-- Custom fonts for this template-->
  <link href="nononono/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="nononono/css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">예약 정보 수정</div>
      <div class="card-body">
        <form action="reservationUpdate.do" method="post">
        
        
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="reservation_rv_num" class="form-control" value="${dto.rv_num}" placeholder="reservation_rv_num" required="required" autofocus="autofocus" readonly name="rv_num">
                  <label for="reservation_rv_num">예약 번호</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="reservation_payment_chk" class="form-control" value="${dto.payment_chk}" placeholder="reservation_payment_chk" required="required" name="payment_chk">
                  <label for="reservation_payment_chk">결제 여부</label>
                </div>
              </div>
            </div>
          </div>
         
         <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="reservation_airinfo_flight" class="form-control" value="${dto.airinfo_flight}" placeholder="reservation_airinfo_flight" required="required" autofocus="autofocus" readonly name="airinfo_flight">
                  <label for="reservation_airinfo_flight">항공편</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="reservation_user_id" class="form-control" value="${dto.user_id}" placeholder="reservation_user_id" readonly name="user_id">
                  <label for="reservation_user_id">아이디</label>
                </div>
              </div>
            </div>
          </div>
          <c:choose>
          <c:when test="${empty dto.user_id}">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="non_name" class="form-control" value="${dto.non_name}" placeholder="non_name" required="required" autofocus="autofocus" name="non_name">
                  <label for="non_name">이름</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="non_gender" class="form-control" value="${dto.non_gender}" placeholder="non_gender" required="required" name="non_gender">
                  <label for="non_gender">성별</label>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="non_phonenumber" class="form-control" value="${dto.non_phonenumber}" placeholder="non_phonenumber" required="required" autofocus="autofocus" name="non_phonenumber">
                  <label for="non_phonenumber">전화번호</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="email" id="non_email" class="form-control" value="${dto.non_email}" placeholder="non_email" required="required" name="non_email">
                  <label for="non_email">이메일</label>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="non_pass" class="form-control" value="${dto.non_pass}" placeholder="non_pass" required="required" autofocus="autofocus" name="non_pass">
                  <label for="non_pass">비회원 비밀번호</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="p_count" class="form-control" value="${dto.p_count}" placeholder="p_count" required="required" name="p_count">
                  <label for="p_count">인원</label>
                </div>
              </div>
            </div>
          </div>
          </c:when>
          <c:otherwise>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="non_name" class="form-control" value="${dto.non_name}" placeholder="non_name" autofocus="autofocus" name="non_name">
                  <label for="non_name">이름</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="non_gender" class="form-control" value="${dto.non_gender}" placeholder="non_gender" name="non_gender">
                  <label for="non_gender">성별</label>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="non_phonenumber" class="form-control" value="${dto.non_phonenumber}" placeholder="non_phonenumber" autofocus="autofocus" name="non_phonenumber">
                  <label for="non_phonenumber">전화번호</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="email" id="non_email" class="form-control" value="${dto.non_email}" placeholder="non_email" name="non_email">
                  <label for="non_email">이메일</label>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="non_pass" class="form-control" value="${dto.non_pass}" placeholder="non_pass" autofocus="autofocus" name="non_pass">
                  <label for="non_pass">비회원 비밀번호</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="p_count" class="form-control" value="3" placeholder="p_count" required="required" name="p_count">
                  <label for="p_count">인원</label>
                </div>
              </div>
            </div>
          </div>
          </c:otherwise>
          </c:choose>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="airinfo_flight" class="form-control" value="${dto.rv_code}" placeholder="airinfo_flight" required="required" readonly name="rv_code">
              <label for="airinfo_flight">예약코드</label>
            </div>
          </div>
          
          <button class="btn btn-primary btn-block">수정</button>
        </form>
       
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="nononono/vendor/jquery/jquery.min.js"></script>
  <script src="nononono/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="nononono/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
