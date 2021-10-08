<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
			
		$("#getWorkHours").click(function(){
			$.ajax({
				type:"get",
				url:"getWorkHours",
				success: function(response){
					$("#workTimes").html(response);
				},
				error: function(){
					alert("오류");
				}
			});
		});
		
	});
	
	/*
	function addHtml(vo) {
		return '<tr class="footable-odd">'
		+ '<td class="footable-visible">&nbsp;&nbsp;'
		+ '<input type="radio" name="room_setting_code" value="'+ vo.room_setting_code +'">'
		+ '</td>'
		+ '<td class="footable-visible"><span>'+ vo.room_name +'</span></td>'
		+ '<td class="footable-visible"><span>'+ vo.room_stat +'</span></td>'
		+ '<td class="footable-visible"><span>'+ vo.per_price +'</span></td>'
		+ '<td class="footable-visible"><span>'+ vo.min_cnt +'</span></td>'
		+ '<td class="footable-visible"><span>'+ vo.max_cnt +'</span></td>'
		+ '</tr>';
	}
	*/
</script>
</head>
<body>

	<div id="wrapper">

		<!-- frame  -->
		<jsp:include page="../Frame.jsp" />

		<div id="page-wrapper" class="gray-bg">

			<!-- nav bar  -->
			<jsp:include page="../navbar.jsp" />

			<div class="wrapper wrapper-content animated fadeInRight ecommerce">

				<div class="row">
					<div class="col-lg-12">
						<div class="tabs-container">
							<ul class="nav nav-tabs">
								<li><a class="nav-link active" data-toggle="tab"
									href="#tab-1"> 내정보 </a></li>

								<li><a class="nav-link" data-toggle="tab" href="#tab-2">
										사업자정보 </a></li>

								<li><a class="nav-link" data-toggle="tab" href="#tab-3" id="getWorkHours">
										영업 시간 설정 </a></li>

							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<div class="row">
										<div class="ibox-content">
											<h2>마이페이지</h2>
											<p class="font-bold">마이페이지</p>
											
											<iframe src="http://localhost:3000/hostInfoPage?host_code=${sessionScope.code}"  style="width: 1000px; height: 1000px;">
											</iframe>

											<%-- <form role="form" id="form" novalidate="novalidate">

												<div class="form-group">
													<label>코드</label> <input type="text" class="form-control"
														readonly value="${hostVo.host_code}">
												</div>
												<div class="form-group">
													<label>아이디</label> <input type="text" class="form-control"
														readonly value="${hostVo.host_id}">
												</div>
												<div class="form-group">
													<label>비밀번호</label> <input type="text" class="form-control"
														readonly value="암호회됨">
												</div>
												<div class="form-group">
													<label>이름</label> <input type="text" class="form-control"
														readonly value="${hostVo.host_name}">
												</div>
												<div class="form-group">
													<label>이메일</label> <input type="text" class="form-control"
														readonly value="${hostVo.host_email}">
												</div>
												<div class="form-group">
													<label>회사명</label> <input type="text" class="form-control"
														readonly value="${hostVo.comp_name}">
												</div>
												<div class="form-group">
													<label>번호</label> <input type="text" class="form-control"
														readonly value="${hostVo.host_ph}">
												</div>
											</form> --%>
										</div>
									</div>
								</div>


								<div id="tab-2" class="tab-pane">
									<jsp:include page="businessInfo.jsp" />
								</div>

								<div id="tab-3" class="tab-pane">
									<jsp:include page="timeSetting.jsp" />
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>