<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/resources/host/js/employee_contractList.js"></script>
</head>
<body>
<!-- 급여 계약 시작 -->
<div id="tab-3" class="tab-pane active">
    <div class="panel-body">
    <sec:csrfInput/>
    <input type="hidden" name="employee_code" value="${employee_code}">
    <input type="hidden" name="salary_contract_code" value="0">
    <input type="hidden" name="monthly_salary" value="0">

        <!-- 월선택 달력!!! -->
		<div class="round-btn" style="text-align:right; margin-bottom:10px;">
			<a class="btn btn-default btn-rounded" id="payment_btn">지급</a>
			<a class="btn btn-default btn-rounded" id="contractDel_btn">삭제</a>
		</div>

     	<fieldset>
        	<table class="table table-bordered" style="font-size:12px; text-align:center;">
				<thead>
					<tr>
						<!-- 여기 파트 보면 비타민에 사유가 있는데 기타메모에 합치는건 어떨까??? -->
						<th style="width:15%;">적용 기간</th>
						<th style="width:10%;">월급</th>
						<th style="width:15%;">연봉</th>
						<th style="width:10%;">지급일자</th>
						<th style="width:20%;">은행 / 계좌번호</th>
						<th style="width:30%;">기타메모</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="list3" items="${contractList}">
						
						<tr class="contract">
							<td>
								${list3.con_start} ~ ${list3.con_end}
								<input type="hidden" name="contract_code" value="${list3.salary_contract_code}">
							</td>
							<td>
								<fmt:formatNumber value="${list3.monthly_salary}" pattern="###,###,###"/>
								<input type="hidden" name="monthly_sal" value="${list3.monthly_salary}">
							</td>
							<td>
								<fmt:formatNumber value="${list3.annual_salary}" pattern="###,###,###"/>
							</td>
							<td>매달 ${list3.payment_date}일</td>
							<td>국민은행 / 111-111-1111111</td>
							<td>연봉 협상</td>
					     </tr>
				    </c:forEach>
			    </tbody>
			</table>
		</fieldset>
    </div>
</div>
<!-- 급여 계약 끝  -->
</body>
</html>