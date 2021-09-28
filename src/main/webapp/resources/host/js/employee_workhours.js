$("document").ready(function() {
	// 근무시간이 0 이면 submit 불가능
	$("#workHoursForm").submit(function() {
		if($("input[name=total_workhours_inMinutes]").val() == 0) {
			alert("시간을 선택해주세요!");
			return false;
		};
		
		// 체크되지 않은 요일의 시간들은 0으로 초기화
		if(!$("#monChk").is(":checked")) {
			$("input[name=mon_in_time]").val(0);
			$("input[name=mon_out_time]").val(0);
		} 
		if(!$("#tueChk").is(":checked")) {
			$("input[name=tue_in_time]").val("");
			$("input[name=tue_out_time]").val("");
		} 
		if(!$("#wedChk").is(":checked")) {
			$("input[name=wed_in_time]").val("");
			$("input[name=wed_out_time]").val("");
		} 
		if(!$("#thurChk").is(":checked")) {
			$("input[name=thur_in_time]").val("");
			$("input[name=thur_out_time]").val("");
		} 
		if(!$("#friChk").is(":checked")) {
			$("input[name=fri_in_time]").val("");
			$("input[name=fri_out_time]").val("");
		} 
		if(!$("#satChk").is(":checked")) {
			$("input[name=sat_in_time]").val("");
			$("input[name=sat_out_time]").val("");
		} 
		if(!$("#sunChk").is(":checked")) {
			$("input[name=sun_in_time]").val("");
			$("input[name=sun_out_time]").val("");
		};
		
		
	});
	
// --------------------- 총 근무시간 계산 ---------------------
	// 체크 박스 선택시 change 활성화 
	// 월요일 체크박스 선택 시
	$("#monChk").click(function() {
		if($(this).is(":checked")) {
			$("input[name=mon_in_time]").trigger("change");
		} else {
			$("#mon_total_hours").val("0");
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		};
	});
	
	// 화요일 체크박스 선택 시
	$("#tueChk").click(function() {
		if($(this).is(":checked")) {
			$("input[name=tue_in_time]").trigger("change");
		} else {
			$("#tue_total_hours").val("0");
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		};
	});
	
	// 수요일 체크박스 선택 시
	$("#wedChk").click(function() {
		if($(this).is(":checked")) {
			$("input[name=wed_in_time]").trigger("change");
		} else {
			$("#wed_total_hours").val("0");
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		};
	});
	
	// 목요일 체크박스 선택 시
	$("#thurChk").click(function() {
		if($(this).is(":checked")) {
			$("input[name=thur_in_time]").trigger("change");
		} else {
		 	$("#thur_total_hours").val("0");
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		};
	});
	
	// 금요일 체크박스 선택 시
	$("#friChk").click(function() {
		if($(this).is(":checked")) {
			$("input[name=fri_in_time]").trigger("change");
		} else {
			$("#fri_total_hours").val("0");
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		};
	});
	
	// 토요일 체크박스 선택 시
	$("#satChk").click(function() {
		if($(this).is(":checked")) {
			$("input[name=sat_in_time]").trigger("change");
		} else {
			$("#sat_total_hours").val("0");
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		};
	});
	
	// 일요일 체크박스 선택 시
	$("#sunChk").click(function() {
		if($(this).is(":checked")) {
			$("input[name=sun_in_time]").trigger("change");
		} else {
			$("#sun_total_hours").val("0");
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		};
	});
	
	
	// 총 근무 시간 계산
	function totalWorkHours() {
		var monHours = $("#mon_total_hours").val();
		var tueHours = $("#tue_total_hours").val();
		var wedHours = $("#wed_total_hours").val();
		var thurHours = $("#thur_total_hours").val();
		var friHours = $("#fri_total_hours").val();
		var satHours = $("#sat_total_hours").val();
		var sunHours = $("#sun_total_hours").val();
		
		var totalHours = parseInt(monHours) + parseInt(tueHours) + parseInt(wedHours) + parseInt(thurHours)
					+ parseInt(friHours) + parseInt(satHours) + parseInt(sunHours);
		
		console.log("총 근무 시간 : " + totalHours);
		
		// 화면에 시간:분 형식으로 출력
		$("input[name=total_workhours]").val(convertMinsToHrsMins(totalHours));
		// 총 근무시간을 분으로 값을 넘김
		$("input[name=total_workhours_inMinutes]").val(totalHours);
	}
	
	// 분을 시간 형식으로 변환하는 함수
	function convertMinsToHrsMins(mins) {
		  let h = Math.floor(mins / 60);
		  let m = mins % 60;
		  h = h < 10 ? '0' + h : h;
		  m = m < 10 ? '0' + m : m;
		  return `${h}:${m}`;
	}
	
	// 각 요일 별 출퇴근 시간 계산
	// ---------- 월요일 ----------
	// 월요일 출근 시간
	$("input[name=mon_in_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#monChk").is(":checked")) {
			var inTime = $(this).val();
			var outTime = $("input[name=mon_out_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			console.log("출근 시간 Date 변환 : " + inTimeDate);
			console.log("퇴근 시간 Date 변환 : " + outTimeDate);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
		
			$("#mon_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
		
	});
		
	
	// 월요일 퇴근 시간
	$("input[name=mon_out_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#monChk").is(":checked")) {
			var outTime = $(this).val();
			var inTime = $("input[name=mon_in_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#mon_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
		
	});
	
	// ---------- 화요일 ----------
	// 화요일 출근 시간
	$("input[name=tue_in_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#tueChk").is(":checked")) {
			var inTime = $(this).val();
			var outTime = $("input[name=tue_out_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			console.log("출근 시간 Date 변환 : " + inTimeDate);
			console.log("퇴근 시간 Date 변환 : " + outTimeDate);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#tue_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	
	// 화요일 퇴근 시간
	$("input[name=tue_out_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#tueChk").is(":checked")) {
			var outTime = $(this).val();
			var inTime = $("input[name=tue_in_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#tue_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	// ---------- 수요일 ----------
	// 수요일 출근 시간
	$("input[name=wed_in_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#wedChk").is(":checked")) {
			var inTime = $(this).val();
			var outTime = $("input[name=wed_out_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			console.log("출근 시간 Date 변환 : " + inTimeDate);
			console.log("퇴근 시간 Date 변환 : " + outTimeDate);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#wed_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	
	// 수요일 퇴근 시간
	$("input[name=wed_out_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#wedChk").is(":checked")) {
			var outTime = $(this).val();
			var inTime = $("input[name=wed_in_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#wed_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	// ---------- 목요일 ----------
	// 목요일 출근 시간
	$("input[name=thur_in_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#thurChk").is(":checked")) {
			var inTime = $(this).val();
			var outTime = $("input[name=thur_out_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			console.log("출근 시간 Date 변환 : " + inTimeDate);
			console.log("퇴근 시간 Date 변환 : " + outTimeDate);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#thur_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	
	// 목요일 퇴근 시간
	$("input[name=thur_out_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#thurChk").is(":checked")) {
			var outTime = $(this).val();
			var inTime = $("input[name=thur_in_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#thur_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	// ---------- 금요일 ----------
	// 금요일 출근 시간
	$("input[name=fri_in_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#friChk").is(":checked")) {
			var inTime = $(this).val();
			var outTime = $("input[name=fri_out_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			console.log("출근 시간 Date 변환 : " + inTimeDate);
			console.log("퇴근 시간 Date 변환 : " + outTimeDate);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#fri_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	
	// 금요일 퇴근 시간
	$("input[name=fri_out_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#friChk").is(":checked")) {
			var outTime = $(this).val();
			var inTime = $("input[name=fri_in_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#fri_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	// ---------- 토요일 ----------
	// 토요일 출근 시간
	$("input[name=sat_in_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#satChk").is(":checked")) {
			var inTime = $(this).val();
			var outTime = $("input[name=sat_out_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			console.log("출근 시간 Date 변환 : " + inTimeDate);
			console.log("퇴근 시간 Date 변환 : " + outTimeDate);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#sat_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	
	// 토요일 퇴근 시간
	$("input[name=sat_out_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#satChk").is(":checked")) {
			var outTime = $(this).val();
			var inTime = $("input[name=sat_in_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#sat_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	// ---------- 일요일 ----------
	// 일요일 출근 시간
	$("input[name=sun_in_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#sunChk").is(":checked")) {
			var inTime = $(this).val();
			var outTime = $("input[name=sun_out_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			console.log("출근 시간 Date 변환 : " + inTimeDate);
			console.log("퇴근 시간 Date 변환 : " + outTimeDate);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#sun_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	
	// 일요일 퇴근 시간
	$("input[name=sun_out_time]").change(function() {
		// 해당 요일 선택되었을 때만 시간 계산
		if($("#sunChk").is(":checked")) {
			var outTime = $(this).val();
			var inTime = $("input[name=sun_in_time]").val();
			console.log("출근 시간 : " + inTime);
			console.log("퇴근 시간 : " + outTime);
			
			var inTimeDate =  Date.parse("1990/01/01 " + inTime);
			var outTimeDate =  Date.parse("1990/01/01 " + outTime);
			
			// 근무 시간 계산
			var workingHours = (outTimeDate - inTimeDate)/1000/60;
			console.log("하루 총 근무 시간 : " + workingHours);
			
			$("#sun_total_hours").val(workingHours);
			
			// 총 근무 시간 계산 함수 호출
			totalWorkHours();
		} else {
			alert("요일을 체크해주세요!");
		};
	});
	
	
	// 창 닫기 클릭
	$("input[name=window_close]").click(function() {
		window.close();
	});
	
	
	
});