<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee_attendance.jsp</title>
<style type="text/css">
body {
	background-color: white;
}

#g_product {
	text-shadow: aqua;
}
</style>
<script type="text/javascript" src="${path}/resources/host/js/employee_attendance.js"></script>
</head>
<body>
	<div class="ibox-content">
		<form action="employee_attendanceAction" method="post" id="employee_attendanceForm">
			<sec:csrfInput/>
			<input type="hidden" name="inout_time_setting" value="0">
			<input type="hidden" name="employee_in" value="0">
			<input type="hidden" name="employee_out" value="0">
			<!-- <input type="hidden" name="late_early" value="0"> -->
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
			<div class="form-group row">
				<label class="col-sm-2 col-form-label" style="margin-right: 15px;">구분</label>
				<div class="col-sm-3" style="display: contents;">
					<input type="button" class="btn btn-outline btn-primary" id="employee_in" value="출근">&nbsp;&nbsp;
					<input type="button" class="btn btn-outline btn-primary" id="employee_out" value="퇴근">&nbsp;&nbsp;
					<input type='time' name="inout_time" required/>&nbsp;&nbsp;
					<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="0" id="late_early" 
					  	name="late_early" style="display:none;">
					  <label class="form-check-label" for="flexCheckDefault">
					  		
					  </label>
					</div>
				</div>
			</div>
			
			<div  id="out_display">
				<div class="hr-line-dashed"></div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">체온</label>
					<div class="col-sm-3" style="display: flex;" >
						<input type="text" class="form-control" name="temperature" placeholder="체온">&nbsp;&nbsp;°C
					</div>
				</div>
				
				<div class="hr-line-dashed"></div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">코로나 문진 작성</label>
					<div class="col-sm-7">
	                  	 <div class="i-checks">
	                  	 	<span>현재 가족 혹은 일상적 접촉이 잦은 지인 중에 코로나19(의심)환자,자가격리대상자가 있습니까?</span> <br><br>
	                  	 	<label> <input type="radio" value="O" name="covid_chk1"> 예 </label>
	                        <label> <input type="radio" value="X" name="covid_chk1"> 아니오</label> <br><br>
	                      </div>
	                  	 <div class="i-checks">
	                  	 	<span>  현재 발열로 인하여 해열제 성분의 약을 복용하였습니까?</span> <br><br>
	                  	 	<label> <input type="radio" value="O" name="covid_chk2"> 예 </label>
	                        <label> <input type="radio" value="X" name="covid_chk2"> 아니오</label> <br><br>
	                      </div>
	                  	 <div class="i-checks">
	                  	 	<span> 해외 방문 이력이 있으며 귀국 후 14일 이내에 발열 또는 호흡기 증상이 있습니까? </span> <br><br>
	                  	 	<label> <input type="radio" value="O" name="covid_chk3"> 예 </label>
	                        <label> <input type="radio" value="X" name="covid_chk3"> 아니오</label>
	                      </div>
					</div>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">메모</label>
				<div class="col-sm-7" style="display: flex;" >
					<input type="text" class="form-control" name="memo" placeholder="특이사항">
				</div>
			</div>
			
			<!-- 등록 및 창 닫기 버튼 시작 -->
			<div class="hr-line-dashed"></div>
			<div class="col-sm-7">
				<div class="form-group" style="text-align: right;">
					<input type="submit" class="btn btn-primary dim" style="width:100px;" value="등록">
					<input type="button" class="btn btn-primary dim" name="window_close" style="width:100px;" value="창닫기">
				</div>
			</div>
			<!-- 등록 및 창 닫기 버튼 끝 -->
			
		</form>
	</div>

</body>
</html>