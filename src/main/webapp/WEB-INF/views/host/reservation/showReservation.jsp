<!-- 
이름 : 이시현
작성날짜 : 2021-09-16 ~ 2021-09-16 
완료된 예약서비스에 따른 예약목록 조회
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<title> 예약조회 </title>

<script type="text/javascript">
	/* showReservation페이지를 보여주는 기본함수 */
	$(function() {
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        
		$.ajax({
			url : 'completeList',  // 전송페이지 => 컨트롤러/basic1_next
			type : 'POST',						// 전송방식('GET', 'POST')
			async: false,
  			  beforeSend : function(jqXHR, settings) {
	       		  console.log("beforesend 진행");
	                 jqXHR.setRequestHeader(header, token);
	       	  },						// 요청한 데이터 형식('html', 'xml', 'json', text', 'jsoup')
			success : function(data) {			// 콜백함수 - 전송에 성공했을때의 결과(= basic1_next.jsp)가 data 변수에 전달된다.
				$('#completeList').html(data);	// .html은 innerHTML과 같다. data 변수명은 내가 임의로 정하기 나름.
			},				
			error : function() {
				alert('오류');
			}
		});
	});
	
</script>

<style type="text/css">
	a {
	text-decoration: none;
	color: black;
	font-size: bold;
	}

</style>

</head>
<body>
<!-- ------------------------------- 테이블표 시작 전 '예약조회' 설명란 시작 -->
<div class="panel-body">
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
		<div class="ibox ">
	        <div class="ibox-title">
				<h5>예약 상태가 완료된 회원의 목록을 보여줍니다.</h5>
			</div>
<!-- ------------------------------- 테이블표 시작 전 '예약조회' 설명란 끝 -->                    
          
 <!-- ------------------------------- 테이블표 시작 -->
		<div class="col-lg-12">
	    <div class="ibox ">
		
		
		<form action="showReservation" method="post">
		   <sec:csrfInput/>
           <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
           <input type="hidden" id="user_id" name="user_id" value="${mdto.user_id}">
		<div class="ibox-content">
			<div class="table-responsive">
	        <table class="table table-striped table-bordered table-hover dataTables-example">
		        <thead>
		        <tr>
		            <th style="text-align:center">예약코드</th>
		            <th style="text-align:center">회원아이디</th>
		            <th style="text-align:center">담당자</th>
		            <th style="text-align:center">상태</th>
		            <th style="text-align:center">시간</th>
		            <th style="text-align:center">날짜</th>
		               
		        </tr>
		        </thead>
		        <tbody id="completeList">
				<!-- 예약조회 목록이 있다면 -->
				<c:if test="${cnt > 0}">
					<%-- <c:if test="${dto.res_state == '서비스 완' > 0}"> --%>
					<%-- c:forEach var="작은 바구니 참조변수(임의로 지정하기)" items="${큰 바구니}" --%>
					<c:forEach var="cdto" items="${dtos}">
					
						<tr class="gradeX">
							<td style="text-align:center">
								<!-- 상세페이지 -->
								<a href="completeDetails?res_code=${dto.res_code}&res_detail_code=${cdto.res_detail_code}&user_id=${cdto.user_id}">${cdto.res_code}</a>
							</td>
							
							<td style="text-align:center">${dto.user_id}</td>
							
							<td style="text-align:center">${dto.employee_code}</td>
							
							<td style="text-align:center">${dto.res_state}</td>
							
							<td style="text-align:center">${dto.res_hour}시</td>
							
							<td style="text-align:center">${dto.res_date}</td>
						</tr>
					</c:forEach>
					<%-- </c:if> --%>
				</c:if>
				
				<!-- 예약조회 목록이 없다면, -->
				<c:if test="${cnt == 0}">
					<tr>
						<td colspan="6" align="center">
							예약요청 목록이 없습니다.
						</td>			
					</tr>
				</c:if>
		        
		        </tbody>
		        <tfoot>
		        <tr>
		            <th style="text-align:center">예약코드</th>
		            <th style="text-align:center">회원아이디</th>
		            <th style="text-align:center">담당자</th>
		            <th style="text-align:center">상태</th>
		            <th style="text-align:center">시간</th>
		            <th style="text-align:center">날짜</th>
		        </tr>
		        </tfoot>
	        </table>
	        
	        <!-- 페이지 컨트롤 -->
			<table style="width:1000px; display:block; margin:0px 0px 0px 500px;">
				<tr>
					<th id="arrow" align="center" style="font-size:18px">
						<!-- 게시글이 있다면, -->
						<c:if test="${cnt > 0}">
							
							<!-- 처음[◀︎◀︎] / 이전 블록[◀︎] /  -->
							<c:if test="${startPage > pageBlock}">
								<a href="reservation"> [◀︎◀︎] </a>
								<a href="reservation?cpageNum=${startPage - pageBlock} "> [◀︎] </a>
							</c:if>	
								
							<!-- 블록 내의 페이지 번호 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								
								<c:if test="${i != currentPage}">
									<a href="reservation?cpageNum=${i} ">[${i}]</a>
								</c:if>
							</c:forEach>
							
							<!-- 다음 블록[▶︎︎] / 마지막[▶︎▶︎︎] /  -->
							<c:if test="${pageCount > endPage}">
								<a href="reservation?cpageNum=${startPage + pageBlock} "> [▶︎︎] </a>
								<a href="reservation?cpageNum=${pageCount} "> [▶︎▶︎︎] </a>
							</c:if>
							
						</c:if>
					 </th>
				</tr>
			</table> 
            </div>
			</div>
			</form>
            </div>
			</div>
			</div>
			</div>	
		</div>	
	</div>
</div>
										
								
								

    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="js/plugins/dataTables/datatables.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- Page-Level Scripts -->
    <script>

        // Upgrade button class name
        $.fn.dataTable.Buttons.defaults.dom.button.className = 'btn btn-white btn-sm';

        $(document).ready(function(){
            $('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    { extend: 'copy'},
                    {extend: 'csv'},
                    {extend: 'excel', title: 'ExampleFile'},
                    {extend: 'pdf', title: 'ExampleFile'},

                    {extend: 'print',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');

                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                    }
                    }
                ]

            });

        });

    </script>




</body>

</html>
