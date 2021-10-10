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
		function deleteBook() {		
				var isTrue = confirm("해당 예약내역을 취소하시겠습니까?");
				
				if(isTrue==true){
					alert('좋아요');
					window.location="deleteBooking";
				} else {
					return false;
				}
			}
	</script>
	
<!-- 	<style type="text/css">
	td {
		text-align:center;
	
	}
	</style> -->
	
	
	
	
</head>
<body>

  <!-- header  -->
		<jsp:include page="../header.jsp" />

    <!-- mypage header  -->
	<jsp:include page="mypage_header.jsp" />
        
        <!-- ======= 예약내역 폼 ======= -->
         <div class="row mt-5 justify-content-center">
         	<div class="col-lg-10">
         	<%-- <form method="post" name="modifyUser" role="form" class="php-email-form">  --%>
         	 	<form action="deleteBooking" onsubmit="return deleteBook();" method="post" id="deleteBooking" class="php-email-form">
         	 	<sec:csrfInput/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
         	 	<input type="hidden" name="res_code" value="${res_code}">
         	 	
         			<div class="member-info" style="padding-left: 5px; text-align:center;">
         				<span style="font-size: 20px;">
         					<b style="text-align:center;">예약내역 확인</b>
         				</span><br><br>
         				<c:if test="${mdto.comp_res eq '담당자'}">
	         				<small >예약 코드 :</small><strong> ${mdto.res_code} </strong> 
	         				
	         				<br>
	         				<small>예약 상태 :</small><strong> ${mdto.res_state} </strong>
         				</c:if>
         				
         				<c:if test="${rdto.comp_res eq '호실'}">
	         				<small >예약 코드 :</small><strong> ${rdto.res_code} </strong>
	         				<br>
	         				<small>예약 상태 :</small><strong> ${rdto.res_state} </strong>
         				</c:if>
         				
         			</div>
					
					<div class="col-lg-12 col-md-12">
                       <!-- ibox 시작 -->
                        <div class="ibox ">
                            <div class="ibox-content">
                                <div class="row">
<%-- comp_res 담당자 c:if 시작 --%>	<c:if test="${mdto.comp_res eq '담당자'}">
                                   <!-- 예약 테이블 시작 -->
                                   <table class="box">
	                                    <tr>
	                                       <td style="witdh:30px">
	                                       &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                                       <strong>날짜</strong>
												&emsp;
		                                       <!-- 날짜 -->
		                                       <div style="display:inline-block">${mdto.res_date}</div>
		                                       <br><br></td>
		                                       
		                                       <!-- 추가 요청사항 -->
		                                   <td style="text-align:center;" rowspan="5"><strong>추가 요청사항</strong>
	                                          <div class="form-group" style="margin-top:15px">
			                                        <textarea class="form-control" rows="8"
			                                        id="res_indiv_request" name="res_indiv_request" style="margin: 10px"
	                         						${mdto.res_indiv_request} readonly>
			                                        </textarea>
	                                    	  </div>
	                                       </td>
	                                    </tr>
	                                    <tr>
	                                       <td>
	                                       &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                                       <strong>시간</strong>
												&emsp;
		                                       <!-- 시간 -->
		                                       <div style="display:inline-block">${mdto.res_hour} 시</div>
	                                       <br><br></td>
	                                    </tr>
	                  
	                                    <!-- 인원 -->
	                                    <tr>
	                                       <td>
	                                       &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                                       <strong>인원</strong>
												&emsp;
											<div style="display:inline-block">${mdto.res_cnt} 명</div>
											<br><br></td>
	                                    </tr>
	                                    
	                                    <!-- 담당자 -->
	                                    <tr>
	                                       <td>
	                                       &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                                       <strong>담당자</strong>
												&emsp;
		                                       <div style="display:inline-block">${mdto.employee_name} <small>담당자</small></div>
	                                       <br><br></td>
	                                    </tr>
	                                    
	                                    <!-- 상품 -->
	                                    <tr>
			                                 <td>
			                                 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			                                 <strong>상품</strong>
			                                 	&emsp;
												<div style="display:inline-block">${mdto.product_name}</div>
											<br><br></td>
			                              </tr>     
                                    
                                        <!-- 결제금액 -->
	                                    <tr>
	                                       <td>
	                                       &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                                       <strong>결제금액</strong>
												&emsp;
												<div style="display:inline-block">${mdto.res_sales} 원</div>
											<br><br></td>
	                                    </tr>
									</table>                             
                                 <!-- 예약 테이블 끝 -->
<%-- comp_res 담당자 c:if 끝 --%> </c:if>




<%-- comp_res 호실 c:if 시작 --%>	<c:if test="${rdto.comp_res eq '호실'}">
                                   <!-- 예약 테이블 시작 -->
                                   <table class="box">
	                                    <!-- 날짜 -->
	                                    <tr>
	                                       <td>
	                                       &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                                       <strong>날짜</strong>
		                                       &emsp;
		                                       <div style="display:inline-block">${rdto.res_date}</div>
		                                       <br><br></td>
		                                       
		                                   <!-- 추가 요청사항 -->
		                                   <td style="text-align:center;" rowspan="5"><strong>추가 요청사항</strong>
	                                          <div class="form-group" style="margin-top:15px;">
			                                        <textarea class="form-control" rows="8"
			                                        id="res_indiv_request" name="res_indiv_request" style="margin: 10px"
	                         						${rdto.res_indiv_request} readonly>
			                                        </textarea>
	                                    	  </div>
	                                       </td> 
	                                    </tr>
	                                    
	                                    <!-- 시간 -->
	                                    <tr>
	                                       <td>
	                                       &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                                       <strong>시간</strong>
		                                       &emsp;
		                                       <div style="display:inline-block">${rdto.res_start}</div>
		                                       ~
		                                       <div style="display:inline-block">${rdto.res_end} 시</div>
	                                       <br><br></td>
	                                    </tr>
	                                    
	                                    <!-- 호실 -->
										<tr>
											<td>
											&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
											<strong>호실</strong>
												&emsp;
												<div style="display:inline-block">${rdto.room_name}</div>
											<br><br></td>
										</tr>	                                    
	                  
	                                    <!-- 인원 -->
	                                    <tr>
	                                       <td>
	                                       &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                                       <strong>인원</strong>
												&emsp;
												<div style="display:inline-block">${rdto.res_cnt}명</div>
											<br><br></td>
	                                    </tr>
	                                    
	                                    <!-- 결제금액 -->
	                                    <tr>
	                                       <td>
	                                       &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                                       <strong>결제금액</strong>
												&emsp;
												<div style="display:inline-block">${rdto.res_sales} 원</div>
											<br><br></td>
	                                    </tr>                                  
                                 </table>                             
                                 <!-- 예약 테이블 끝 -->
<%-- comp_res 호실 c:if 끝 --%>    </c:if>


                                   </div>
                               </div>
                           </div>
                           <!-- ibox 끝 -->
                       </div>
                        <!-- col-lg-6 끝 -->
               		
               		<div class="text-center">
			            <button type="submit" style="font-size: 16px">
			              			예약 취소 및 환불
						  </button>
					  <button type="button" class="btn btn-primary btn-lg"
	            		onclick="window.location='mypage_reservation'">예약내역목록
	            	  </button>
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
            <p>123, Gasan digital 2-ro, Geumcheon-gu, Seoul, Republic of Korea</p>
          </div>
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