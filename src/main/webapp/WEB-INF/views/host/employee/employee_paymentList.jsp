<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee_paymentList.jsp</title>
<script type="text/javascript" src="${path}/resources/host/js/employee_paymentList.js"></script>
</head>
<body>
<!-- 급여 지급 시작 -->
<div id="tab-4" class="tab-pane active">
    <div class="panel-body">
    
    <input type="hidden" name="salary_code" value="0">

        <!-- 월선택 달력!!! -->
		<div class="form-group" id="data_4" style="width:13%; margin-bottom:10px; display:inline-block;">
			<div class="input-group date">
			  <input type="hidden" id="curYear" value="${curYear}">
			  <select name="YEAR" id="YEAR" title="년도" class="form-control"></select>
		    </div>
		</div>

		<div class="round-btn" style="display:inline-block; float:right;">
			<a class="btn btn-default btn-rounded" id="salaryDel_btn">삭제</a>
		</div>

		<fieldset>
		    <table class="table table-bordered" style="font-size:12px; text-align:center;">
				<thead>
					<tr>
						<!-- 여기 파트 보면 비타민에 사유가 있는데 기타메모에 합치는건 어떨까??? -->
						<th style="width:8%;">지급일자</th>
						<th style="width:8%;">월분</th>
						<th style="width:9%;">급여(월급)</th>
						<th style="width:8%;">소득세</th>
						<th style="width:9%;">국민연금</th>
						<th style="width:8%;">고용보험</th>
						<th style="width:9%;">건강보험</th>
						<th style="width:8%;">장기요양보험</th>
						<th style="width:9%;">공제합계</th>
						<th style="width:9%;">차인지급액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list4" items="${paymentList}">
						<tr class="salary">
						    <td>
						    	${list4.salary_payDate}
								<input type="hidden" name="salary_cd" value="${list4.salary_code}">
						    </td>
							<td>${list4.pay_month}</td>
							<td><fmt:formatNumber value="${list4.salary}" pattern="###,###,###"/></td>
							<td><fmt:formatNumber value="${list4.income_tax}" pattern="###,###,###"/></td>
							<td><fmt:formatNumber value="${list4.national_pension}" pattern="###,###,###"/></td>
							<td><fmt:formatNumber value="${list4.employment_insurance}" pattern="###,###,###"/></td>
							<td><fmt:formatNumber value="${list4.health_insurance}" pattern="###,###,###"/></td>
							<td><fmt:formatNumber value="${list4.lt_care_insurance}" pattern="###,###,###"/></td>
							<td><fmt:formatNumber value="${list4.deduction_total}" pattern="###,###,###"/></td>
							<td><fmt:formatNumber value="${list4.loan_payment_amount}" pattern="###,###,###"/></td>
						</tr>
					</c:forEach>
		     	</tbody>
			</table>
		</fieldset>
    </div>
</div>
<!-- 급여 지급 끝 -->
</body>
</html>