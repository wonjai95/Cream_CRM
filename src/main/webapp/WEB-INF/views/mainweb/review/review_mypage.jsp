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
  
  <link href="${path}/resources/user/css/table_style.css" rel="stylesheet">
  
  <!-- 내가 쓴 js  -->

</head>

<body>

 <!-- header  -->
		<jsp:include page="../header.jsp" />
		
		<!-- mypage header  -->
	<jsp:include page="../mypage/mypage_header.jsp" />

        
        <!-- ======= 회원 수정 폼 ======= -->
         <div class="row mt-5 justify-content-center">
         	<div class="col-lg-10">
         	 	<form method="post" name="modifyUser" role="form" class="php-email-form">
         	 	<sec:csrfInput/>
         	 	
         		<table class="table">
         			<thead>
         				<tr>
         					<th>#</th>
                            <th>글 제목</th>
                            <th>등록일</th>
                            <th>조회수</th>
         				</tr>
         			</thead>
         			<tbody>
         			<c:forEach var="vo" items="${list}">
	         			<tr style="border-bottom: #dee2e6 1px solid;">
	                     	<td>${vo.review_code}</td>
	                         <td><a href="ReviewDetail?review_code=${vo.review_code}&check_page=my" class="client-link">${vo.title}</a></td>
	                         <td> ${vo.regDate}</td>
	                         <td> &nbsp;&nbsp;&nbsp;${vo.readCnt}</td>
	                     </tr>
         			</c:forEach>
                    </tbody>
         		</table>
              
         	 	</form>
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