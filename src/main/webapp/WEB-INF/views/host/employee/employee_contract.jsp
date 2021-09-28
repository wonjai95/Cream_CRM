<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee_contract.jsp</title>
<style type="text/css">
body {
	background-color: white;
}

#g_product {
	text-shadow: aqua;
}
</style>
<script type="text/javascript" src="${path}/resources/host/js/employee_leave_contract.js"></script>
</head>
<body>
	<div class="ibox-content">
		<form action="employee_contractAction" method="post" id="employee_contractForm">
			<sec:csrfInput/>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">직원코드</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="employee_code" 
						value="${employee_code}" placeholder="직원코드" required>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">직원 이름</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="employee_name" 
						value="${employee_name}" placeholder="직원 이름" required>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">월급(만 원)</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="mon_sal" 
						placeholder="연봉 입력시 자동 계산" readonly>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">연봉(만 원)</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="salary" placeholder="연봉" required>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">지급일자</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="payment_date" placeholder="매달 N일" required>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">은행 / 계좌번호</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="account" placeholder="ex) 국민은행 / 111-111-111111" required>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label" style="margin-right: 12px;">적용기간</label>
				<div class="col-sm-3" style="display: contents;">
					<input type='date' value="0" name="contract_start" style="border: 1px solid #e5e6e7" required/>&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type='date' value="0" name="contract_end" style="border: 1px solid #e5e6e7" required/>&nbsp;&nbsp; 
				</div>
			</div>	
			
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">계약일자</label>
				<div class="col-sm-7">
					<input type='date' name="leave_register_date" class="register_date" readonly 
						style="border: 1px solid #e5e6e7; align-self: center; height: 35.6px;"/>
				</div>
			</div>
			
			<!-- 등록 및 창 닫기 버튼 시작 -->
			<div class="hr-line-dashed"></div>
			<div class="col-sm-7">
				<div class="form-group" style="text-align: right;">
					<input type="submit" class="btn btn-primary dim" style="width:100px;" value="등록">
					<input type="submit" class="btn btn-primary dim" style="width:100px;" value="갱신">
					<input type="button" class="btn btn-primary dim" name="window_close" style="width:100px;" value="창닫기">
				</div>
			</div>
			<!-- 등록 및 창 닫기 버튼 끝 -->
		</form>
	</div>

</body>
</html>