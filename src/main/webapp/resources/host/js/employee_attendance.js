$("document").ready(function() {
	
	$("#employee_attendanceForm").submit(function() {
		if(confirm("진행하시겠습니까?")) {
			console.log("확인");
		} else {
			console.log("취소");
			return false;
		}
	});
	
	// 출근 클릭
	$("#employee_in").click(function() {
		// 클릭시 체크박스 해제
		$("input[type=checkbox]").prop("checked", false);
		
		$("input[type=radio]").prop("required", true);
		
		// 클릭시 버튼 색깔 지정
		$("#employee_out").css("background", "");
		$("#employee_in").css("background", "#20c997");
		$("#employee_in").css("color", "#212529");
		
		// 클릭시 지각 체크박스 보여줌
		$(".form-check-input").show();
		$(".form-check-label").html("지각");
		$("input[name=late_early]").val("지각");
		
		// 클릭시 체온 및 코로나 문진 숨기기
		$("#out_display").css('display', 'block');
		
		// 출퇴근 값을 hidden에 담아서 service로 넘김
		$("input[name=employee_in]").val("출근");
		$("input[name=employee_out]").val("0");
		
	});
	
	// 퇴근 클릭
	$("#employee_out").click(function() {
		// 클릭시 체크박스 해제
		$("input[type=checkbox]").prop("checked", false);
		
		$("input[type=radio]").prop("required", false);
		
		// 클릭시 버튼 색깔 지정
		$("#employee_in").css("background", "");
		$("#employee_out").css("background", "#20c997");
		$("#employee_out").css("color", "#212529");
		
		// 클릭시 조퇴 체크박스 보여줌
		$(".form-check-input").show();
		$(".form-check-label").html("조퇴");
		$("input[name=late_early]").val("조퇴");
		
		// 클릭시 체온 및 코로나 문진 숨기기
		$("#out_display").css('display', 'none');
		
		// 출퇴근 값을 hidden에 담아서 service로 넘김
		$("input[name=employee_in]").val("0");
		$("input[name=employee_out]").val("퇴근");
	});
	
	// 지각, 조퇴 체크 
	$(".form-check-input").click(function() {
		if($(this).is(":checked")) {
			if($("input[name=late_early]").val() == "지각") {
				// value에 지각(late) 설정
				$("input[name=inout_time_setting]").val("late");
			} else {
				// value에 조퇴(leave_early) 설정
				$("input[name=inout_time_setting]").val("leave_early");
			}
		}
		console.log($("input[name=inout_time_setting]").val());
	});
	
	// 창 닫기 클릭
	$("input[name=window_close]").click(function() {
		window.close();
	});
	
	
});