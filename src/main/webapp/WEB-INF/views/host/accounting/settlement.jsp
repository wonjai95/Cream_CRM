<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/resources/host/js/settlement.js"></script>
<style>
#settlement {
	display: inline-block;
	vertical-align: top;
	margin: 0px 30px;
    text-align-last: center;
}

#settlement th {
	width: 50%;
}

#settlement_btn{
	float: right;
	
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button { 
-webkit-appearance: none; 
-moz-appearance: none; 
appearance: none; }

input[readonly]{
	background-color: white;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<div id="tab-2" class="tab-pane active">
	<div class="panel-body">
		<div class="row">
			<div class="table-responsive">
					<sec:csrfInput />
					<div class="col-sm-3" id="settlement"
						style="margin: 0px 80px 0px 100px;">
						<table class="table table-bordered" style="margin-bottom: 8px;">
							<tbody>
								<tr>
									<th>매출액</th>
									<td>
										<fmt:formatNumber value="${Revenue}" pattern="###,###,###,###" />
										<input type="hidden" name="revenue" value="${Revenue}">
									</td>
								</tr>
							</tbody>
						</table>
						<i class="fas fa-minus"></i>
						<table class="table table-bordered" style="margin: 8px 0px;">
							<tbody>
								<tr>
									<th>매출원가</th>
									<td>
										<fmt:formatNumber value="${EIList.inven_price + CSList.pullingPrice - endingInvenPrice}" pattern="###,###,###,###" />
										<input type="hidden" name="cost_of_goods_sold" value="${EIList.inven_price + CSList.pullingPrice - endingInvenPrice}">
									</td>
								</tr>
							</tbody>
						</table>
						<i class="fas fa-arrow-down"></i>
						<table class="table table-bordered" style="margin: 8px 0px;">
							<tbody>
								<tr>
									<th>매출총이익</th>
									<td>
										<fmt:formatNumber value="${Revenue - (EIList.inven_price + CSList.pullingPrice - endingInvenPrice)}" pattern="###,###,###,###" />
										<input type="hidden" name="gross_profit" value="${Revenue - (EIList.inven_price + CSList.pullingPrice - endingInvenPrice)}">
									</td>
								</tr>
							</tbody>
						</table>
						<i class="fas fa-minus"></i>
						<table class="table table-bordered" style="margin: 8px 0px;">
							<tbody>
								<tr>
									<th>판매비와 관리비</th>
									<td>
										<fmt:formatNumber value="${TotalSalary + sumExpenses[0] + sumExpenses[1] + sumExpenses[2]}" pattern="###,###,###,###" />
										<input type="hidden" name="operating_expensews" value="${TotalSalary + sumExpenses[0] + sumExpenses[1] + sumExpenses[2]}">
									</td>
								</tr>
							</tbody>
						</table>
						<i class="fas fa-arrow-down"></i>
						<table class="table table-bordered" style="margin: 8px 0px;">
							<tbody>
								<tr>
									<th>영업이익</th>
									<td>
										<fmt:formatNumber value="${Revenue - (EIList.inven_price + CSList.pullingPrice - endingInvenPrice) - (TotalSalary + sumExpenses[0] + sumExpenses[1] + sumExpenses[2])}" pattern="###,###,###,###" />
										<input type="hidden" name="operating_income" value="${Revenue - (EIList.inven_price + CSList.pullingPrice - endingInvenPrice) - (TotalSalary + sumExpenses[0] + sumExpenses[1] + sumExpenses[2])}">
									</td>
								</tr>
							</tbody>
						</table>
						<i class="fas fa-minus"></i>
						<table class="table table-bordered" style="margin: 8px 0px;">
							<tbody>
								<tr>
									<th>영업외손익</th>
									<td>
										<fmt:formatNumber value="${sumOperatingLoss[2] - sumOperatingLoss[1]}" pattern="###,###,###,###" />
										<input type="hidden" name="non_operating_profit_loss" value="${sumOperatingLoss[2] - sumOperatingLoss[1]}">
									</td>
								</tr>
							</tbody>
						</table>
						<i class="fas fa-arrow-down"></i>
						<table class="table table-bordered" style="margin: 8px 0px;">
							<tbody>
								<tr>
									<th>법인세차감전이익</th>
									<!-- 법인세차감전이익 = 영업이익 + 영업외수익 - 영업외비용 -->
									<td>
										<fmt:formatNumber value="${Revenue - (EIList.inven_price + CSList.pullingPrice - endingInvenPrice) - (TotalSalary + sumExpenses[0] + sumExpenses[1] + sumExpenses[2]) - (sumOperatingLoss[2] - sumOperatingLoss[1])}" pattern="###,###,###,###" />
										<input type="hidden" name="income_before_taxes" value="${Revenue - (EIList.inven_price + CSList.pullingPrice - endingInvenPrice) - (TotalSalary + sumExpenses[0] + sumExpenses[1] + sumExpenses[2]) - (sumOperatingLoss[2] - sumOperatingLoss[1])}">
									</td>
								</tr>
							</tbody>
						</table>
						<i class="fas fa-minus"></i>
						<table class="table table-bordered" style="margin: 8px 0px;">
							<tbody>
								<tr>
									<th>법인세등</th>
									<td>
										<fmt:formatNumber value="${sumOperatingLoss[0]}" pattern="###,###,###,###" />
										<input type="hidden" name="income_taxes" value="${sumOperatingLoss[0]}">
									</td>
								</tr>
							</tbody>
						</table>
						<i class="fas fa-arrow-down"></i>
						<table class="table table-bordered" style="margin-top: 8px;">
							<tbody>
								<tr>
									<th>당기순이익</th>
									<td>
										<fmt:formatNumber value="${Revenue - (EIList.inven_price + CSList.pullingPrice - endingInvenPrice) - (TotalSalary + sumExpenses[0] + sumExpenses[1] + sumExpenses[2]) - (sumOperatingLoss[2] - sumOperatingLoss[1]) - sumOperatingLoss[0]}" pattern="###,###,###,###" />
										<input type="hidden" name="net_income" value="${Revenue - (EIList.inven_price + CSList.pullingPrice - endingInvenPrice) - (TotalSalary + sumExpenses[0] + sumExpenses[1] + sumExpenses[2]) - (sumOperatingLoss[2] - sumOperatingLoss[1]) - sumOperatingLoss[0]}">
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="col-sm-3" id="settlement">
						<table class="table table-bordered" style="margin-bottom: 30px;">
							<tbody>
								<tr>
									<th>상품매출</th>
									<td><fmt:formatNumber value="${Revenue}"
											pattern="###,###,###,###" /></td>
								</tr>
							</tbody>
						</table>
						<table class="table table-bordered" style="margin-bottom: 50px;">
							<tbody>
								<tr>
									<th>매출액</th>
									<td><fmt:formatNumber value="${Revenue}"
											pattern="###,###,###,###" /></td>
								</tr>
							</tbody>
						</table>

						<table class="table table-bordered" style="margin-bottom: 30px;">
							<tbody>
								<tr>
									<th>급여</th>
									<td><fmt:formatNumber value="${TotalSalary}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="labour_cost" value="${TotalSalary}"></td>
								</tr>

								<tr>
									<th>복리후생비</th>
									<td><fmt:formatNumber value="${sumExpenses[0]}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="employee_beneifts" value="${sumExpenses[0]}"></td>
								</tr>

								<tr>
									<th>소모품비</th>
									<td><fmt:formatNumber value="${sumExpenses[1]}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="utilies" value="${sumExpenses[1]}"></td>
								</tr>

								<tr>
									<th>수수료비용</th>
									<td><fmt:formatNumber value="${sumExpenses[2]}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="commission" value="${sumExpenses[2]}"></td>
								</tr>
							</tbody>
						</table>

						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>판매비와 관리비</th>
									<!-- 판매비와 관리비 = 급여 + 복리후생비 + 소모품비 + 수수료비용-->
									<td><fmt:formatNumber value="${TotalSalary + sumExpenses[0] + sumExpenses[1] + sumExpenses[2]}"
											pattern="###,###,###,###" /></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-3" id="settlement">
						<table class="table table-bordered" style="margin-bottom: 30px;">
							<tbody>
								<tr>
									<th>기초상품재고액</th>
									<td><fmt:formatNumber value="${EIList.inven_price}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="openning_inventory" value="${EIList.inven_price}"></td>
								</tr>

								<tr>
									<th>당기상품매입액</th>
									<td><fmt:formatNumber value="${CSList.pullingPrice}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="purchaes" value="${CSList.pullingPrice}"></td>
								</tr>

								<tr>
									<th>기말상품재고액</th>
									<td><fmt:formatNumber value="${endingInvenPrice}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="ending_inventory" value="${endingInvenPrice}"></td>
								</tr>
							</tbody>
						</table>

						<table class="table table-bordered" style="margin-bottom:50px;">
							<tbody>
								<tr>
									<th>매출원가</th>
									<!-- 매출원가 = 기초상품재고액 + 당기상품재고액 - 기말상품재고액 -->
									<td><fmt:formatNumber value="${EIList.inven_price + CSList.pullingPrice - endingInvenPrice}"
											pattern="###,###,###,###" /></td>
								</tr>
							</tbody>
						</table>

						<table class="table table-bordered" style="margin-bottom: 30px;">
							<tbody>
								<tr>
									<th>영업외수익</th>
									<td><fmt:formatNumber value="${sumOperatingLoss[2]}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="non_operating_income" value="${sumOperatingLoss[2]}"></td>
								</tr>

								<tr>
									<th>영업외비용</th>
									<td><fmt:formatNumber value="${sumOperatingLoss[1]}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="non_operating_expenses" value="${sumOperatingLoss[1]}"></td>
								</tr>
							</tbody>
						</table>
						
						<table class="table table-bordered" style="margin-bottom: 30px;">
							<tbody>
								<tr>
									<th> 영업외손익 </th>
									<td>
										<fmt:formatNumber value="${sumOperatingLoss[2] - sumOperatingLoss[1]}" pattern="###,###,###,###" />
										<input type="hidden" name="corporate_tax" value="${sumOperatingLoss[2] - sumOperatingLoss[1]}">
									</td>
								</tr>
							</tbody>
						</table>

						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>법인세등</th>
									<td><fmt:formatNumber value="${sumOperatingLoss[0]}"
											pattern="###,###,###,###" /></td>
								</tr>
							</tbody>
						</table>

						<button type="submit" class="btn btn-primary btn-lg"
							id="settlement_btn">결산</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>	
</body>
</html>