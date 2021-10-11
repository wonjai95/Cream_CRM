<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<title>managerSalesStatics</title>

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

</head>
<body>
<div class="tab-content">
	<div id="tab-2" class="tab-pane active">
		<div class="panel-body">
			<!-- 본문 내용 시작 -->
			<fieldset>
				<div class="wrapper wrapper-content">
					<!-- 위에 데이터 시트 시작 -->
                    <div class="col-lg-12">
	                    <div class="ibox ">
	                        <div class="ibox-title">
	                            <h5>담당자별 판매정보</h5>
	                            <div class="ibox-tools">
	                            </div>
	                        </div>
	                        <div class="ibox-content">
								<form action="" name="">
	                            <table id="rowClick" class="table table-hover" data-page-size="15">
									<thead>
						            <tr style="text-align: center">
						                <th>담당자코드</th>
						                <th>담당자명</th>
						                <th>판매 건수</th>
						                <th>예약상태</th>
						                <th>매출 총 금액</th>
						                <th>직급</th>
						            </tr>
						            </thead>
						            
						            <tbody>
						            <c:forEach var="dto" items="${dtos}" >
							            <tr style="text-align: center">
							                <td >${dto.employee_code}</td>
							                <td >${dto.employee_name}</td>
							                <td>${dto.salesCount} 건</td>
							                <td>${dto.res_state}</td>
							                <td > 
								                <fmt:formatNumber value="${dto.salesSum}"
														pattern="###,###,###" />&nbsp;원
							                </td>
											<td>${dto.position}</td>
							            </tr>
							        </c:forEach>
						            </tbody>
								</table>
								</form>
	                        </div>
	                    </div>
	                </div>
	                <!-- 위에 데이터 시트 끝 -->
	                <!-- 아래 차트 시작 -->
					<div class="col-lg-12">
						<div class="ibox ">
							<div class="ibox-title">
								<h5>담당자별 월 판매총액</h5>
							</div>
							<div class="ibox-content">
								<div>
									<canvas id="barChart" height="140"></canvas>
								</div>
							</div>
						</div>
					</div>
	                <!-- 아래 차트 끝 -->
				</div>
			</fieldset>
			<!-- 본문 내용 끝 -->
		</div>
	</div>

</div>
 <script>

 $(document).ready(function () {
	/*  <c:forEach var="dto" items="${plist}">
 	 ['${dto.m_name}', ${dto.sumTotal}],
  </c:forEach> 
 	${dto.employee_name},${dto.salesSum}*/
	 var barData = {
		 labels: ["1월", "2월", "3월", "4월",
				  "5월", "6월", "7월", "8월",
				  "9월", "10월", "11월", "12월"],
    	 datasets: [
    		 <c:forEach var="list" items="${list}">
        	 {        	
       		    label: '${list.employee_name}',
                backgroundColor: 'rgba(26,179,148,0.5)',
                borderColor: "rgba(26,179,148,0.7)",
                pointBackgroundColor: "rgba(26,179,148,1)",
                pointBorderColor: "#fff",
                data: [${list.janSalesSum}, ${list.febSalesSum}, ${list.marSalesSum}, ${list.aprSalesSum},
					${list.maySalesSum}, ${list.junSalesSum}, ${list.julSalesSum}, ${list.augSalesSum},
					${list.sepSalesSum}, ${list.octSalesSum}, ${list.novSalesSum}, ${list.decSalesSum}]   	 
        	 },
        	 </c:forEach> 
        	 
        	 /* [${janSalesSum}, ${febSalesSum}, ${marSalesSum}, ${aprSalesSum},
					${maySalesSum}, ${junSalesSum}, ${julSalesSum}, ${augSalesSum},
					${dto.salesSum}, ${octSalesSum}, ${novSalesSum}, ${decSalesSum}] */
        	 /* {
            	 label: "Data 2",
            	 backgroundColor: 'rgba(26,179,148,0.5)',
            	 borderColor: "rgba(26,179,148,0.7)",
            	 pointBackgroundColor: "rgba(26,179,148,1)",
            	 pointBorderColor: "#fff",
            	 data: [28, 48, 40, 19, 86, 27, 90]
        	 } */
    	 ]
	 };

	 var barOptions = {
    	 responsive: true
	 };


	 var ctx2 = document.getElementById("barChart").getContext("2d");
	 new Chart(ctx2, {type: 'bar', data: barData, options:barOptions});
	 
		    
		    
	 
 });
     
 </script>

</body>
</html>