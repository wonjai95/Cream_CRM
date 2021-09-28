<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../setting_user.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>selectHost</title>    
<script type="text/javascript" src="${path}/resources/host/js/selectHost.js"></script>
</head>
<body>

  	<!-- header  -->
	<jsp:include page="header.jsp" />
<!-- ======= 상단 메뉴 ======= -->
    <section id="contact" class="contact section-bg">
      <div class="container">

        <div class="section-title" style="padding-bottom: 0px; padding-top: 50px;">
          <h2>매장 선택</h2>
        </div>
      </div>
      <div class="container">
        <div class="row mt-5 justify-content-center">
          <div class="col-lg-10">
            <div class="info-wrap">
              <div class="row">
                <div class="col-lg-4 info">
	                <sec:csrfInput/>
	                <div class="form-group">
	                    <input type="text" placeholder="검색어 입력" 
	                    	class="form-control" name="top-search" id="top-search">
	                </div>
                </div>
              </div>
            </div>
            </div>
            </div>
	
 <!-- ======= 회원 수정 폼 ======= -->
         <div class="row mt-5 justify-content-center">
         	<div class="col-lg-10">
         	 	<form method="post" name="modifyform" role="form" class="php-email-form">
         	 		<sec:csrfInput/>
         	 	 <div class="row" id="hostList">
			        	<c:forEach var="dto" items="${dtos}">
				            <div class="col-lg-4">
				                <div class="contact-box">
				                    <a class="row" href="custBooking?host_code=${dto.host_code}&comp_address=${dto.comp_address}&comp_res=${dto.comp_res}" 
				                    	style="justify-content: center;">
					                    <div class="col-8" style="text-align: center;">
					                        <h3><strong>${dto.comp_name}</strong></h3>
					                        <p>${dto.host_name}</p>
					                        <address>
					                           <i class="fa fa-map-marker"></i> <strong>${dto.comp_address}</strong><br>
					                                                                      우편번호 : ${dto.zipcode}<br>
					                            	전화 : ${dto.host_ph}<br>
					                        </address>
					                    </div>
				                    </a>
				                </div>
				            </div>
		 				</c:forEach>
	 				</div>
	            </form>
         	 </div>
         </div>

      </div>
    </section><!-- End Contact Section -->





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



</body>
</html>


<%--      --%>