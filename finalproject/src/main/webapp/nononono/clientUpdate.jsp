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
      <div class="card-header">회원 정보 수정</div>
      <div class="card-body">
        <form>
        
        
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="client_id" class="form-control" value="${dto.id}" placeholder="client_id" required="required" autofocus="autofocus" readonly>
                  <label for="client_id">아이디</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="client_pass" class="form-control" value="${dto.pass}" placeholder="client_pass" required="required">
                  <label for="client_pass">비밀번호</label>
                </div>
              </div>
            </div>
          </div>
         
         <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="client_name" class="form-control" value="${dto.name}" placeholder="client_name" required="required" autofocus="autofocus">
                  <label for="client_name">이름</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="client_phonenum" class="form-control" value="${dto.phonenum}" placeholder="client_phonenum" required="required">
                  <label for="client_phonenum">전화번호</label>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="client_email" class="form-control" value="${dto.email}" placeholder="client_email" required="required" autofocus="autofocus">
                  <label for="client_email">이메일</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="client_point" class="form-control" value="${dto.point}" placeholder="client_point" required="required">
                  <label for="client_point">포인트</label>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="client_gender" class="form-control" value="${dto.gender}" placeholder="client_gender" required="required" autofocus="autofocus">
                  <label for="client_gender">성별</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="client_birth" class="form-control" value="${dto.birth}" placeholder="client_birth" required="required">
                  <label for="client_birth">생년월일</label>
                </div>
              </div>
            </div>
          </div>
          
          
          
          <a class="btn btn-primary btn-block" href="login.html">Register</a>
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
