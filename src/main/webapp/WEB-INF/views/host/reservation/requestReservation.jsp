<!-- 
이름 : 이시현
작성날짜 : 2021-09-16 ~ 2021-09-16 
회원으로부터 요청된 예약서비스를 받고 취합하여 관리하는 페이지
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

<title> 예약요청 </title>

<script type="text/javascript">
	/* requestReservation페이지를 보여주는 기본함수 */
	
	$(function() {
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        
		$.ajax({
			url : 'requestList',  // 전송페이지 => 컨트롤러/basic1_next
			type : 'POST',						// 전송방식('GET', 'POST')
			async: false,	
  			  beforeSend : function(jqXHR, settings) {
	       		  console.log("beforesend 진행");
	                 jqXHR.setRequestHeader(header, token);
	       	  },						// 요청한 데이터 형식('html', 'xml', 'json', text', 'jsoup')
			success : function(data) {			// 콜백함수 - 전송에 성공했을때의 결과(= basic1_next.jsp)가 data 변수에 전달된다.
				$('#requestList').html(data);	// .html은 innerHTML과 같다. data 변수명은 내가 임의로 정하기 나름.
			},				
			error : function() {
				alert('오류');
			}
		});
	});
	
	
// 검색기능 함수
$("document").ready(function() {	
	
	$("select[name=res_state]").change(function(){
		
		var selectState = $("select[name=res_state] option:selected").val();
		console.log("selectState : " + selectState);
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        console.log("header : " + header);
        
         $.ajax({
	       	  url : '${pageContext.request.contextPath}/requestReservation',
	       	  type : "Post",
	       	  data : "res_state=" + selectState,
       	  	  async: false,	
  			  beforeSend : function(jqXHR, settings) {
	       		  console.log("beforesend 진행");
	                 jqXHR.setRequestHeader(header, token);
	       	  },
	       	  success : function(result) {
	       		  $("#requestList").html(result);
	       	  },
	       	  error : function(error) {
	       		console.log(error);  
	       	  }
         });
	})
	
	$("#Search_content").keyup(function(){
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
		var content = $("#Search_content").val();
		console.log("content : " + content);
		
		$.ajax({
	       	  url : '${pageContext.request.contextPath}/requestReservation',
	       	  type : "Post",
	       	  data : "res_state=" + content,
     	  	  async: false,	
			  beforeSend : function(jqXHR, settings) {
	       		  console.log("beforesend 진행");
	                 jqXHR.setRequestHeader(header, token);
	       	  },
	       	  success : function(result) {
	       		  $("#requestList").html(result);
	       	  },
	       	  error : function(error) {
	       		console.log(error);  
	       	  }
       });
	})
	
	
	
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
<!-- ------------------------------- 테이블표 시작 전 '예약요청' 설명란 시작 -->
<div class="panel-body">
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
	    <div class="col-lg-12">
	        <div class="ibox-title">
	            <h5>예약요청 목록을 보여줍니다. 예약코드를 선택해 관리해보세요.</h5>           
	        </div>
	    </div>
<!-- ------------------------------- 테이블표 시작 전 '예약요청' 설명란 끝 -->

<!-- ------------------------------- 테이블표 시작 전 '예약요청' 검색창 시작 -->
		<div class="col-sm-5 m-b-xs" style="width: 30%; ">
			<select class="form-control-sm form-control input-s-sm inline" name="res_state" style="width: 80%; ">
				<option value="0">예약상태</option>
				<option value="예약완료">예약완료</option>
				<option value="예약취소">예약취소</option>
			</select>
			<input type="hidden" name="res_state">
		</div>
		
		<div class="col-sm-3" style="width: 40%; ">
			<div class="input-group">
			<input placeholder="검색어" type="text" id="Search_content" class="form-control form-control-sm">
			<%-- <input type="text" id="res_code" name="res_code" value="${dto.res_code}" class="form-control"> --%>
				<span class="input-group-append"> 
					<input type="button" class="btn btn-sm btn-primary" id="Search_btn" value="검색">
				</span>
			</div>
		</div>
		
<!-- ------------------------------- 테이블표 시작 전 '예약요청' 검색창 끝 -->

<!-- ------------------------------- 테이블표 시작 -->
		<div class="col-lg-12">
	    <div class="ibox ">
		
		
		<form action="requestReservation" method="post">
		   <sec:csrfInput/>
           <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
           <input type="hidden" id="user_id" name="user_id" value="${user_id}">
           <input type="hidden" id="comp_res" name="comp_res" value="${mdtos.comp_res}">
		<div class="ibox-content">
			<div class="table-responsive">
	        <table class="table table-striped table-bordered table-hover dataTables-example">
		        <thead>
		        
		        <tr>
		            <th style="text-align:center">예약코드</th>
		            <th style="text-align:center">회원아이디</th>
		            <%-- <c:if test="${comp_res eq '담당자'}"> --%>
		            <th style="text-align:center">담당자</th>
		            <%-- </c:if> --%>
		            <%-- <c:if test="${comp_res eq '호실'}"> --%>
		            <!-- <th style="text-align:center">호실12</th> -->
		            <%-- </c:if> --%>
		            <th style="text-align:center">상태</th>
		            <th style="text-align:center">시간</th>
		            <th style="text-align:center">날짜</th>
		               
		        </tr>
		        
		        </thead>
		        <tbody id="requestList">
				<!-- 예약조회 목록이 있다면 -->
				<c:if test="${cnt > 0}">
					<%-- <c:if test="${dto.res_state == '서비스 완' > 0}"> --%>
					<%-- c:forEach var="작은 바구니 참조변수(임의로 지정하기)" items="${큰 바구니}" --%>
					<c:forEach var="dto" items="${dtos}">
						
						<tr class="gradeX">
							<td style="text-align:center">
								<!-- 상세페이지 -->
								<a href="requestDetails?res_code=${dto.res_code}&res_detail_code=${dto.res_detail_code}&user_id=${dto.user_id}">${dto.res_code}</a>
							</td>
							
							<td style="text-align:center">${dto.user_id}</td>
							<%-- ${param.dto.user_id} --%>
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
						<c:if test="${sessionScope.code == dto.host_code}">
						<c:if test="${cnt > 0}">
							
							<!-- 처음[◀︎◀︎] / 이전 블록[◀︎] /  -->
							<c:if test="${startPage > pageBlock}">
								<a href="reservation"> [◀︎◀︎] </a>
								<a href="reservation?pageNum=${startPage - pageBlock} "> [◀︎] </a>
							</c:if>	
								
							<!-- 블록 내의 페이지 번호 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								
								<c:if test="${i != currentPage}">
									<a href="reservation?pageNum=${i} ">[${i}]</a>
								</c:if>
							</c:forEach>
							
							<!-- 다음 블록[▶︎︎] / 마지막[▶︎▶︎︎] /  -->
							<c:if test="${pageCount > endPage}">
								<a href="reservation?pageNum=${startPage + pageBlock} "> [▶︎︎] </a>
								<a href="reservation?pageNum=${pageCount} "> [▶︎▶︎︎] </a>
							</c:if>
							
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
<!-- ------------------------------- 테이블표 끝 -->

</body>
</html>