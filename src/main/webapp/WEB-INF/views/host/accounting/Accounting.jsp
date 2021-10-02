<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>INSPINIA | Data Tables</title>
<style>
.tabs-container{
	width: 85%;
	margin: 0px auto;
}
</style>
<script type="text/javascript"
	src="${path}/resources/host/js/Accounting.js"></script>
</head>
<body>
	<div id="wrapper">

		<!-- frame  -->
		<jsp:include page="../Frame.jsp" />

		<div id="page-wrapper" class="gray-bg">

			<!-- nav bar  -->
			<jsp:include page="../navbar.jsp" />

			<!-- 직원 -->
			<div class="row wrapper border-bottom white-bg page-heading"
				style="margin-bottom: 20px;">
				<div class="col-lg-8">
					<h2>회계</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item">회계</li>
						<li class="breadcrumb-item active"><strong>손익계산서</strong></li>
					</ol>
				</div>
			</div>

			<div class="tabs-container">
				<ul class="nav nav-tabs">
					<li><a class="nav-link active" data-toggle="tab" href="#tab-1">
							손익계산서 </a></li>
					<li><a class="nav-link" data-toggle="tab" href="#tab-2">
							결산 </a></li>
				</ul>
				<!-- 매입매출전표 등록 부분 -->
				<div class="tab-content">
					<div id="tab-1" class="tab-pane active">
						<div class="panel-body">
							<div class="row">
								<div class="table-responsive">
								
									<div class="form-group" id="data_4"
										style="width: 13%; margin-bottom: 10px; display: inline-block;">
										<div class="input-group date">
											<input type="month" class="form-control" id="currentMonth"
												style="width: auto;" value="${currentMonth}">
										</div>
									</div>

									<table class="table table-bordered">

										<tbody>
											<tr>
												<td>과목</td>
												<td colspan="2" align="center">금액</td>
											</tr>
											<tr>
												<td>매출액</td>
												<td></td>
												<td><fmt:formatNumber value="${vo.revenue}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.revenue}"
														pattern="###,###,###" /></td>
											</tr>
											<tr>
												<td>상품매출</td>
												<td><fmt:formatNumber value="${vo.revenue}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.revenue}"
														pattern="###,###,###" /></td>
												<td></td>
											</tr>
											<tr>
												<td>매출원가</td>
												<td></td>
												<td><fmt:formatNumber value="${vo.cost_of_goods_sold}" pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.cost_of_goods_sold}" pattern="###,###,###" /></td>
											</tr>
											<tr>
												<td>기초상품재고액</td>
												<td><fmt:formatNumber value="${vo.openning_inventory}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.openning_inventory}"
														pattern="###,###,###" /></td>
												<td></td>
											</tr>

											<tr>
												<td>당기상품재고액</td>
												<td><fmt:formatNumber value="${vo.purchaes}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.purchaes}"
														pattern="###,###,###" /></td>
												<td></td>
											</tr>

											<tr>
												<td>기말상품재고액</td>
												<td><fmt:formatNumber value="${vo.ending_inventory}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.ending_inventory}"
														pattern="###,###,###" /></td>
												<td></td>
											</tr>

											<tr>
												<td>매출총이익</td>
												<td></td>
												<td><fmt:formatNumber value="${vo.gross_profit}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.gross_profit}"
														pattern="###,###,###" /></td>
											</tr>

											<tr>
												<td>판매비와 관리비</td>
												<td></td>
												<td><fmt:formatNumber value="${vo.operating_expensews}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.operating_expensews}"
														pattern="###,###,###" /></td>
											</tr>

											<tr>
												<td>급여</td>
												<td><fmt:formatNumber value="${vo.labour_cost}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.labour_cost}"
														pattern="###,###,###" /></td>
												<td></td>
											</tr>

											<tr>
												<td>복리후생비</td>
												<td><fmt:formatNumber value="${vo.employee_beneifts}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.employee_beneifts}"
														pattern="###,###,###" /></td>
												<td></td>
											</tr>

											<tr>
												<td>소모품비</td>
												<td><fmt:formatNumber value="${vo.utilies}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.utilies}"
														pattern="###,###,###" /></td>
												<td></td>
											</tr>

											<tr>
												<td>수수료비용</td>
												<td><fmt:formatNumber value="${vo.commission}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.commission}"
														pattern="###,###,###" /></td>
												<td></td>
											</tr>

											<tr>
												<td>영업이익</td>
												<td></td>
												<td><fmt:formatNumber value="${vo.operating_income}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.operating_income}"
														pattern="###,###,###" /></td>
											</tr>

											<tr>
												<td>영업외수익</td>
												<td></td>
												<td><fmt:formatNumber value="${vo.non_operating_income}" pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.non_operating_income}" pattern="###,###,###" /></td>
											</tr>

											<tr>
												<td>영업외비용</td>
												<td></td>
												<td><fmt:formatNumber value="${vo.non_operating_expenses}" pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.non_operating_expenses}" pattern="###,###,###" /></td>
											</tr>

											<tr>
												<td>법인세차감전이익</td>
												<td></td>
												<td><fmt:formatNumber value="${vo.income_before_taxes}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.income_before_taxes}"
														pattern="###,###,###" /></td>
											</tr>

											<tr>
												<td>법인세등</td>
												<td></td>
												<td><fmt:formatNumber value="${vo.income_taxes}" pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.income_taxes}" pattern="###,###,###" /></td>
											</tr>

											<tr>
												<td>당기순이익</td>
												<td></td>
												<td><fmt:formatNumber value="${vo.net_income}"
														pattern="###,###,###" /></td>
												<td></td>
												<td><fmt:formatNumber value="${vo.net_income}"
														pattern="###,###,###" /></td>
											</tr>

										</tbody>

									</table>
								</div>

							</div>
						</div>
					</div>
					<div id="tab-2" class="tab-pane active">
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- 
<tr>
<th> 매출총이익 </th> <!-- 매출총이익 = 매출액 - 매출원가 -->
<td> <fmt:formatNumber value="456680000" pattern="###,###,###,###"/> </td>
</tr>

<tr>
	<th> 영업이익 </th> <!-- 영업이익 = 매출총이익 - 판매비와 관리비 -->
	<td> <fmt:formatNumber value="456680000" pattern="###,###,###,###"/> </td>
</tr>

<tr>
	<th> 법인세등 </th>
	<td> <fmt:formatNumber value="456680000" pattern="###,###,###,###"/> </td>
</tr>

<tr>
	<th> 당기순이익 </th> <!-- 당기순이익 = 법인세차감전이익 - 법인세등 -->
	<td> <fmt:formatNumber value="456680000" pattern="###,###,###,###"/> </td>
</tr>
 --%>
</body>
</html>