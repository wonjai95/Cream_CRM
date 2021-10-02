<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
$.ajax({
    url : "employee_attendanceList",
    type : "Post",
    data : "employee_code="+empCode+"&currentMonth="+curMonth, 
    beforeSend : function(jqXHR, settings) {
       console.log("beforesend 진행");
       jqXHR.setRequestHeader(header, token);
    },
    success : function(result) {
       $(".tab-content").html(result);
    },
    error : function(error) {
   	alert("다시 시도해주세요.");
    }
    
 });
</script>
</head>
<body>
<div id="tab-2" class="tab-pane active">
	<div class="panel-body">
		<div class="row">
			<div class="table-responsive">
				<form>
					<div class="col-sm-3" id="settlement"
						style="margin: 0px 80px 0px 100px;">
						<table class="table table-bordered" style="margin-bottom: 8px;">
							<tbody>
								<tr>
									<th>매출액</th>
									<td>
										<input type="Number" class="form-control" name="revenue" style="border:0px;" value="${Revenue}">
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
										<input type="Number" class="form-control"  name="cost_of_goods_sold" style="border:0px;" value="${EIList.inven_price + CSList.pullingPrice - endingInvenPrice}">
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
										<input type="Number" class="form-control"  name="gross_profit" style="border:0px; background-color:white;" value="" readonly>
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
										<input type="Number" class="form-control"  name="operating_expensews" style="border:0px;" value="${TotalSalary + sumExpenses[0] + sumExpenses[1] + sumExpenses[2]}">
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
										<input type="Number" class="form-control"  name="operating_income" style="border:0px; background-color:white;" value="" readonly>
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
										<input type="Number" class="form-control"  name="cost_of_goods_sold" style="border:0px;" value="${sumOperatingLoss[2] - sumOperatingLoss[1]}">
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
										<input type="Number" class="form-control"  name="income_before_taxes" style="border:0px; background-color:white;" value="" readonly>
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
										<input type="Number" class="form-control"  name="income_taxes" style="border:0px;" value="${sumOperatingLoss[0]}">
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
										<input type="Number" class="form-control"  name="net_income" style="border:0px; background-color:white;" value="" readonly>
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
										name="labour_cost" value=""></td>
								</tr>

								<tr>
									<th>복리후생비</th>
									<td><fmt:formatNumber value="${sumExpenses[0]}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="employee_beneifts" value=""></td>
								</tr>

								<tr>
									<th>소모품비</th>
									<td><fmt:formatNumber value="${sumExpenses[1]}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="utilies" value=""></td>
								</tr>

								<tr>
									<th>수수료비용</th>
									<td><fmt:formatNumber value="${sumExpenses[2]}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="commission" value=""></td>
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
										name="openning_inventory" value=""></td>
								</tr>

								<tr>
									<th>당기상품매입액</th>
									<td><fmt:formatNumber value="${CSList.pullingPrice}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="purchaes" value=""></td>
								</tr>

								<tr>
									<th>기말상품재고액</th>
									<td><fmt:formatNumber value="${endingInvenPrice}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="ending_inventory" value=""></td>
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
										name="non_operating_income" value=""></td>
								</tr>

								<tr>
									<th>영업외비용</th>
									<td><fmt:formatNumber value="${sumOperatingLoss[1]}"
											pattern="###,###,###,###" /> <input type="hidden"
										name="non_operating_expenses" value=""></td>
								</tr>
							</tbody>
						</table>
						
						<table class="table table-bordered" style="margin-bottom: 30px;">
							<tbody>
								<tr>
									<th> 영업외손익 </th>
									<td>
										<fmt:formatNumber value="${sumOperatingLoss[2] - sumOperatingLoss[1]}" pattern="###,###,###,###" />
										<input type="hidden" name="corporate_tax" value="">
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