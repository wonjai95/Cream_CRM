<!-- 
이름 : 이시현
작성날짜 : 2021-09-16 ~ 2021-09-16 
회원으로부터 예약 요청된 내용을 나타내는 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title> 예약상세정보 </title>

<script type="text/javascript">
// 예약등록 버튼을 눌러 INSERT하기
/* 	function insertReservation(){
		var qty = document.getElementById("c_quantity").value;
		var m_number = document.getElementById("m_number").value;
		m_number = document.getElementById("m_number").innerHTML;
		if(qty == 0){
			alert("수량을 입력해 주세요.");
		}else{
			var m_name = document.getElementById("m_name").innerHTML;
			var isTrue = confirm(m_name +" "+ qty + "개를 장바구니에 담으시겠습니까?");
			
			if(isTrue==true){
				window.location = 'cartPutAction.bo_od?c_quantity=' + qty + '&m_number=' + m_number;
			}
		}
	} */
	
	function insertReservation(){		
		var isTrue = confirm("해당 요청을 등록하시겠습니까?");
		
		if(isTrue==true){
			window.location = 'insertAction';
		} else {
			window.location = 'requestDetail';
		}
	}
	
	function insertReservation(){		
		var isTrue = confirm("해당 요청을 수정하시겠습니까?");
		
		if(isTrue==true){
			window.location = 'modifyAction';
		} else {
			window.location = 'requestDetail';
		}
	}
	
	function insertReservation(){		
		var isTrue = confirm("해당 요청을 취소하시겠습니까?");
		
		if(isTrue==true){
			window.location = 'deleteAction';
		} else {
			window.location = 'requestDetail';
		}
	}
	

</script>

<script type="text/javascript">

	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/requestDetail',  // 전송페이지 => 컨트롤러/basic1_next
			type : 'POST',						// 전송방식('GET', 'POST')
			dataType : {},						// 요청한 데이터 형식('html', 'xml', 'json', text', 'jsoup')
			success : function(data) {			// 콜백함수 - 전송에 성공했을때의 결과(= basic1_next.jsp)가 data 변수에 전달된다.
				$('#requestDetail').html(data);	// .html은 innerHTML과 같다. data 변수명은 내가 임의로 정하기 나름.
			},				
			error : function() {
				alert('오류');
			}
		});
	});
</script>

<script type="text/javascript" src="${path}/resources/host/js/custBooking.js"></script>
</head>
<body>

<!-- ------------------------------- 테이블표 시작 전 '예약요청' 설명란 시작 -->
<div class="panel-body">
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		    <div class="col-lg-12">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h5>예약요청건에 대해 관리합니다.</h5>
	            
	            &nbsp;&nbsp;&nbsp;
	            <button type="submit" class="btn btn-primary btn-lg"
	            		formaction="insertAction" onclick="insertReservation();">예약 등록
	            </button>
	            &nbsp;&nbsp;&nbsp;
	            <button type="button" class="btn btn-primary btn-lg"
	            		formaction="modifyAction" onclick="modifyReservation();">예약 수정
	            </button>
	            &nbsp;&nbsp;&nbsp;
	            <button type="button" class="btn btn-primary btn-lg"
	            		formaction="deleteAction" onclick="deleteReservation();">예약 취소
	            </button>
	            &nbsp;&nbsp;&nbsp;
	            <button type="button" class="btn btn-primary btn-lg"
	            		onclick="window.location='reservation'">예약요청목록
	            </button>	            
	        </div>
<!-- ------------------------------- 테이블표 시작 전 '예약등록' 설명란 끝 -->

<!-- ------------------------------- 회원정보 시작 -->
<div class="row">
<div class="col-sm-4">
<div class="ibox selected">
	<div class="ibox-content">
	    <div class="tab-content">
	        <div id="contact-1" class="tab-pane active">
	            <div class="row m-b-lg">
	                <div class="col-lg-4 text-center">
	                    <h2>강수현</h2>
	
	                    <div class="m-b-sm">
	                        <img alt="image" class="rounded-circle" src="team-2" style="width: 62px">
	                    </div>
	                </div>
	                <div class="col-lg-8">
	                    <strong>
	                        자기소개
	                    </strong>
	
	                    <p>
	                        안녕하세요. 서울 신림동에 사는 강수현입니다. 사장님이 헤어 펌 잘하신다고 여기저기 소문이 많이 나서 가입합니다.
	                        잘 부탁드려요~!
	                    </p>
	                </div>
	            </div>
	            <div class="client-detail">
	            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="full-height-scroll" style="overflow: hidden; width: auto; height: 100%;">
	
	                <strong>기본정보</strong>
	
	                <ul class="list-group clear-list">
	                    <li class="list-group-item fist-item">
	                        <span class="float-right"> 회원번호 : </span>
	                        A379647
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 이름 : </span>
	                        강수현
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 담당자 : </span>
	                        차희선
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 휴대폰 : </span>
	                        010-3355-9876
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 총 예약 : </span>
	                        1건
	                    </li>
	                </ul>
	                <strong>Notes</strong>
	                <p>
	                    만성 두피건조증이 있습니다. 무쪼록 잘 부탁드려요.
	                </p>
	                <hr>
	                
	            </div><div class="slimScrollBar" style="background-color: rgb(0, 0, 0); width: 7px; position: absolute; top: 42px; opacity: 0.4; display: none; border-top-left-radius: 7px; border-top-right-radius: 7px; border-bottom-right-radius: 7px; border-bottom-left-radius: 7px; z-index: 99; right: 1px; height: 412.88936627282493px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-top-left-radius: 7px; border-top-right-radius: 7px; border-bottom-right-radius: 7px; border-bottom-left-radius: 7px; background-color: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
	            </div>
	        </div>
	      </div>  
	    </div>    
	  </div>      
	</div>
<!-- ------------------------------- 회원정보 끝 -->
	
<!-- ------------------------------- 예약등록표 시작 -->
	<div class="col-sm-8">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h3>예약 상세</h3>
	        </div>
	        <div class="ibox-content">
				
	                <form action="" method="post" >
	                <sec:csrfInput/>
				<%-- <input type="hidden" id="res_review_chk" name="res_review_chk" value="${dto.res_review_chk}">
				<input type="hidden" id="product_code" name="product_code" value="${dto.product_code}"> --%>
	        <table class="table table-striped table-bordered table-hover dataTables-example">
		        <thead>
		        <tr>
		            <th style="text-align:center">예약코드</th>
		            <th style="text-align:center">회원아이디</th>
		            <th style="text-align:center">담당자</th>
		            <th style="text-align:center">상태</th>
		            <th style="text-align:center">시간</th>
		            <th style="text-align:center">날짜</th>
		            <th style="text-align:center">인원수</th>
		            <th style="text-align:center">특별요청</th>
		            <th style="text-align:center">상품</th>
		            <th style="text-align:center">담당자메모</th>
		            <th style="text-align:center">호실</th>
		               
		        </tr>
		        </thead>
		        <tbody id="requestDetail">
				
						<tr class="gradeX">
							<td style="text-align:center">${dto.res_code}</td>
							
							<td style="text-align:center">${dto.user_id}</td>
							
							<td style="text-align:center">${dto.employee_code}</td>
							
							<td style="text-align:center">${dto.res_state}</td>
							
							<td style="text-align:center">${dto.res_hour}시</td>
							
							<td style="text-align:center">${dto.res_date}</td>
							
									<!-- 아래부터는 예약상세 테이블 -->
							<td style="text-align:center">${dto.res_cnt}</td>
							
							<td style="text-align:center">${dto.res_indiv_request}</td>
							
							<td style="text-align:center">${dto.product_code}</td>
							
							<td style="text-align:center">${dto.res_memo}시</td>
							
							<td style="text-align:center">${dto.res_room}</td>
						</tr>
				
		        
		        </tbody>
		        <tfoot>
		        <tr>
		            <th style="text-align:center">예약코드</th>
		            <th style="text-align:center">회원아이디</th>
		            <th style="text-align:center">담당자</th>
		            <th style="text-align:center">상태</th>
		            <th style="text-align:center">시간</th>
		            <th style="text-align:center">날짜</th>
		            <th style="text-align:center">인원수</th>
		            <th style="text-align:center">특별요청</th>
		            <th style="text-align:center">상품</th>
		            <th style="text-align:center">담당자메모</th>
		            <th style="text-align:center">호실</th>
		        </tr>
		        </tfoot>
	        </table>
						</form>
		                </div>
				                
				          </div> </div>
				    </div> 
				    </div> 
				    </div> 
				    </div> 
				    </div> 
				    </div> 
<!-- ------------------------------- 예약등록표 끝 -->





<!-- Mainly scripts -->
    <script src="${path}/resources/bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="${path}/resources/bootstrap/js/popper.min.js"></script>
    <script src="${path}/resources/bootstrap/js/bootstrap.js"></script>
    <script src="${path}/resources/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${path}/resources/bootstrap/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="${path}/resources/bootstrap/js/inspinia.js"></script>
    <script src="${path}/resources/bootstrap/js/plugins/pace/pace.min.js"></script>

    <!-- iCheck -->
    <script src="${path}/resources/bootstrap/js/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            });
        </script>





</body>

</html>