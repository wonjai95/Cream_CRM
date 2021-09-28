<!-- 
이름 : 이시현
작성날짜 : 22021-09-19 ~ 2021-09-19
회원으로부터 예약 요청된 내용을 수정하는 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../../setting.jsp" %> --%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title> 예약수정 </title>

<link href="${path}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/resources/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="${path}/resources/bootstrap/css/custom.css" rel="stylesheet">
<link href="${path}/resources/bootstrap/css/animate.css" rel="stylesheet">
<link href="${path}/resources/bootstrap/css/style.css" rel="stylesheet">
<link href="${path}/resources/bootstrap/css/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">

</head>
<body>
<div id="wrapper">

	<!-- frame  -->
	<jsp:include page="../Frame.jsp" />
	
<div id="page-wrapper" class="gray-bg">

	<!-- nav bar  -->
	<jsp:include page="../navbar.jsp" />

<!-- ------------------------------- 중분류 '예약등록' 상단 흰색 표기란 시작 -->
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-8">
        <h2>예약요청 상세페이지</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="home">Home</a>
            </li>
            <li class="breadcrumb-item">
                예약
            </li>
            <li class="breadcrumb-item active">
                <strong>예약상세</strong>
            </li>
        </ol>
    </div>
</div>
<!-- ------------------------------- 중분류 '예약등록' 상단 흰색 표기란 끝 -->

<!-- ------------------------------- 테이블표 시작 전 '예약등록' 설명란 시작 -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
	    <div class="col-lg-12">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h5>예약요청건에 대해 관리합니다.</h5>
	            
	            &nbsp;&nbsp;&nbsp;
	            <button type="submit" class="btn btn-primary btn-lg"
	            		formaction="insertAction">예약 등록
	            </button>
	            &nbsp;&nbsp;&nbsp;
	            <button type="submit" class="btn btn-primary btn-lg"
	            		formaction="modifyAction" form="requestDetail" onclick="return modifyReservation();">예약 수정
	            </button>
	            &nbsp;&nbsp;&nbsp;
	            <button type="submit" class="btn btn-primary btn-lg"
	            		formaction="deleteAction" form="requestDetail" onclick="return deleteReservation();">예약 취소
	            </button>
	            &nbsp;&nbsp;&nbsp;
	            <button type="submit" class="btn btn-primary btn-lg"
	            		formaction="completeAction" form="requestDetail" onclick="return completeService();">서비스 완료
	            </button>
	            &nbsp;&nbsp;&nbsp;
	            <button type="button" class="btn btn-primary btn-lg"
	            		onclick="window.location='reservation'">예약요청목록
	            </button>	            
	        </div>
<!-- ------------------------------- 테이블표 시작 전 '예약등록' 설명란 끝 -->

<!-- ------------------------------- 예약 등록 시작 -->
		<!-- 서비스 완료가 실패라면, -->
		<c:if test="${updateCnt == 0}">
			<script type="text/javascript">
				alert("서비스 완료에 실패했습니다. 다시 한번 시도해주세요.");
			</script>
		</c:if>
		
		<!-- 서비스 완료가 성공이라면, -->
		<c:if test="${updateCnt != 0}">
			<script type="text/javascript">
				alert("성공적으로 서비스 완료되었습니다.");	
				window.location='reservation';
			</script>
		</c:if>
<!-- ------------------------------- 예약 등록  끝 -->
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

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
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