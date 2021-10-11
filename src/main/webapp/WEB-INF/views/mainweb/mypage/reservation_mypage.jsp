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
  <script src="${path}/resources/user/js/review.js"></script>
  
  
  <!-- Mainly scripts -->
<script src="${path}/resources/bootstrap/js/moment.min.js"></script>
<script src="${path}/resources/bootstrap/js/popper.min.js"></script>
<script src="${path}/resources/bootstrap/js/bootstrap.js"></script>
<script src="${path}/resources/bootstrap/js/jquery.metisMenu.js"></script>
<script src="${path}/resources/bootstrap/js/jquery.slimscroll.min.js"></script>

	<!-- Custom and plugin javascript -->
<script src="${path}/resources/bootstrap/js/inspinia.js"></script>
<script src="${path}/resources/bootstrap/js/pace.min.js"></script>

  
</head>

<body>

   <!-- header  -->
		<jsp:include page="../header.jsp" />
    <!-- mypage header  -->
	<jsp:include page="mypage_header.jsp" />
        
        <!-- ======= 회원 수정 폼 ======= -->
         <div class="row mt-5 justify-content-center">
         	<div class="col-lg-10">
         	 	<div class="php-email-form">
         	 	
         		<table class="table">
         			<thead>
         				<tr>
         					<th></th>
         					<th>예약번호</th>
                            <th>매장명</th>
                            <th>예약일시</th>
                            <th>예약상태</th>
                            <th></th>
         				</tr>
         			</thead>
         			<tbody>
         			<c:forEach var="dto" items="${list}">
         				 <tr style="border-bottom: #dee2e6 1px solid;">
         				 	<td></td>	
	                     	<td>${dto.res_code}</td>
	                        <td><a href="showBookingDetail?res_code=${dto.res_code}&host_code=${dto.host_code}">${dto.comp_name}</a></td>
	                        <td> ${dto.res_date} - ${dto.res_hour} 시</td>
	                        <td> ${dto.res_state}</td>
	                        <td>
	                        	<c:if test="${dto.res_state eq '서비스 완료' || dto.res_state eq '예약완료' || dto.res_review_chk eq 'N'}">
	                        	<input type="radio" id="${dto.res_code}" name ="check_form" value="${dto.res_code}" style="display: none;" >
	                        		<a data-toggle="modal" class="btn btn-primary" href="#modal-form" onclick="check_radio('${dto.res_code}');">후기 등록</a>
	                        		 <div id="modal-form" class="modal fade" aria-hidden="true">
	                        		 <div id="basic_result">
	                        		 <form method="post" name="reviewform${dto.res_code}" role="form" action="insertReviewAction" >
	                        		 	<input type="hidden" name="res_code" value="${dto.res_code}">
	                        		 	<jsp:include page="popup_Insert.jsp" />
	                        		 </form>
	                        		 </div>
	                				</div>
	                        	</c:if>
	                        </td>
         				 </tr>
         			</c:forEach>
                    </tbody>
         		</table>
         	 </div>
         </div>
         <!-- ======= 회원 수정 폼 ======= -->

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
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


</body>

</html>