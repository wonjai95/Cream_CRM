<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>salesStatics</title>
    <!-- c3 Charts -->
    <link href="${path}/resources/bootstrap/css/c3/c3.min.css" rel="stylesheet">

    <link href="${path}/resources/bootstrap/css/animate.css" rel="stylesheet">
    <link href="${path}/resources/bootstrap/css/style.css" rel="stylesheet">
<style type="text/css">
#p_group {
	display: flex;
}
</style>

  <!-- d3 and c3 charts -->
  <script src="${path}/resources/bootstrap/js/plugins/d3/d3.min.js"></script>
  <script src="${path}/resources/bootstrap/js/plugins/c3/c3.min.js"></script>
  <script src="${path}/resources/bootstrap/js/plugins/chartJs/Chart.min.js"></script>
  <script src="${path}/resources/bootstrap/js/demo/chartjs-demo.js"></script>
  

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
				<h2>판매통계</h2>
			</div>
		</div>

		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
		<form action="" method="post">
		  <sec:csrfInput/>
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<ul class="nav nav-tabs">
							<li><a class="nav-link active" data-toggle="tab" href="#tab-1">상품별 판매 현황</a></li>
							<li><a class="nav-link" data-toggle="tab" href="#tab-2">담당자별 판매 현황</a></li>
							<li><a class="nav-link" data-toggle="tab" href="#tab-3">유형별 판매 현황</a></li>
						</ul>
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<!-- 본문 내용 시작 -->
									<fieldset>
										<div class="wrapper wrapper-content">
											<!-- 위에 데이터 시트 시작 -->
											<div class="col-lg-12">
							                    <div class="ibox ">
							                        <div class="ibox-title">
							                            <h5>Border Table </h5>
							                        </div>
							                        <div class="ibox-content">
							
							                            <table class="table table-bordered">
							                                <thead>
							                                <tr>
							                                    <th>#</th>
							                                    <th>First Name</th>
							                                    <th>Last Name</th>
							                                    <th>Username</th>
							                                </tr>
							                                </thead>
							                                <tbody>
							                                <tr>
							                                    <td>1</td>
							                                    <td>Mark</td>
							                                    <td>Otto</td>
							                                    <td>@mdo</td>
							                                </tr>
							                                <tr>
							                                    <td>2</td>
							                                    <td>Jacob</td>
							                                    <td>Thornton</td>
							                                    <td>@fat</td>
							                                </tr>
							                                <tr>
							                                    <td>3</td>
							                                    <td>Larry</td>
							                                    <td>the Bird</td>
							                                    <td>@twitter</td>
							                                </tr>
							                                </tbody>
							                            </table>
							
							                        </div>
							                    </div>
							                </div>
							                <!-- 위에 데이터 시트 끝 -->
							                <!-- 아래 차트 시작 -->
							                <div class="col-lg-12">
							                    <div class="ibox ">
							                        <div class="ibox-title">
							                            <h5>Line Chart Example
							                                <small>With custom colors.</small>
							                            </h5>
							                        </div>
							                        <div class="ibox-content">
							                            <div>
							                                <div id="lineChart"></div>
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
							<div id="tab-2" class="tab-pane">
							
							</div>

						</div>
					</div>
				</div>
			</div>
			</form>
		</div>

	</div>
</div>
 <script>

 $(document).ready(function () {

     c3.generate({
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
     });
 });
     
 </script>
<script type="text/javascript" src="${path}/resources/host/js/salesStatics.js"></script>
</body>
</html>