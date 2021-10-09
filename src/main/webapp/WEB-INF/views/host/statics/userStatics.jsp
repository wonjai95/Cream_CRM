<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userStatics</title>

    <!-- c3 Charts -->
    <link href="${path}/resources/bootstrap/css/c3/c3.min.css" rel="stylesheet">

<style type="text/css">
#p_group {
	display: flex;
}
</style>

  <!-- d3 and c3 charts -->
  <script src="${path}/resources/bootstrap/js/plugins/d3/d3.min.js"></script>
  <script src="${path}/resources/bootstrap/js/plugins/c3/c3.min.js"></script>
  <script src="${path}/resources/bootstrap/js/plugins/chartJs/Chart.min.js"></script>
  <script src="${path}/resources/bootstrap/js/plugins/demo/chartjs-demo.js"></script>

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
				<h2>통계</h2>
			</div>
		</div>

		<div class="wrapper wrapper-content animated fadeInRight ecommerce">

			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<ul class="nav nav-tabs">
							
							<li><a class="nav-link active" data-toggle="tab" href="#tab-1">회원 분포</a></li>
							<li><a class="nav-link" data-toggle="tab" href="#tab-2">월별 인원 현황</a></li>
						</ul>
						<div class="tab-content">
							
			<!-- div id="tab-1" 시작 -->
							<div id="tab-1" class="tab-pane active">
							<%-- <jsp:include page="requestReservation.jsp" /> --%>
								<div class="panel-body">
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
													                <th>나이</th>
													                <th>성별</th>
													                <th>연락처</th>
													            </tr>
													            </thead>
													            
													            <tbody>
													            <c:forEach var="dto" items="${dto}" varStatus="status">
														            <tr >
														                <td id="user_code${status.index}">${dto.user_code}
														                	<input type="hidden" name="user_code${status.index}" value="${dto.user_code}">
														                </td>
														                <td id="user_name${status.index}">${dto.user_name}
														                	<input type="hidden" name="user_name${status.index}" value="${dto.user_name}">
														                </td>
														                <td id="user_birth${status.index}">${dto.user_birth}
														                	<input type="hidden" name="user_birth${status.index}" value="${dto.user_birth}">
														                </td>
																		<td id="user_age${status.index}">${dto.user_age}
																			<input type="hidden" name="user_age${status.index}" value="${dto.user_age}">
																		</td>
																		<td id="user_gender${status.index}">${dto.user_gender}
																			<input type="hidden" name="user_gender${status.index}" value="${dto.user_gender}">
																		</td>						
																		<td id="user_address${status.index}">${dto.user_address}
																			<input type="hidden" name="user_address${status.index}" value="${dto.user_address}">
																		</td>
														            </tr>
														        </c:forEach>
													            </tbody>
															</table>
															</form>
								                        </div>
								                    </div>
								                </div>
								                
								                <!-- 전체 고객 성비 -->
								                <div class="col-lg-6">
								                    <div class="ibox ">
								                        <div class="ibox-title">
								                            <h5>전체 고객 성비
								                                <small>여성</small>
								                            </h5>
								                        </div>
								                        <div class="ibox-content">
								                            <div>
								                                <!-- <div id="lineChart"></div> -->
								                                <div id="gauge"></div>
								                                
								                                
								                            </div>
								                        </div>
								                    </div>
								                    <div class="ibox ">
								                        <div class="ibox-title">
								                            <h5>전체 고객 성비
								                                <small>남성</small>
								                            </h5>
								                        </div>
								                        <div class="ibox-content">
								                            <div>
								                                <!-- <div id="lineChart"></div> -->
								                                <div id="gauge2"></div>
								                                
								                                
								                            </div>
								                        </div>
								                    </div>
								                </div>
								                
								                <!-- 전체 고객 연령 -->
								                <div class="col-lg-6">
								                    <div class="ibox ">
								                        <div class="ibox-title">
								                            <h5>전체 고객 연령</h5>
								                        </div>
								                        <div class="ibox-content">
								                            <div>
								                                <div id="pie"></div>
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
			<!-- div id="tab-1" 끝 -->
							
							
			<!-- div id="tab-2" 시작 -->
							<div id="tab-2" class="tab-pane">
								<div class="panel-body">
									<fieldset>
										<div class="wrapper wrapper-content">
											<!-- row 시작 -->
											<div class="row">
												
								                <!-- 여기 이곳에 월별 인원 현황 컨텐츠 넣기!! -->
								                <div class="col-lg-12">
								                    <div class="ibox ">
								                        <div class="ibox-title">
								                            <h5>월별 인원 현황
								                                <small>With custom colors.</small>
								                            </h5>
								                        </div>
								                        <div class="ibox-content">
								                            <div>
								                                <canvas id="lineChart" height="140"></canvas>
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
			<!-- div id="tab-2" 끝 -->



							<%-- <div id="tab-3" class="tab-pane">
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
	 
// 전체 고객 성비 => 여성	 
	 c3.generate({
	     bindto: '#gauge',
	     data:{
	         columns: [
	        	 ['여성',${f_ratio}]
	         ],
	         type: 'gauge'
	     },
	     color:{
	         pattern: ['#1ab394', '#BABABA']
	     }
	 });

// 전체 고객 성비 => 남성
	 c3.generate({
         bindto: '#gauge2',
         data:{
	         columns: [
	        	 ['남성',${m_ratio}]
	         ],
	         type: 'gauge'
	     },
	     color:{
	         pattern: ['#1ab394', '#BABABA']
	     }
     });	 
	 
// 전체 고객 연령	 
	 c3.generate({
         bindto: '#pie',
         data:{
             columns: [
                 ['10대', ${age10s_ratio}],
                 ['20대', ${age20s_ratio}],
                 ['30대', ${age30s_ratio}],
                 ['40대', ${age40s_ratio}],
                 ['50대', ${age50s_ratio}],
                 ['60대', ${age60s_ratio}],
                 ['70대', ${age70s_ratio}],
                 ['80대', ${age80s_ratio}]
             ],
             colors:{
            	 '10대': '#1ab394',
            	 '20대': '#fb8c00',
            	 '30대': '#afb42b',
            	 '40대': '#ff8a65',
            	 '50대': '#00acc1',
            	 '60대': '#673ab7',
            	 '60대': '#ec407a',
                 '80대': '#BABABA'
             },
             type : 'pie'
         }
     });

// 월별 인원 현황  
	 var lineData = {
	        labels: ["1월", "2월", "3월", "4월",
					"5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월"],
	        datasets: [
	
	            {
	                label: "신규등록 고객",
	                backgroundColor: 'rgba(26,179,148,0.5)',
	                borderColor: "rgba(26,179,148,0.7)",
	                pointBackgroundColor: "rgba(26,179,148,1)",
	                pointBorderColor: "#fff",
	                data: [${janJoinCnt}, ${febJoinCnt}, ${marJoinCnt}, ${aprJoinCnt},
							${mayJoinCnt}, ${junJoinCnt}, ${julJoinCnt}, ${augJoinCnt},
	                		${sepJoinCnt}, ${octJoinCnt}, ${novJoinCnt}, ${decJoinCnt}]
	            },{
	                label: "방문 및 예약 고객",
	                backgroundColor: 'rgba(220, 220, 220, 0.5)',
	                pointBorderColor: "#fff",
	                data: [3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4]
	            }
	        ]
	    };
	
	var lineOptions = {
	        responsive: true
	    };
	
    var ctx = document.getElementById("lineChart").getContext("2d");
    new Chart(ctx, {type: 'line', data: lineData, options:lineOptions});
	 
	 
	 
	 
	 
 });
     

 
 </script>

</body>
</html>