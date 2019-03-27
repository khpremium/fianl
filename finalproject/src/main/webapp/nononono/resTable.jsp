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

  <title>예약 정보 관리</title>
  
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

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
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
          <a class="dropdown-item" href="airTables.do">항공편 관리</a>
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
            예약 정보 관리</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    
                    <th>예약 번호</th>
                    <th>결제 여부</th>
                    <th>항공편</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>성별</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>비회원 비밀번호</th>
                    <th>인원</th>
                    <th>수정 및 삭제</th>
                  </tr> 
                    
                 
                
                </thead>
                
               
                  <tbody>
                 <c:forEach var="dto" items="${aList}"> 
                  	 <tr>
                  		<th>${dto.rv_num}</th>
                  		<th>${dto.payment_chk}</th>
                  		<th>${dto.airinfo_flight}</th>
                  		<th>${dto.user_id}</th>
                  		<th>${dto.non_name}</th>
                  		<th>${dto.non_gender}</th>
                  		<th>${dto.non_phonenumber}</th>
                  		<th>${dto.non_email}</th>
                  		<th>${dto.non_pass}</th>
                  		<th>${dto.p_count}</th>
                  		<th><a  class="btn btn-secondary" id="reservationUpdateBtn">수정</a>
                  			<input type="hidden" value="${dto.rv_num}" id="reservation_rv_num"/>
                			<a href="reservationDelete.do?rv_num=${dto.rv_num}" class="btn btn-danger">삭제</a></th>
                  	 
                  	</tr> 
               	</c:forEach>
                  
                                  
                  
                    
                    
                  
                </tbody>
              </table>
            </div>
          </div>
          
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
