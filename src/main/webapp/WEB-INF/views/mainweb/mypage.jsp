<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting_user.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CRM</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  
  <!-- 내가 쓴 js  -->
  <script src="${path}/resources/user/js/modifyUser.js"></script>

  <!-- =======================================================
  * Template Name: Vlava - v4.3.0
  * Template URL: https://bootstrapmade.com/vlava-free-bootstrap-one-page-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

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
                  <li><a href="reservation">캡처</a></li>
                  <li><a href="custBooking">고객 예약</a></li>
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
          <h2>MY PAGE</h2>
        </div>
      </div>
      <div class="container">
        <div class="row mt-5 justify-content-center">

          <div class="col-lg-10">

            <div class="info-wrap">
              <div class="row">
                <div class="col-lg-4 info">
                  <i class="bi bi-geo-alt"></i>
                  <a href="home" style="align-self: center;"><h4 style="padding-top: 10px;">회원정보 수정</h4></a>
                </div>

                <div class="col-lg-4 info mt-4 mt-lg-0">
                  <i class="bi bi-envelope"></i>
                  <a href="insertPaymentInfo" style="align-self: center;"><h4 style="padding-top: 10px;">결제수단 등록</h4></a>
                </div>

                <div class="col-lg-4 info mt-4 mt-lg-0">
                  <i class="bi bi-phone"></i>
                  <a href="showBookingDetail" style="align-self: center;"><h4 style="padding-top: 10px;">예약내역 확인</h4></a>
                </div>
              </div>
            </div>
          </div>

        </div>
        
        <!-- ======= 상단 메뉴 끝 ======= -->
        
        <!-- ======= 회원 수정 폼 ======= -->
         <div class="row mt-5 justify-content-center">
         	<div class="col-lg-10">
         	 	<form method="post" name="modifyUser" role="form" class="php-email-form">
         	 	<sec:csrfInput/>
         	 	
         			<div class="member-info" style="padding-left: 5px;"><span style="font-size: 20px;"><b>기본정보 &nbsp;&nbsp;</b></span><span style="font-size: 10px;">필수입력사항</span><br><br></div>
         			<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">아이디</div>
						<div class="form-group" style="width: 30%;">
	                   		<input type="text" name="name" class="form-control" id="modify_Id" placeholder="ID" required>
	               		</div>
               		</div>
               		
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">이름</div>
						<div class="form-group" style="width: 30%;">
	                   		<input type="text" name="name" class="form-control" id="modify_name" placeholder="name" required>
	               		</div>
               		</div>
               		
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">기존 비밀번호</div>
						<div class="form-group" style="width: 30%;">
	                   		<input type="password" name="name" class="form-control" id="modify_pw" placeholder="password" required>
	               		</div>
               		</div>
               		
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">새 비밀번호</div>
						<div class="form-group" style="width: 60%; display: flex; ">
	                   		<input type="password" name="name" class="form-control" id="modify_newpw" placeholder="new_password" required style="margin-right: 3px;"> 
	                   		<input type="password" name="name" class="form-control" id="modify_repw" placeholder="re_password" required style="margin-left: 3px;">
	               		</div>
               		</div>
               		
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">생년월일</div>
						<div class="form-group" style="width: 30%; display: flex; ">
	                   		<input type="date" name="name" class="form-control" id="name" placeholder="1999.01.01" required style="margin-right: 3px;">
	               		</div>
               		</div>
               		
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">이메일</div>
						<div class="form-group" style="width: 60%; display: flex; ">
	                   		<input type="text" name="email1" class="form-control" id="name" placeholder="email" required style="margin-right: 3px;">
							<span style="padding-top: 8px; font-size: 15px;">&nbsp;@&nbsp;</span>
	                   		<input type="text" name="email2" class="form-control" id="name" placeholder="Creamy.com" required style="margin-left: 3px;">
							<select name="email3" onchange="selectEmailChk();" style="height: 43px; margin-left: 5px;">
								<option value="">이메일 선택</option> 
								<option value="gmail.com">구글</option>
								<option value="naver.com">네이버</option>
								<option value="nate.com">네이트</option>
								<option value="daum.net">다음</option>
								<option value="">직접입력</option>
							</select>
	               		</div>
               		</div>
               		
               		<div style="display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">주소</div>
						<div class="form-group" style="width: 15%; display: flex; margin-right: 20px; ">
	                   		<input type="text" name="modify_zipcode" class="form-control" id="postcode" placeholder="우편번호" required style="margin-right: 3px;">
	               		</div>
	               		<div class="form-group" style="width: 20%; display: flex;">
	                   		<button type="button" onclick="addressSearch();" >주소 확인</button>
	               		</div>
               		</div>
               		<div style="display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right"></div>
						<div class="form-group" style="width: 60%; display: flex; ">
	                   		<input type="text" name="modify_sido" class="form-control" id="sido" placeholder="sido" required style="margin-right: 3px;"> 
	                   		<input type="text" name="modify_gugun" class="form-control" id="sigungu" placeholder="sigungu" required style="margin-left: 3px;">
	               		</div>
               		</div>
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right"></div>
						<div class="form-group" style="width: 60%;">
	                   		<input type="text" name="modify_address" class="form-control" id="" placeholder="상세주소" required>
	               		</div>
               		</div>
               		
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">전화번호</div>
						<div class="form-group" style="width: 30%; display: flex; ">
	                   		<input type="text" name="modifyp_hp1" class="form-control" id="name" placeholder="010" required style="margin-right: 3px;">
							<span style="padding-bottom: 13px; font-size: 30px;">&nbsp;-&nbsp;</span>
	                   		<input type="text" name="modifyp_hp2" class="form-control" id="name" placeholder="1111" required style="margin-left: 3px;">
							<span style="padding-bottom: 13px; font-size: 30px;">&nbsp;-&nbsp;</span>
							<input type="text" name="modifyp_hp3" class="form-control" id="name" placeholder="1111" required style="margin-left: 3px;">
	               		</div>
               		</div>
               		
						
					<br><br>
					
               		<!-- ======= 추가입력 ======= -->
               		<div class="member-info" style="padding-left: 5px;"><span style="font-size: 20px;"><b>추가정보 &nbsp;&nbsp;</b></span><span style="font-size: 10px;">선택입력사항</span><br><br></div>
         			<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">성별</div>
	         	 		<div style="width: 30%;  display: flex;">
	         	 			<div class="form-group" style="width: 50%; align-items: center;">
	                   			<label><input type="radio" name="gender_radio" value="M" style="height: 15px;">&nbsp;남성</label>
	                   		</div>	
	                   	<div class="form-group" style="width: 50%; align-items : center;">
	                   			<label><input type="radio" name="gender_radio" value="F" style="height: 15px;">&nbsp;여성</label>
	               			</div>
	         	 		</div>
						
               		</div>
               		
               		<div class="text-center">
		              <button type="submit">회원정보 수정-여기이버튼은지워보기??</button>
		              <button type="submit">탈퇴</button>
		            </div>
              
         	 	</form>
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


</body>

</html>