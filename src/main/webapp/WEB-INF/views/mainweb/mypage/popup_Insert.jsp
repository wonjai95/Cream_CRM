<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting_user.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>

 <!--make  -->
    <link href="${path}/resources/user/css/table_style.css" rel="stylesheet">

<body>

  <div class="modal-dialog">
      <div class="modal-content" style="width: 150%; position:relative; left: -20%; ">
          <div class="modal-body" >

		    <!-- ======= 상단 메뉴 ======= -->
		    <section id="contact" class="contact section-bg">
		      <div class="container">
		        <div class="section-title" style="padding-bottom: 0px; padding-top: 50px;">
		          <h2>ADD REVIEW</h2>
		        </div>
		      </div>
		      <div class="container">
		        
		        <!-- ======= 상단 메뉴 끝 ======= -->
		        
		        <!-- ======= 회원 수정 폼 ======= -->
		         <div class="row mt-5 justify-content-center">
		         	<div class="col-lg-10">
		         	 	
		         	 	<div style="display: flex; margin-left: 0px;">
		         	 	<div style="width: 100%;">
		         	 	<input type="hidden" name="img_url" value="0">
		         	 	<input type="hidden" name="res_code" value="${res_code}">
		         	 	<sec:csrfInput/>
		         	 	
		         	 		<div style="padding-bottom: 9px; display: flex; justify-content: flex-end; ">
			         	 		<div style=" padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 10%; width: 85%;  " align="right ">
			         	 			<small style="color: gray;">	
			         	 			작성자 : ${sessionScope.name} &ensp; 작성일 : ${today}</small>
			         	 		</div>
									
		               		</div>
		         			<div style="padding-bottom: 9px; display: flex;">
			         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 13%" align="right">제목</div>
								<div class="form-group" style="width: 85%;">
			                   		<input type="text" name="title" class="form-control" id="modify_Id" placeholder="Title" required>
			               		</div>
		               		</div>
		               		
		               		<div style="padding-bottom: 9px; display: flex;">
			         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width:13%" align="right">본문</div>
								<div class="form-group" style="width: 85%;">
			                   		<textarea name="contents" rows="10" cols="10" required style="width: 100%; border: 1px solid #ced4da;" placeholder="contents"></textarea>
			               		</div>
		               		</div>
		               		
		               		<input type="hidden" name ="star_v" value="0">
		               		<div style="padding-bottom: 9px; display: flex;">
			         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 13%" align="right">별점</div>
								<div class="form-group" style="width: 85%;">
									<div class="startRadio">
									  <label class="startRadio__box">
									    <input type="radio" name="star" id="1" value="1" onclick="changestar(1);">
									    <span class="startRadio__img"><span class="blind">별 1.5개</span></span>
									  </label>
									  <label class="startRadio__box">
									    <input type="radio" name="star" id="2" value="2" onclick="changestar(2);">
									    <span class="startRadio__img"><span class="blind">별 2.5개</span></span>
											  </label>
									  <label class="startRadio__box">
									    <input type="radio" name="star" id="3" value="3" onclick="changestar(3);">
									    <span class="startRadio__img"><span class="blind">별 3.5개</span></span>
											  </label>
									  <label class="startRadio__box">
									    <input type="radio" name="star" id="4" value="4" onclick="changestar(4);">
									    <span class="startRadio__img"><span class="blind">별 4.5개</span></span>
											  </label>
									  <label class="startRadio__box">
									    <input type="radio" name="star" id="5" value="5" onclick="changestar(5);">
									    <span class="startRadio__img"><span class="blind">별 5.5개</span></span>
									 </label>
									</div>
								</div>
      		       		  		</div>
       		        		
       		      		  				
							<br><br>
					
      		         		<!-- ======= 추가입력 ======= -->
      		         		<div class="member-info" style="padding-left: 5px;"><span style="font-size: 20px;"><b>파일추가 &nbsp;&nbsp;</b></span>
               		<span style="font-size: 10px;">선택입력사항 - 최대 1장의 이미지 등록 가능</span><br><br></div>
 		        			<div style="padding-bottom: 9px; display: flex;">
	         	 		<div style="padding-left: 5px; padding-bottom: 8px; align-self: center; padding-right: 25px; width: 15%" align="right"		>이미지</div>
	         	 		<div style="width: 30%;  displa		y: flex;">
	         	 			<div class="form-group" style="width: 50%; align-items:	center;">
	                   			<input name="file_name" class="fileinput" type="file" accept="image/*" onchange="insertImg(this);">
	                   			<img id="stock_img" alt="사진" src="images/main/background.png" style="width: 400px; height : 400px;">
	                  		 		</div>	
	         			 		</div>
	 		       		 	 	</div>
       		        		
      		         		<div class="text-center">
		              <button type="submit">후기 등록</button>
		              <button type="button" onclick="location.href='mypage_reservation'">취소</button>
		 		       		    </div>
		  		          
		 		      		    </div>
		  				            </div>
         	 </div>
         </div>

      </div>
    </section><!-- End Contact Section -->
    
    </div>
    </div>
    </div>


</body>

</html>