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

</head>
<body>
<div class="tab-content">
	<div id="tab-2" class="tab-pane active">
		<div class="panel-body">
			<div class="ibox-content m-b-sm border-bottom">
				<div class="row">
					<div class="col-sm-2">
						<div class="form-group">
							<select name="" id="" class="form-control">
								<option value="1" selected="">ajax 실험</option>
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
						            <tr>
						                <th>담당자코드</th>
						                <th>담당자명</th>
						                <!-- <th>판매건수</th> -->
						                <th>예약상태</th>
						                <!-- <th>매출총금액</th> -->
						                <th>직급</th>
						            </tr>
						            </thead>
						            
						            <tbody>
						            <c:forEach var="dto" items="${dtos}" >
							            <tr >
							                <td >${dto.employee_code}
							                	<%-- <input type="hidden" name="user_code${status.index}" value="${dto.user_code}"> --%>
							                </td>
							                <td >${dto.employee_name}
							                	<%-- <input type="hidden" name="user_name${status.index}" value="${dto.user_name}"> --%>
							                </td>
							                <td>${dto.res_state}
							                	<%-- <input type="hidden" name="user_name${status.index}" value="${dto.user_name}"> --%>
							                </td>
							                <%-- <td id="user_birth${status.index}">${dto.user_birth}
							                	<input type="hidden" name="user_birth${status.index}" value="${dto.user_birth}">
							                </td> --%>
											<td>${dto.position}
												<%-- <input type="hidden" name="user_age${status.index}" value="${dto.user_age}"> --%>
											</td>
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
	                            <h5>Radar Chart Example</h5>
	                        </div>
	                        <div class="ibox-content">
	                            <div>
	                                <div id="pie2"></div>
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

	 c3.generate({
         bindto: '#pie1',
         data:{
             columns: [
                 ['data1', 30],
                 ['data2', 120]
             ],
             colors:{
                 data1: '#1ab394',
                 data2: '#BABABA'
             },
             type : 'pie'
         }
     });
	 
	 c3.generate({
         bindto: '#pie2',
         data:{
             columns: [
                 ['data1', 30],
                 ['data2', 120]
             ],
             colors:{
                 data1: '#1ab394',
                 data2: '#BABABA'
             },
             type : 'pie'
         }
     });
 });
     
 </script>

</body>
</html>