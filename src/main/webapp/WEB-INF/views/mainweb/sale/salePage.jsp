<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  <title>CRM | sale</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="images/main/favicon.png" rel="icon">
  <link href="images/main/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${path}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${path}/resources/bootstrap/css/font-awesome.css" rel="stylesheet">
  <link href="${path}/resources/bootstrap/css/iCheck/custom.css" rel="stylesheet">
  <link href="${path}/resources/bootstrap/css/bootstrap-icons.css" rel="stylesheet">
  <link href="${path}/resources/bootstrap/css/boxicons.min.css" rel="stylesheet">
  <link href="${path}/resources/bootstrap/css/glightbox.min.css" rel="stylesheet">
  <link href="${path}/resources/bootstrap/css/remixicon.css" rel="stylesheet">
  <link href="${path}/resources/bootstrap/css/swiper-bundle.min.css" rel="stylesheet">
  <link href="${path}/resources/bootstrap/css/animate.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${path}/resources/bootstrap/css/user_style.css" rel="stylesheet">
  <link href="${path}/resources/bootstrap/css/style.css" rel="stylesheet">
  
  <!-- 내가 쓴 js  -->
  <script type="text/javascript" src="${path}/resources/host/js/custBooking.js"></script>
  <script type="text/javascript" src="${path}/resources/host/js/product_selling.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a24a16f3acffb8fc1ba508e3c65e6c76&libraries=services"></script>
  
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  <!-- =======================================================
  * Template Name: Vlava - v4.3.0
  * Template URL: https://bootstrapmade.com/vlava-free-bootstrap-one-page-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  <script type="text/javascript">

  function kakaoPay() {
  	
  	var url = "kakaoPay"
  	window.open(url, "kakaoPay", "menubar=no, width=1300, height=800");
  }

  </script>
</head>
<body>

<c:if test="${insertCnt == 3}">
	<script type="text/javascript">
		alert("예약 가능한 시간이 아닙니다. 다시 확인해주세요.");
		window.history.back();
	</script>
</c:if>
<c:if test="${insertCnt == 2}">
	<script type="text/javascript">
		alert("부접한한 예약 시간입니다. 다시 확인해주세요.");
		window.history.back();
	</script>
</c:if>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center header-transparent">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1><a href="home">Creamy</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="images/main/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
	      <c:if test="${sessionScope.id != null}">
          	<li><a href="mypage" class="nav-link scrollto">${sessionScope.id}</a></li>
          </c:if>
          <li><a class="nav-link scrollto active" href="home">Home</a></li>
          <li class="dropdown"><a href=""><span>Reservation</span> <i class="bi bi-chevron-down"></i></a>
          	<ul>
                  <li><a href="selectHost">고객 예약</a></li>
          	</ul>
          </li>
          <c:if test="${sessionScope.id != null}">
          <li><a class="nav-link scrollto" href="logout">logout</a></li>
          </c:if>
          <c:if test="${sessionScope.id == null}">
          <li><a class="nav-link scrollto" href="login">login</a></li>
          </c:if>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

    <!-- ======= 상단 메뉴 ======= -->
    <section id="contact" class="contact section-bg">
      <div class="container">

        <div class="section-title" style="padding-bottom: 0px; padding-top: 50px;">
          <h2>결제 정보 입력</h2>
        </div>
      </div>
      <div class="container">
        <div class="row mt-5 justify-content-center">
        
        <!-- ======= 상단 메뉴 끝 ======= -->
        
        <!-- ======= 예약내역 폼 ======= -->
         <div class="row mt-5 justify-content-center">
         	<div class="col-lg-15">
         	<%-- <form method="post" name="modifyUser" role="form" class="php-email-form">  --%>
         	 <form action="sale_action" method="post" name="insertRoomBooking" class="php-email-form">	
         	 	<div class="row">
         	 	
         	 	<sec:csrfInput/>
				<input type="hidden" id="user_id" name="user_id" value="${sessionScope.id}">
				<input type="hidden" id="res_memo" name="res_memo">
				<input type="hidden" id="host_code" name="host_code" value="${dto.host_code}">
				<input type="hidden" id="chkDay">
				<input type="hidden" id="comp_res" value="${comp_res}">
				<input type="hidden" id="per_price" value="0">
				<input type="hidden" id="min_cnt" value="0">
				<input type="hidden" id="max_cnt" value="0">
				<input type="hidden" id="res_sales" name="res_sales" value="0">
				<input type="hidden" name="res_code" value="${res_code}">
				<input type="hidden" name="selectDate" value="${selectDate}">
				<input type="hidden" name="open_sche" value="${openTime}">
				<input type="hidden" name="close_sche" value="${closeTime}">
				<input type="hidden" name="res_start" value="${dto.res_start}">
				<input type="hidden" name="res_end" value="${dto.res_end}">
				<input type="hidden" name="res_room" value="${dto.res_room}">
				
				<input type="hidden" value="0" name="product_typeOfSales_hidden">
				<input type="hidden" value="0" name="product_name_hidden">
				<input type="hidden" value="0" name="product_price_hidden">
				<input type="hidden" value="0" name="product_rentalPeriod_hidden">
				<input type="hidden" value="0" name="cash_btn_hidden">
         	 	<input type="hidden" value="0" name="kakao_btn_hidden">
         	 	
         	 	<sec:csrfInput/>
         	 	
         			<div class="member-info" style="padding-left: 5px;"><span style="font-size: 20px;"><b>예약 내역</b></span><br><br></div>
         			
         			<div class="col-lg-12 col-md-12">    
         			<div class="row">  
         				<!-- ibox 시작 -->
                        <div class="ibox col-lg-6">
                            <div class="ibox-content">
                              <div id="calendar">
                              <input type="date" name="res_date" value="${dto.res_date}"></div>   
                            </div>
                            <div class="panel-heading" style="background-color: #e5e6e7; margin-top:15px; color: black">
                               <input type="text" name="res_hour" id="selectTime" style="display: none" value="${dto.res_hour}">예약 시간 : ${dto.res_start} ~ ${dto.res_end} 
                            </div>
                            
                            <div class="panel-heading" style="background-color: #e5e6e7; margin-top:15px; color: black">
                          		<input type="text" name="room_setting_code" id="selectRoom" style="display: none" value="${dto.room_setting_code}">예약 호실 : 
                          			<input type="hidden" name="res_room" value="${dto.res_room}">${dto.res_room}</span>
                       	  	</div>
                            <div class="panel-heading" style="background-color: #e5e6e7; margin-top:15px; color: black">
                          		<input type="number" name="GuestCount" id="GuestCount" style="display: none" value="${dto.res_cnt}">예약 인원 : ${dto.res_cnt}</span>
                       	  	</div>
                            <div class="form-group" style="margin-top:30px;">
                                 <span><strong>추가 요청사항</strong></span>
                                 <textarea class="form-control" placeholder="Your message" rows="3"
                                    style="margin-top:10px;" name="res_indiv_request" value="${dto.res_indiv_request}">${dto.res_indiv_request}</textarea>
                            </div>
                            
                            <div class="ibox-content" style="margin-top: 50px;">
                               <span style="font-size:24px;"><strong>예약한 매장 정보<br><br></strong></span>
                               					${dto.host_code}
                               <div id="map" style="width: 300; height:200px;"></div>
                            </div>
                        </div>     
                        <!-- ibox 끝 -->
                        
                        
                         <!-- ibox 시작 -->
                         
                        <div class="ibox col-lg-6">
                        <div class="ibox-title">
				            <h5>결제 정보</h5>
				        </div>
                            <div class="ibox-content">
                                <div class="row">
                                   <!-- 결제 정보 시작 -->          
                                   
                                   <!-- ------------------------------- 결제정보 시작 -->
									        
						                <div class="form-group row">
						                <label class="col-sm-3 col-form-label">결제 금액</label>
						                    <div class="col-lg-8" id="total_payment"><input type="hidden" name="total_payment" value="${dto.res_sales}">${dto.res_sales}</div>
						                </div>
						                <hr>
						                <div class="hr-line-dashed"></div>
						                
						                <div class="form-group  row">
						                <label class="col-sm-3 col-form-label">납부 방법</label>
						                	<input type="hidden" name="payment_option" value="">
							                <div class="col-sm-8" name="">  
							                	<table>
							                	<tr><td>
								                    <input type="button" name="cash_btn" id="cash_btn" value="현금" class="btn btn-outline btn-primary" >
								                    <!-- <input type="button" name="credit_btn" id="credit_btn" value="카드" class="btn btn-outline btn-primary" > -->
								                    <input type="button" name="bank_btn" id="bank_btn" value="무통장" class="btn btn-outline btn-primary" >
								                    <!-- <a href="sale/kakaoPay"> -->
								                    	<input type="button" name="kakao_btn" id="kakao_btn" value="카카오페이" class="btn btn-outline btn-primary">
								                    <!-- </a> -->
							                    </td></tr>
							                    </table>
							                 </div>
							            </div>
							           
						                <div class="hr-line-dashed"></div> 
						                
						                <div class="form-group row">
						                <label class="col-sm-3 col-form-label">금융 기관</label>
					
						                	<div id="banking" class="col-sm-8" style="display:flex;">
							                     <div class="col-sm-6">
							                     <select name="credit_select" id="credit_select" class="form-control">
													<option value="1" selected="">카드 선택</option>
						                             <option value="samsung">삼성카드</option> 
						                             <option value="bc">BC카드</option>
						                             <option value="kookmin">국민카드</option>
						                             <option value="hana">하나카드</option>
						                             <option value="shinhan">신한카드</option>
						                             <option value="lotte">롯데카드</option>
						                             <option value="hyundai">현대카드</option>
						                             <option value="nonghyup">농협카드</option>
						                             
					                        	 </select>
					                        	 </div> 
					                        	 <div class="col-sm-6">
							                     <select name="credit_installment" id="credit_installment" class="form-control">
													<option value="1" selected="">일시불</option>
						                             <option value="2">2개월</option>
						                             <option value="3">3개월</option>
						                             <option value="4">4개월</option>
						                             <option value="5">5개월</option>
						                             <option value="6">6개월</option>
						                             <option value="7">7개월</option>
						                             <option value="8">8개월</option>
						                             <option value="9">9개월</option>
						                             <option value="10">10개월</option>
						                             <option value="11">11개월</option>
						                             <option value="12">12개월</option>
						                             <option value="20">20개월</option>
						                             <option value="24">24개월</option>
						                             <option value="36">36개월</option>
					                        	 </select>
					                        	 </div> 
							                </div> 
							                
							            </div> 
						                <div class="hr-line-dashed"></div> 
						                
						                <div class="form-group  row">
						                <label class="col-sm-3 col-form-label">납부 메모</label>
							                <div class="col-sm-8">
							                	<input type="text" name="sale_memo">
					                        </div>    	
							            </div>
						                <div class="hr-line-dashed"></div> 
						        </div>
						    </div>
						</div>
								<!-- ------------------------------- 결제정보 끝 -->
                               </div>
                           </div>
                           <!-- ibox 끝 -->
                    </div>
							<div class="text-center">
				              <button type="submit" formmethod="post" formaction="sale/kakaoPay" style="font-size: 16px">예약하기</button>
				            </div>
                        <!-- col-lg-6 끝 -->
			</form>
			<!-- sale_action 폼 끝 -->
					
              
         	 	</div>
         	 </div>
         </div>
		</div>
      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">

      <div class="container">

        <div class="row  justify-content-center">
          <div class="col-lg-6">
            <h3>Creamy</h3>
            <p>Et aut eum quis fuga eos sunt ipsa nihil. Labore corporis magni eligendi fuga maxime saepe commodi placeat.</p>
          </div>
        </div>

        <div class="row footer-newsletter justify-content-center">
          <div class="col-lg-6">
            <form action="" method="post">
              <input type="email" name="email" placeholder="Enter your Email"><input type="submit" value="Subscribe">
            </form>
          </div>
        </div>

        <div class="social-links">
          <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
          <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
          <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
          <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
        </div>
      </div>
    </div>

    <div class="container footer-bottom clearfix">
      <div class="copyright">
        &copy; Copyright <strong><span>Creamy</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/vlava-free-bootstrap-one-page-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${path}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${path}/resources/bootstrap/js/glightbox.min.js"></script>
  <script src="${path}/resources/bootstrap/js/isotope.pkgd.min.js"></script>
 <%--  <script src="${path}/resources/bootstrap/js/validate.js"></script> --%>
  <script src="${path}/resources/bootstrap/js/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src=${path}/resources/bootstrap/js/user_main.js"></script>

</body>

</html>