<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <div class="card-header">항공편 정보 수정</div>
      <div class="card-body">
        <form action="airinfoUpdate.do" method="post">
        
        
         <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="airinfo_flight" class="form-control" value="${dto.flight}" placeholder="airinfo_flight" required="required" readonly name="flight">
              <label for="airinfo_flight">항공편</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_d_time" class="form-control" value="${dto.d_time}" placeholder="airinfo_d_time" required="required" autofocus="autofocus" name="d_time">
                  <label for="airinfo_d_time">출발 시간</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_a_time" class="form-control" value="${dto.a_time}" placeholder="airinfo_a_time" required="required" name="a_time">
                  <label for="airinfo_a_time">도착 시간</label>
                </div>
              </div>
            </div>
          </div>
         
         <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_airline" class="form-control" value="${dto.airline}" placeholder="airinfo_airline" required="required" autofocus="autofocus" name="airline">
                  <label for="airinfo_airline">항공사</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_seatgrade" class="form-control" value="${dto.seatgrade}" placeholder="airinfo_seatgrade" required="required" name="seatgrade">
                  <label for="airinfo_seatgrade">좌석 등급</label>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_price_ad" class="form-control" value="${dto.price_ad}" placeholder="airinfo_price_ad" required="required" autofocus="autofocus" name="price_ad">
                  <label for="airinfo_price_ad">가격</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_seat" class="form-control" value="${dto.seat}" placeholder="airinfo_seat" required="required" name="seat">
                  <label for="airinfo_seat">남은 좌석</label>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_city_code_dep" class="form-control" value="${dto.city_code_dep}" placeholder="airinfo_city_code_dep" required="required" autofocus="autofocus" readonly name="city_code_dep">
                  <label for="airinfo_city_code_dep">출발 국가</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_city_code_arv" class="form-control" value="${dto.city_code_arv}" placeholder="airinfo_city_code_arv" required="required" readonly name="city_code_arv">
                  <label for="airinfo_city_code_arv">도착 국가</label>
                </div>
              </div>
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
