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
  
   <!-- 내가 쓴 css/js  -->
   <link href="${path}/resources/user/css/table_style2.css" rel="stylesheet">
  <script src="${path}/resources/user/js/review.js"></script>
  
  <script type="text/javascript">
  
  function check_starpoint(star){
		 var radio = document.getElementsByName('star');
			
			
			for( i=0; i<radio.length; i++ ) {
				if(radio[i].value == star) {
					radio[i].checked = true;
				}
			}
		 
	 }
  
  </script>
  
 
  
</head>

<body onload="check_starpoint(${vo.star});">

  <!-- header  -->
		<jsp:include page="../header.jsp" />

      <!-- ======= 상단 메뉴 ======= -->
		    <section id="contact" class="contact section-bg">
		      <div class="container">
		        <div class="section-title" style="padding-bottom: 0px; padding-top: 50px;">
		          <h2>REVIEW</h2>
		        </div>
		      </div>
		      <div class="container">
		        
		        <!-- ======= 상단 메뉴 끝 ======= -->
		        
		        <!-- ======= 회원 수정 폼 ======= -->
		        <div class="php-email-form">
		        
		        <form method="post">
		         <div class="row mt-5 justify-content-center">
		         	<div class="col-lg-10">
		         	 	
		         	 	<div style="display: flex; margin-left: 0px;">
		         	 	<div style="width: 100%;">
		         	 	<input type="hidden" name="img_url" value="0">
		         	 	<input type="hidden" name="check_page" value="${check_page}">
		         	 	<input type="hidden" name="review_code" value="${vo.review_code}">
		         	 	<sec:csrfInput/>
		         	 	
		         	 		<div style="padding-bottom: 9px; display: flex; justify-content: flex-end; ">
			         	 		<div style=" padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 10%; width: 85%;  " align="right ">
			         	 			<small style="color: gray;">	
			         	 			작성자 : ${sessionScope.name} &ensp; 작성일 : ${vo.regDate}</small>
			         	 		</div>
									
		               		</div>
		         			<div style="padding-bottom: 9px; display: flex;">
			         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 13%" align="right">제목</div>
								<div class="form-group" style="width: 85%;">
			                   		<input type="text" name="title" class="form-control" id="modify_Id" value="${vo.title}" disabled>
			               		</div>
		               		</div>
		               		
		               		<div style="padding-bottom: 9px; display: flex;">
			         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width:13%" align="right">본문</div>
								<div class="form-group" style="width: 85%;">
			                   		<textarea name="contents" rows="10" cols="10" required style="width: 100%; border: 1px solid #ced4da; resize: none;" disabled> ${vo.content}</textarea>
			               		</div>
		               		</div>
		               		
		               		<input type="hidden" name ="star_v" value="0">
		               		<div style="padding-bottom: 9px; display: flex;">
			         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 13%" align="right">별점</div>
								<div class="form-group" style="width: 85%;">
									<div class="startRadio">
									  <label class="startRadio__box">
									    <input type="radio" name="star" id="1" value="1" disabled>
									    <span class="startRadio__img"><span class="blind">별 1.5개</span></span>
									  </label>
									  <label class="startRadio__box">
									    <input type="radio" name="star" id="2" value="2" disabled>
									    <span class="startRadio__img"><span class="blind">별 2.5개</span></span>
											  </label>
									  <label class="startRadio__box">
									    <input type="radio" name="star" id="3" value="3" disabled>
									    <span class="startRadio__img"><span class="blind">별 3.5개</span></span>
											  </label>
									  <label class="startRadio__box">
									    <input type="radio" name="star" id="4" value="4" disabled>
									    <span class="startRadio__img"><span class="blind">별 4.5개</span></span>
											  </label>
									  <label class="startRadio__box">
									    <input type="radio" name="star" id="5" value="5" disabled>
									    <span class="startRadio__img"><span class="blind">별 5.5개</span></span>
									 </label>
									</div>
								</div>
      		       		  		</div>
       		        		
       		      		  				
							<br><br>
					
      		         		<!-- ======= 추가입력 ======= -->
      		         		<div align="center">
	      		         		<div class="member-info" style="padding-left: 5px;"><span style="font-size: 20px;"><b>이미지 &nbsp;&nbsp;</b></span>
	               					<br><br>
	               				</div>
			                   	<img id="stock_img" alt="사진" src="images/main/${vo.review_img}" style="width: 400px; height : 400px;">
	 		       		 	 </div>
       		        		
      		         		<div class="text-center" style="margin-top: 30px;">
      		         		<c:if test="${sessionScope.id eq vo.user_id}">
	      		         		<c:if test="${check_page eq 'my'}">
	      		         		<button type="submit" formaction="modify_review" >후기 수정</button>
	      		         		<!-- <button type="submit" formaction="delete_review">후기 삭제</button> -->
			              		<button type="button" onclick="location.href='my_review'">목록으로</button>
			              		</c:if>
			              		<c:if test="${check_page eq 'all'}">
			              		<button type="submit" formaction="modify_review" >후기 수정</button>
			              		<!-- <button type="submit" formaction="delete_review">후기 삭제</button> -->
			              		<button type="button" onclick="location.href='review_main'">목록으로</button>
			              		</c:if>
		              		</c:if>
		              		<c:if test="${sessionScope.id ne vo.user_id}">
	      		         		<c:if test="${check_page eq 'my'}">
			              		<button type="button" onclick="location.href='my_review'">목록으로</button>
			              		</c:if>
			              		<c:if test="${check_page eq 'all'}">
			              		<button type="button" onclick="location.href='review_main'">목록으로</button>
			              		</c:if>
		              		</c:if>
		 		       		    </div>
		  		          
		 		      		    </div>
		  				            </div>
         	 </div>
         	
         </div>
          </form>
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