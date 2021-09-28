<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${path}/resources/bootstrap/css/font-awesome.css"
	rel="stylesheet">
<link href="${path}/resources/bootstrap/css/summernote-bs4.css"
	rel="stylesheet">
<link href="${path}/resources/bootstrap/css/datepicker3.css"
	rel="stylesheet">
<link href="${path}/resources/bootstrap/css/animate.css"
	rel="stylesheet">
<link href="${path}/resources/bootstrap/css/style.css" rel="stylesheet">
<style type="text/css">
body {
	background-color: white;
}

#g_product {
	text-shadow: aqua;
}
</style>
<script type="text/javascript" src="${path}/resources/host/js/employee.js"></script>
<script type="text/javascript" src="${path}/resources/host/js/employee_enlist.js"></script>
</head>
<body>
<form action="employee_enlistAction" method="post" id="employeeEnlistForm" name="employeeEnlistForm">
	<input type="hidden" name="idChk" id="idChk" value="0">
	<sec:csrfInput/>
	<div class="ibox-content">
		<div class="hr-line-dashed"></div>
		<div class="form-group  row">
			<label class="col-sm-2 col-form-label">직원 이름</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" name="employee_name" placeholder="직원 이름" required>
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<div class="row">
				<label class="col-sm-2 col-form-label">직원 아이디</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="employee_id" id="employee_id" placeholder="아이디" required> 
				</div>
				<div class="col-sm-2">
					<button class="btn btn-primary dim" type="button" id="idChkBtn">확인</button>
				</div>
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<div class="row">
				<label class="col-sm-2 col-form-label">직원 비밀번호</label>
				<div class="col-sm-3">
					<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" required> 
				</div>
				<div class="col-sm-3">
					<input type="password" class="form-control" name="password_chk" id="password_chk" placeholder="비밀번호 확인" required> 
				</div>
				<div class="col-sm-3">
					<br>
					<span class="pwd_chkMsg" style="font-size: 10px; color: #CC3D3D"></span>
					<input type="text" value="0" name="pwd_chkVal" style="display: none;">
				</div>
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">성별</label>
			<div class="col-sm-3">
				<select name="employee_gender" id="" class="form-control">
					<option value="1" id="employee_gender" selected>선택</option>
					<option value="M">남성</option>
					<option value="F">여성</option>
				</select>
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">나이</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" name="employee_age" placeholder="나이" value="0">
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">이메일</label>
			<div class="col-sm-3" style="display: flex;">
				<input name="employee_email1" type="text" class="form-control" placeholder="email" style="width: auto" required>
                  	<div style="width: 20px; align-self: center;">&nbsp;&nbsp;@&nbsp;&nbsp;</div>
                  	<input name="employee_email2" type="text" class="form-control" placeholder="gmail.com" style="width: auto" required>
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">주소</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" name="employee_address" placeholder="주소">
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">핸드폰</label>
			<div class="col-sm-7" style="display: flex;">
				<input type="text" class="form-control" name="employee_ph1" maxlength="3" placeholder="000"> &nbsp;&nbsp;-&nbsp;&nbsp;
				<input type="text" class="form-control" name="employee_ph2" maxlength="4" placeholder="0000"> &nbsp;&nbsp;-&nbsp;&nbsp;
				<input type="text" class="form-control" name="employee_ph3" maxlength="4" placeholder="0000"> 
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">부서</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" value="none" name="department" placeholder="부서" required>
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">직책</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" value="none" name="position" placeholder="직책">
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">직위</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" value="none" name="duty" placeholder="직위">
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">업무</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" value="none" name="job" placeholder="업무">
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">고용형태</label>
			<div class="col-sm-3">
				<select name="employee_type" id="employee_type" class="form-control">
					<option value="1">고용형태 선택</option>
					<option value="정규직">정규직</option>
					<option value="비정규직">계약직</option>
					<option value="인턴">인턴</option>
					<option value="알바">알바</option>
				</select>
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">연차</label>
			<div class="col-sm-7">
				<input type="number" class="form-control" value="0" 
					min="0" name="annual_leave_cnt" placeholder="연차">
			</div>
		</div>
		
		<div class="hr-line-dashed"></div>
		<div class="col-sm-7">
			<div class="form-group" style="text-align: right;">
				<input type="submit" class="btn btn-primary dim" style="width:100px;" value="등록">
				<input type="button" class="btn btn-primary dim" name="window_close" style="width:100px;" value="창닫기">
			</div>
		</div>
	</div>
</form>
</body>
</html>