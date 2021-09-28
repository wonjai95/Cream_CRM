<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userStatics</title>
  	<link href="${path}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path}/resources/bootstrap/css/font-awesome.css" rel="stylesheet">

    <!-- c3 Charts -->
    <link href="${path}/resources/bootstrap/css/c3/c3.min.css" rel="stylesheet">

    <link href="${path}/resources/bootstrap/css/animate.css" rel="stylesheet">
    <link href="${path}/resources/bootstrap/css/style.css" rel="stylesheet">
<style type="text/css">
#p_group {
	display: flex;
}
</style>

  <!-- Mainly scripts -->
  <script src="${path}/resources/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="${path}/resources/bootstrap/js/popper.min.js"></script>
  <script src="${path}/resources/bootstrap/js/bootstrap.js"></script>
  <script src="${path}/resources/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>
  <script src="${path}/resources/bootstrap/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

  <!-- Custom and plugin javascript -->
  <script src="${path}/resources/bootstrap/js/inspinia.js"></script>
  <script src="${path}/resources/bootstrap/js/plugins/pace/pace.min.js"></script>

  <!-- d3 and c3 charts -->
  <script src="${path}/resources/bootstrap/js/plugins/d3/d3.min.js"></script>
  <script src="${path}/resources/bootstrap/js/plugins/c3/c3.min.js"></script>

<script type="text/javascript">
	function addProduct() {
		var url = "addProduct";
		window.open(url, "상품추가",
						"width=700, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
</script>
</head>
<body>
<div id="wrapper">

	<!-- frame  -->
	<jsp:include page="../Frame.jsp" />

	<div id="page-wrapper" class="gray-bg">
		<!-- nav bar  -->
		<jsp:include page="../navbar.jsp" />
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-8">
				<h2>상품</h2>
			</div>
		</div>

		<div class="wrapper wrapper-content animated fadeInRight ecommerce">

			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<ul class="nav nav-tabs">
							<li><a class="nav-link active" data-toggle="tab"
								href="#tab-1">월별 인원 현황</a></li>
							<li><a class="nav-link" data-toggle="tab" href="#tab-2">유입 경로</a></li>
							<li><a class="nav-link" data-toggle="tab" href="#tab-3">회원 분포</a></li>
						</ul>
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="ibox-content m-b-sm border-bottom">
										<div class="row">
											<div class="col-sm-2">
												<div class="form-group">
													<select name="" id="" class="form-control">
														<option value="1" selected="">판매 여부</option>
														<option value="2">판매중</option>
														<option value="3">판매중지</option>
													</select>
												</div>
											</div>

											<div class="col-sm-2">
												<div class="form-group">
													<select name="" id="" class="form-control">
														<option value="1" selected="">판매 형태</option>
														<option value="2">기간제</option>
														<option value="3">대여형</option>
													</select>
												</div>
											</div>

											<div class="col-sm-2">
												<div class="form-group">
													<input type="text" id="" name="" value=""
														placeholder="검색어" class="form-control">
												</div>
											</div>

											<div class="col-sm-2">
												<div class="form-group">
													<button class="btn btn-primary dim" type="button">검색</button>
												</div>
											</div>
										</div>
									</div>

									<fieldset>
										<div class="wrapper wrapper-content">
											<!-- row 시작 -->
											<div class="row">
												<div class="col-lg-6">
								                    <div class="ibox ">
								                        <div class="ibox-title">
								                            <h5>회원정보</h5>
								                            <div class="ibox-tools">
								                            </div>
								                        </div>
								                        <div class="ibox-content">
															<form action="" name="">
								                            <table id="rowClick" class="table table-hover" data-page-size="15">
																<thead>
													            <tr>
													                <th>회원코드</th>
													                <th>회원명</th>
													                <th>생년월일</th>
													                <th>성별</th>
													                <th>연락처</th>
													            </tr>
													            </thead>
													            
													            <tbody>
													            <c:forEach var="dto" items="${dto}" varStatus="status">
														            <tr >
														                <td id="user_code${status.index}">${dto.user_code}<input type="hidden" name="user_code${status.index}" value="${dto.user_code}"></td>
														                <td id="user_name${status.index}">${dto.user_name}<input type="hidden" name="user_name${status.index}" value="${dto.user_name}"></td>
														                <td id="user_birth${status.index}">${dto.user_birth}<input type="hidden" name="user_birth${status.index}" value="${dto.user_birth}"></td>
														                <td id="user_gender${status.index}">${dto.user_gender}<input type="hidden" name="user_gender${status.index}" value="${dto.user_gender}"></td>
														                <td id="user_address${status.index}">${dto.user_address}<input type="hidden" name="user_address${status.index}" value="${dto.user_address}"></td>
														            </tr>
														        </c:forEach>
													            </tbody>
															</table>
															</form>
								                        </div>
								                    </div>
								                </div>
								                <div class="col-lg-6">
								                    <div class="ibox ">
								                        <div class="ibox-title">
								                            <h5>Line Chart Example
								                                <small>With custom colors.</small>
								                            </h5>
								                        </div>
								                        <div class="ibox-content">
								                            <div>
								                                <!-- <div id="lineChart"></div> -->
								                                <div id="gauge"></div>
								                                
								                                
								                            </div>
								                        </div>
								                    </div>
								                </div>
								                
											</div>
											<!-- row 끝 -->
										</div>
									</fieldset>
								</div>
							</div>
							<%-- <div id="tab-2" class="tab-pane">
								<jsp:include page="stock.jsp" />
							</div>

							<div id="tab-3" class="tab-pane">
								<jsp:include page="trade.jsp" />
							</div>

							<div id="tab-4" class="tab-pane">
								<jsp:include page="inputOutputStatus.jsp" />
							</div> --%>

						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
</div>
 <script>

 $(document).ready(function () {

/* 	 c3.generate({
         bindto: '#lineChart',
         data:{
             columns: [
                 ['data1', 30, 200, 100, 400, 150, 250],
                 ['data2', 50, 20, 10, 40, 15, 25]
             ],
             colors:{
                 data1: '#1ab394',
                 data2: '#BABABA'
             }
         }
     }); */
	 
	 
	 
	 c3.generate({
	     bindto: '#gauge',
	     data:{
	         columns: [
	        	 
	        	 ['dto.user_gender', 2]
	        	 
	         ],

	         type: 'gauge'
	     },
	     color:{
	         pattern: ['#1ab394', '#BABABA']

	     }
	 });
	 
	 
 });
     

 
 </script>

</body>
</html>