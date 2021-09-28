<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee_workhours.jsp</title>
<style type="text/css">
body {
	background-color: white;
}

#g_product {
	text-shadow: aqua;
}

.form-group {
	margin-bottom: 20px;
}
</style>
<script type="text/javascript" src="${path}/resources/host/js/employee_workhours.js"></script>
</head>
<body>
	<div class="ibox-content">
		<form action="employee_workhoursAction" method="post" id="workHoursForm">
			<sec:csrfInput/>
			<input type="hidden" name="inout_time_setting" value="0">
			<input type="hidden" name="late_early" value="0">
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
				<label class="col-sm-2 col-form-label">지각 판단 기준(분)</label>
				<div class="col-sm-3">
					<input type="number" class="form-control" name="late_criteria" 
						value="10" step="5" min="0" required>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">조퇴 판단 기준(분)</label>
				<div class="col-sm-3">
					<input type="number" class="form-control" name="early_criteria"
						value="30" step="5" min="0" required>
				</div>
			</div>
			
			<!-- 요일 시간 등록 시작 -->
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">구분</label>
				<div class="col-sm-3" style="display: contents;">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="mon" id="monChk" 
							name="working_day_chk">월요일 &nbsp;&nbsp;
					</div>
					<input type='time' value="09:00" name="mon_in_time" />&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type='time' value="18:00" name="mon_out_time"/>&nbsp;&nbsp; 
					<input type="number" name="mon_total_hours" value="0" id="mon_total_hours" style="display: none;">
				</div>
			</div>	
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label"></label>
				<div class="col-sm-3" style="display: contents;">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="tue" id="tueChk" 
							name="working_day_chk">화요일 &nbsp;&nbsp;
					</div>
					<input type='time' value="09:00" name="tue_in_time"/>&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type='time' value="18:00" name="tue_out_time"/>&nbsp;&nbsp; 
					<input type="number" name="tue_total_hours" value="0" id="tue_total_hours" style="display: none;">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label"></label>
				<div class="col-sm-3" style="display: contents;">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="wed" id="wedChk" 
							name="working_day_chk">수요일 &nbsp;&nbsp;
					</div>
					<input type='time' value="09:00" name="wed_in_time"/>&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type='time' value="18:00" name="wed_out_time"/>&nbsp;&nbsp; 
					<input type="number" name="wed_total_hours" value="0" id="wed_total_hours" style="display: none;">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label"></label>
				<div class="col-sm-3" style="display: contents;">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="thur" id="thurChk" 
							name="working_day_chk">목요일 &nbsp;&nbsp;
					</div>
					<input type='time' value="09:00" name="thur_in_time"/>&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type='time' value="18:00" name="thur_out_time"/>&nbsp;&nbsp; 
					<input type="number" name="thur_total_hours" value="0" id="thur_total_hours" style="display: none;">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label"></label>
				<div class="col-sm-3" style="display: contents;">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="fri" id="friChk" 
							name="working_day_chk">금요일 &nbsp;&nbsp;
					</div>
					<input type='time' value="09:00" name="fri_in_time"/>&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type='time' value="18:00" name="fri_out_time"/>&nbsp;&nbsp; 
					<input type="number" name="fri_total_hours" value="0" id="fri_total_hours" style="display: none;">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label"></label>
				<div class="col-sm-3" style="display: contents;">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="sat" id="satChk" 
							name="working_day_chk">토요일 &nbsp;&nbsp;
					</div>
					<input type='time' value="09:00" name="sat_in_time"/>&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type='time' value="18:00" name="sat_out_time"/>&nbsp;&nbsp; 
					<input type="number" name="sat_total_hours" value="0" id="sat_total_hours" style="display: none;">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label"></label>
				<div class="col-sm-3" style="display: contents;">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="sun" id="sunChk" 
							name="working_day_chk">일요일 &nbsp;&nbsp;
					</div>
					<input type='time' value="09:00" name="sun_in_time"/>&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type='time' value="18:00" name="sun_out_time"/>&nbsp;&nbsp; 
					<input type="number" name="sun_total_hours" value="0" id="sun_total_hours" style="display: none;">
				</div>
			</div>
			<!-- 요일 시간 등록 끝 -->
			
			<!-- 총 근무시간 시작 -->
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">총 근무 시간</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="total_workhours" value="0" placeholder="총 근무 시간" readonly> 
					<input type="text" class="form-control" name="total_workhours_inMinutes" value="0" style="display: none;"> 
						
				</div>
			</div>
			<!-- 총 근무시간 끝 -->
			
			<!-- 등록 및 창 닫기 버튼 시작 -->
			<div class="hr-line-dashed"></div>
			<div class="col-sm-7">
				<div class="form-group" style="text-align: right;">
					<input type="submit" class="btn btn-primary dim" name="submit" style="width:100px;" value="등록">
					<input type="button" class="btn btn-primary dim" name="window_close" style="width:100px;" value="창닫기">
				</div>
			</div>
			<!-- 등록 및 창 닫기 버튼 끝 -->
		</form>
	</div>

</body>
</html>