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
      <div class="card-header">포인트 적립</div>
      <div class="card-body">
        <form action="boardLikeResetPoint.do" method="post">
        
        
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="client_id" class="form-control" value="${dto.id}" placeholder="client_id" required="required" autofocus="autofocus" readonly name="id">
                  <label for="client_id">아이디</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="client_point" class="form-control" value="${dto.point}" placeholder="client_point" required="required" name="point">
                  <label for="client_point">포인트</label>
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
