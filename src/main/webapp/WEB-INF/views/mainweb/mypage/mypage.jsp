<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting_user.jsp" %>
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

</head>

<body>

  <!-- header  -->
		<jsp:include page="../header.jsp" />

    <!-- mypage header  -->
	<jsp:include page="mypage_header.jsp" />
        
        <!-- ======= 회원 수정 폼 ======= -->
         <div class="row mt-5 justify-content-center">
         	<div class="col-lg-10">
         	 	<form method="post" name="modifyform" role="form" class="php-email-form">
         	 	<input type="hidden" name ="pwChk" value="${vo.user_password}">
         	 	<input type="hidden" name ="newpw" value="">
         	 	<sec:csrfInput/>
         	 	
         			<div class="member-info" style="padding-left: 5px;"><span style="font-size: 20px;"><b>기본정보 &nbsp;&nbsp;</b></span><span style="font-size: 10px;">필수입력사항</span><br><br></div>
         			<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">아이디</div>
						<div class="form-group" style="width: 30%;">
	                   		<input type="text" name="modify_Id" class="form-control" id="modify_Id" value="${vo.user_id}" disabled>
	               		</div>
               		</div>
               		
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">이름</div>
						<div class="form-group" style="width: 30%;">
	                   		<input type="text" name="modify_name" class="form-control" id="modify_name" value="${vo.user_name}" required>
	               		</div>
               		</div>
               		
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">기존 비밀번호</div>
						<div class="form-group" style="width: 30%;">
	                   		<input type="password" name="modify_pw" class="form-control" id="modify_pw" placeholder="current-password" required>
	               		</div>
               		</div>
               		
               		<div style="display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">새 비밀번호</div>
						<div class="form-group" style="width: 60%; display: flex; ">
	                   		<input type="password" name="modify_newpw" class="form-control" id="modify_newpw" placeholder="new-password" required style="margin-right: 3px;" value=""> 
	                   		<input type="password" name="modify_repw" class="form-control" id="modify_repw" placeholder="new-password" required style="margin-left: 3px;">
	               		</div>
               		</div>
               		<div id ="div_PWD_eqChk" style="display: none;">
               			<div style="display: flex;">
               			<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right"></div>
               			<div><span style="color: red;">! 새 비밀번호를 확인하세요</span></div>
               			</div>
               		</div>
               		<div id ="div_PWD_matchChk" style="display: none;">
               			<div style="display: flex;">
               			<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right"></div>
               			<div><span style="color: red;">! 기존 비밀번호가 다릅니다.</span></div>
               			</div>
               		</div>
               		
               		<div style="padding-top: 9px; padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">생년월일</div>
						<div class="form-group" style="width: 30%; display: flex; ">
	                   		<input type="date" name="modify_birth" class="form-control" id="modify_birth" value="${vo.user_birth}" required style="margin-right: 3px;">
	               		</div>
               		</div>
               		
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">이메일</div>
						<div class="form-group" style="width: 60%; display: flex; ">
	                   		<input type="text" name="email1" class="form-control" id="modify_email1" value="stopgin13" required style="margin-right: 3px;">
							<span style="padding-top: 8px; font-size: 15px;">&nbsp;@&nbsp;</span>
	                   		<input type="text" name="email2" class="form-control" id="modify_email2" value="gmail.com" required style="margin-left: 3px;">
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
	                   		<input type="text" name="modify_zipcode" class="form-control" id="postcode" value="${zipcode_vo.zipcode}" required style="margin-right: 3px;">
	               		</div>
	               		<div class="form-group" style="width: 20%; display: flex;">
	                   		<button type="button" onclick="addressSearch();" >주소 확인</button>
	               		</div>
               		</div>
               		<div style="display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right"></div>
						<div class="form-group" style="width: 60%; display: flex; ">
	                   		<input type="text" name="modify_sido" class="form-control" id="sido" value="${zipcode_vo.sido}" required style="margin-right: 3px;"> 
	                   		<input type="text" name="modify_gugun" class="form-control" id="sigungu" value="${zipcode_vo.gugun}" required style="margin-left: 3px;">
	               		</div>
               		</div>
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right"></div>
						<div class="form-group" style="width: 60%;">
	                   		<input type="text" name="modify_address" class="form-control" id="" value="${vo.user_address}" required>
	               		</div>
               		</div>
               		
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">전화번호</div>
						<div class="form-group" style="width: 30%; display: flex; ">
	                   		<input type="text" name="modifyp_hp1" class="form-control" id="modifyp_hp1" value="${hp[0]}" required style="margin-right: 3px;">
							<span style="padding-bottom: 13px; font-size: 30px;">&nbsp;-&nbsp;</span>
	                   		<input type="text" name="modifyp_hp2" class="form-control" id="modifyp_hp2" value="${hp[1]}" required style="margin-left: 3px;">
							<span style="padding-bottom: 13px; font-size: 30px;">&nbsp;-&nbsp;</span>
							<input type="text" name="modifyp_hp3" class="form-control" id="modifyp_hp3" value="${hp[2]}" required style="margin-left: 3px;">
	               		</div>
               		</div>
               		<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">성별</div>
	         	 		<div style="width: 30%;  display: flex;">
	         	 			<c:if test="${vo.user_gender eq 'M'}">
		         	 			<div class="form-group" id="g0" style="width: 30%; align-items: center; border: 2px solid green; text-align: center;">
		                   			<label><input type="radio" name="gender_radio" value="M" style="height: 15px; display: none;" onchange="colorchange(0);">남성</label>
		                   		</div>	
		                   		<div class="form-group" id="g1" style="width: 30%; align-items : center;  text-align: center;">
		                   			<label><input type="radio" name="gender_radio" value="F" style="height: 15px; display: none;" onchange="colorchange(1);">여성</label>
		               			</div>
	               			</c:if>
	               			<c:if test="${vo.user_gender eq 'F'}">
		         	 			<div class="form-group" id="g2" style="width: 30%; align-items: center;  text-align: center;">
		                   			<label><input type="radio"  name="gender_radio" value="M" style="height: 15px; display: none;" onchange="colorchange(2);">남성</label>
		                   		</div>	
		                   		<div class="form-group" id="g3" style="width: 30%; align-items : center; border: 2px solid green;  text-align: center;">
		                   			<label><input type="radio" name="gender_radio" value="F" style="height: 15px; display: none;" onchange="colorchange(3);">여성</label>
		               			</div>
	               			</c:if>
	         	 		</div>
	         	 	</div>
               		
						
					<br><br>
					
               		<!-- ======= 추가입력 ======= -->
               		<div class="member-info" style="padding-left: 5px;"><span style="font-size: 20px;"><b>추가정보 &nbsp;&nbsp;</b></span><span style="font-size: 10px;">선택입력사항</span><br><br></div>
         			<!-- <div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 20%" align="right">성별</div>
	         	 		<div style="width: 30%;  display: flex;">
	         	 			<div class="form-group" style="width: 50%; align-items: center;">
	                   			<label><input type="radio" name="gender_radio" value="M" style="height: 15px;">&nbsp;남성</label>
	                   		</div>	
	                   		<div class="form-group" style="width: 50%; align-items : center;">
	                   			<label><input type="radio" name="gender_radio" value="F" style="height: 15px;">&nbsp;여성</label>
	               			</div>
	         	 		</div>
	         	 		<div class="form-group" style="display: none;">
	                   			<input type="radio" name="gender_radio" value="N" style="height: 15px;" checked>
	               			</div>
	         	 		</div> -->
               		
               		<div class="text-center">
		              <button type="button" onclick="modifyInfo_Check(1);">회원정보 수정</button>
		              <button type="submit">탈퇴</button>
		            </div>
		            
		            </form>
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


</body>

</html>