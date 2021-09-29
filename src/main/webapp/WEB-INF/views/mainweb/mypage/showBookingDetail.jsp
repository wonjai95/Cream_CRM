<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
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
	<script type="text/javascript" src="${path}/resources/host/js/custBooking.js"></script>
	<script type="text/javascript">
		function deleteBooking(){		
				var isTrue = confirm("해당 예약내역을 취소하시겠습니까?");
				
				if(isTrue==true){
					alert('좋아요');
					return true;
				} else {
					return false;
				}
			}
	</script>
	
</head>
<body>

  <!-- header  -->
		<jsp:include page="../header.jsp" />

    <!-- mypage header  -->
	<jsp:include page="mypage_header.jsp" />
        
        <!-- ======= 예약내역 폼 ======= -->
         <div class="row mt-5 justify-content-center">
         	<div class="col-lg-10">
         	<!-- <form method="post" name="modifyUser" role="form" class="php-email-form"> -->
         	 	<form action="deleteBooking" method="post" id="deleteBooking" class="php-email-form">
         	 	<sec:csrfInput/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" id="res_code" name="res_code" value="${dto.res_code}">
				<input type="hidden" id="user_id" name="user_id" value="${dto.user_id}">
				<input type="hidden" id="res_state" name="res_state" value="${dto.res_state}">
				<input type="hidden" id="res_review_chk" name="res_review_chk" value="${dto.res_review_chk}">
				<input type="hidden" id="product_code" name="product_code" value="${dto.product_code}">
				<input type="hidden" id="res_detail_code" name="res_detail_code" value="${dto.res_detail_code}">
         	 	
         			<div class="member-info" style="padding-left: 5px;">
         				<span style="font-size: 20px;">
         					<b>예약내역 확인</b>
         				</span><br><br>
         				<%-- <small >예약 코드 : ${dto.res_code}</small> --%>
         				
         				<span style="font-size: 20px;">
         				<input type="hidden" id="res_code" name="res_code" value="${dto.res_code}">
         					<b>예약내역 확인</b>${dto.res_code}
         				</span>
         				<br>
         				<small>예약 상태 : ${dto.res_state}</small>
         			</div>
					
					<div class="col-lg-12 col-md-12">
                       <!-- ibox 시작 -->
                        <div class="ibox ">
                            <div class="ibox-content">
                                <div class="row">
<%-- comp_res 담당자 c:if 시작 --%>	<c:if test="${dto.comp_res eq '담당자'}">
                                   <!-- 예약 테이블 시작 -->
                                   <table class="box">
	                                    <tr>
	                                       <td><strong>날짜</strong>
	                                       <input type="hidden" id="res_code" name="res_code" value="${dto.res_code}">
		                                       <!-- 시간 -->
		                                       <div style="display:inline-block">
		                                             <button type="button" class="btn btn-outline btn-primary" class="timeBtn" style="margin: 10px"
		                                                id="res_date" name="res_date" value="${dto.res_date}">
		                                             </button>
		                                       </div>
		                                       <br><br></td>
	                                    </tr>
	                                    <tr>
	                                       <td><strong>시간</strong>
		                                       <!-- 시간 -->
		                                       <div style="display:inline-block">
		                                             <button type="button" class="btn btn-outline btn-primary" class="timeBtn" style="margin: 10px"
		                                             	name="res_hour" id="selectTime" value="${dto.res_hour}">
		                                             </button>
		                                       </div>
	                                       <br><br></td>
	                                    </tr>
	                  
	                                    <!-- 인원 -->
	                                    <tr>
	                                       <td><strong>인원 &nbsp;&nbsp;&nbsp;&nbsp;</strong>
											<div style="display:inline-block">
											<div class="col-4">
	                                                <button type="button" maxlength="4" class="form-control text-center"
	                                                	id="res_cnt" name="res_cnt" value="${dto.res_cnt}">
	                                                </button>
	                                             </div>
											</div>
											<br><br></td>
	                                    </tr>
	                                    
	                                    <!-- 담당자 -->
	                                    <tr>
	                                       <td><strong>담당자</strong>
		                                       <div style="display:inline-block">
		                                             <button type="button" class="btn btn-outline btn-primary" class="managerBtn"
		                                             		id="selectManager" name="employee_code"  value="${dto.employee_code}" style="margin: 10px">
		                                             </button>
		                                       </div>
	                                       </td>
	                                    </tr>
	                                    <tr>
	                                       <td><strong>추가 요청사항</strong>
	                                          <div class="form-group" style="margin-top:30px;">
			                                        <textarea class="form-control" rows="3"
			                                        id="res_indiv_request" name="res_indiv_request" style="margin: 10px"
	                         						${dto.res_indiv_request}>
			                                        </textarea>
	                                    	  </div>
	                                       </td>
	                                    </tr>                                    
                                 </table>                             
                                 <!-- 예약 테이블 끝 -->
                                   
                                   <!-- 상품 테이블 시작 -->
                                   <table class="box">
										<!-- 상품 -->
			                              <tr>
			                                 <td><strong>상품</strong></td>
			                              </tr>
			            
			                              <tr>
			                                 <td style="padding-bottom:0px;">
			                                    <div id="group_0" class="revgroup-selected" data-filter="*">전체 상품</div>
			                                 </td>
			                              <tr>
			                                 <td class="dashed">
			                                    <div id="product-list">
			                                       <table class="product-item" data-cat="group-0" style="width:100%; border:1px solid #ddd; padding:0px; margin-bottom:8px;">
													<tr>
														<td style="width:64px; padding:10px 0 0 0; background:#fafafa; text-align:center">
															<button type="button" class="btn btn-outline btn-primary" class="managerBtn"
																	id="product_name" name="product_name"  value="${dto.product_name}" style="margin: 10px">
															</button>
															<button type="button" class="btn btn-outline btn-primary" class="managerBtn"
																	id="product_price" name="product_price"  value="${dto.product_price}" style="margin: 10px">
														 	</button>
														</td>
													</tr>                                       
                                       			  </table>
                              
			                                       
                                    
                                             <div class="panel-heading" style="background-color: #e5e6e7; margin-top:15px; color: black">
                                              <input type="text" name="ReserveProductSum" id="ReserveProductSum" style="display: none">
                                                   	 결제금액 : <span class="productSelectedInfo">총액</span>
                                             </div>
                                          </div>
                                       </table>
                                      <!-- 상품 테이블 끝 -->
<%-- comp_res 담당자 c:if 끝 --%>         </c:if>




<%-- comp_res 호실 c:if 시작 --%>	<c:if test="${dto.comp_res eq '호실'}">
                                   <!-- 예약 테이블 시작 -->
                                   <table class="box">
	                                    <tr>
	                                       <td><strong>날짜</strong>
		                                       &nbsp;&nbsp;&nbsp;
		                                       <div style="display:inline-block">${dto.res_date}</div>
		                                       <br><br></td>
	                                    </tr>
	                                    <tr>
	                                       <td><strong>시간</strong>
		                                       &nbsp;&nbsp;&nbsp;
		                                       <div style="display:inline-block">${dto.res_hour}</div>
	                                       <br><br></td>
	                                    </tr>
	                                    
	                                    <!-- 호실 -->
										<tr>
											<td><strong>호실</strong>
												&nbsp;&nbsp;&nbsp;
												<div style="display:inline-block"><%-- ${dto.room_name} --%></div>
											<br><br></td>
										</tr>	                                    
	                  
	                                    <!-- 인원 -->
	                                    <tr>
	                                       <td><strong>인원</strong>
												&nbsp;&nbsp;&nbsp;
												<div style="display:inline-block">${dto.res_cnt}명</div>
											<br><br></td>
	                                    </tr>
	                                    
	                                    <!-- 추가 요청사항 -->
	                                    <tr>
	                                       <td><strong>추가 요청사항</strong>
	                                          <div class="form-group" style="margin-top:30px;">
			                                        <textarea class="form-control" rows="3"
			                                        id="res_indiv_request" name="res_indiv_request" style="margin: 10px"
	                         						${dto.res_indiv_request} readonly>
			                                        </textarea>
	                                    	  </div>
	                                       </td>
	                                    </tr>                                    
                                 </table>                             
                                 <!-- 예약 테이블 끝 -->
                                   
                                   <!-- 상품 테이블 시작 -->
                                   <table class="box">
										<!-- 상품 -->
			                              <tr>
			                                 <td><strong>상품</strong></td>
			                              </tr>
			            
			                              <tr>
			                                 <td style="padding-bottom:0px;">
			                                    <div id="group_0" class="revgroup-selected" data-filter="*">전체 상품</div>
			                                 </td>
			                              <tr>
			                                 <td class="dashed">
			                                    <div id="product-list">
			                                       <%-- <table class="product-item" data-cat="group-0" style="width:100%; border:1px solid #ddd; padding:0px; margin-bottom:8px;">
													<tr>
														<td style="width:64px; padding:10px 0 0 0; background:#fafafa; text-align:center">
															<button type="button" class="btn btn-outline btn-primary" class="managerBtn"
																	id="product_name" name="product_name"  value="${dto.product_name}" style="margin: 10px">
															</button>
															<button type="button" class="btn btn-outline btn-primary" class="managerBtn"
																	id="product_price" name="product_price"  value="${dto.product_price}" style="margin: 10px">
														 	</button>
														</td>
													</tr>                                       
                                       			  </table> --%>
                              
			                                       
                                    
                                             <div class="panel-heading" style="background-color: #e5e6e7; margin-top:15px; color: black">
                                              <input type="text" name="ReserveProductSum" id="ReserveProductSum" style="display: none">
                                                   	 결제금액 : <span class="productSelectedInfo">총액</span>
                                             </div>
                                          </div>
                                       </table>
                                      <!-- 상품 테이블 끝 -->
<%-- comp_res 호실 c:if 끝 --%>         </c:if>


                                   </div>
                               </div>
                           </div>
                           <!-- ibox 끝 -->
                       </div>
                        <!-- col-lg-6 끝 -->
               		
               		<!-- <div class="text-center">
		              <button type="submit" style="font-size: 16px"
		              			formaction="deleteBooking" form="deleteBooking" onclick="return deleteBooking();">
		              			예약내역 취소(이거 지금 작동됨[9.29/20:00])
					  </button>
		            </div> -->
              
         	 	</form>
         	 	
         	 	<div class="text-center">
		              <button type="submit" style="font-size: 16px"
		              			formaction="deleteBooking" form="deleteBooking" onclick="return deleteBooking();">
		              			예약내역 취소
					  </button> <!-- (이거 지금 작동됨[9.29/20:00]) -->
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

  <script src="${path}/resources/bootstrap/js/validate.js"></script>

</body>

</html>