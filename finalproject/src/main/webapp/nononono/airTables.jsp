<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>항공편 관리</title>
  
  
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- FK chk -->
  <script src="nononono/chkchk.js"></script>
  

  <!-- Custom fonts for this template-->
  <link href="nononono/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="nononono/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="nononono/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="adminMain.do">관리자 전용 페이지</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle">
      <i class="fas fa-bars"></i>
    </button>

   

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item ">
        <a class="nav-link" href="adminMain.do">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>회원 정보 관리</span>
        </a>
      </li>
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>항공편 및 예약 관리</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">항공편 및 예약 관리</h6>
          <a class="dropdown-item" href="#">항공편 관리</a>
          <a class="dropdown-item" href="resTable.do">예약 정보 관리</a>
          <!-- <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.jsp">404 Page</a>
          <a class="dropdown-item" href="blank.jsp">Blank Page</a> -->
        </div>
      </li>
    
      
    </ul>

	  <!-- Sidebar end -->

    <div id="content-wrapper">

      <div class="container-fluid">

       

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            항공편 관리</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>항공편</th>
                    <th>항공사</th>
                    <th>출발시간</th>
                    <th>도착시간</th>
                    <th>좌석 등급</th>
                    <th>성인 가격</th>
                    <th>잔여 좌석</th>
                    <th>출발 국가</th>
                    <th>도착 국가</th>
                    <th>수정 및 삭제</th>
                    
                  </tr>
                </thead>
               
               <tbody>
               
               
               
               
                 <c:forEach var="dto" items="${aList}"> 
                  	 <tr>
                  		<th>${dto.flight}</th>
                  		<th>${dto.airline}</th>
                  		<th>${dto.d_time}</th>
                  		<th>${dto.a_time}</th>
                  		<th>${dto.seatgrade}</th>
                  		<th>${dto.price_ad}</th>
                  		<th>${dto.seat}</th>
                  		<th>${dto.city_code_dep}</th>
                  		<th>${dto.city_code_arv}</th>
                  		
                  		<th>
                  		
                  		<a href="airinfoUpdateForm.do?flight=${dto.flight}" class="btn btn-secondary">수정</a>                  		
                  		<input type="hidden" value="${dto.flight}" id="airinfo_flight"/>
                		<a href="#" class="btn btn-danger" id="airinfoBtn">삭제</a></th>
                		
                		<!-- airinfoDelete.do?flight=${dto.flight} -->
                  	</tr> 
               	</c:forEach>
                 
              
                  
               </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            항공편 입력</div>
          <div class="card-body">
        <form action="airinfoInsert.do" method="post">
        
        
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="flight" class="form-control" placeholder="항공편" required="required" name="flight">
              <label for="flight">항공편</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_d_time" class="form-control" placeholder="출발 시간" required="required" name="d_time">
                  <label for="airinfo_d_time">출발 시간</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_a_time" class="form-control" placeholder="도착 시간" required="required" name="a_time">
                  <label for="airinfo_a_time">도착 시간</label>
                </div>
              </div>
            </div>
          </div>
         
         <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_airline" class="form-control" placeholder="항공사" required="required" name="airline">
                  <label for="airinfo_airline">항공사</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_seatgrade" class="form-control" placeholder="좌석 등급" required="required" name="seatgrade">
                  <label for="airinfo_seatgrade">좌석 등급</label>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_price_ad" class="form-control" placeholder="가격" required="required" name="price_ad">
                  <label for="airinfo_price_ad">가격</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="airinfo_seat" class="form-control" placeholder="남은 좌석" required="required" name="seat">
                  <label for="airinfo_seat">남은 좌석</label>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <select class="form-control" name="city_code_dep">
                    <option >출발 도시</option>
                    <c:forEach items="${cityList}" var="dto">
                      <option value="${dto.city_code}">${dto.city_name}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <select class="form-control" name="city_code_arv">
                    <option>도착 도시</option>
                    <c:forEach items="${cityList}" var="dto">
                      <option value="${dto.city_code}">${dto.city_name}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
            </div>
          </div>
          
          
          
          <button class="btn btn-primary btn-block">입력</button>
        </form>
            
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
       
      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © KH Airplane 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.jsp">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="nononono/vendor/jquery/jquery.min.js"></script>
  <script src="nononono/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="nononono/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="nononono/vendor/datatables/jquery.dataTables.js"></script>
  <script src="nononono/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="nononono/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="nononono/js/demo/datatables-demo.js"></script>

</body>

</html>
