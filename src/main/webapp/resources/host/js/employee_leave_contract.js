$("document").ready(function() {
	// 등록시 확인/취소
	$("#employee_leaveAction").submit(function() {
		if(confirm("진행하시겠습니까?")) {
			console.log("확인");
		} else {
			console.log("취소");
			return false;
		}
	});
	
	// 등록 확인/취소
	$("#employee_contractForm").submit(function() {
		if(confirm("진행하시겠습니까?")) {
			console.log("확인");
		} else {
			console.log("취소");
			return false;
		}
	});
	
	// 현재 날짜 구하기
	var sysdate = new Date();
	console.log("현재 날짜 : " + sysdate);
	var today = sysdate.getFullYear() + "-" + ("0" + (sysdate.getMonth()+1)).slice(-2) 
				+ "-" + ("0" + sysdate.getDate()).slice(-2);
	console.log("현재 날짜 string : " + today)
	$(".register_date").val(today);
	
	
// ----------------------------- employee_leave 시작 -----------------------------
	// 연차 일수 계산 - 시작 날짜
	$("input[name=leave_start]").change(function() {
		var leave_start = $(this).val();
		var leave_end = $("input[name=leave_end]").val();
		console.log("leave_start : " + leave_start);
		console.log("leave_end : " + leave_end);
		if(!leave_end) {
			console.log("leave_end " + leave_end);
		} else {
			cal_leave_date();
		}
	});
	
	// 연차 일수 계산 - 끝 날짜
	$("input[name=leave_end]").change(function() {
		var leave_end = $(this).val();
		var leave_start = $("input[name=leave_start]").val();
		console.log("leave_start : " + leave_start);
		console.log("leave_end : " + leave_end);
		if(!leave_start) {
			console.log("leave_start " + leave_start);
		} else {
			cal_leave_date();
		}
	});
	
	// 연차 일수 계산 함수
	function cal_leave_date() {
		var leave_start = new Date($("input[name=leave_start]").val());
		var leave_end = new Date($("input[name=leave_end]").val());
		
		var total_date = (leave_end - leave_start)/(1000*3600*24) + 1;
		console.log("total_date : " + total_date);
		
		$("#leave_total_days").val(total_date);
	};
	
	// ----------------------------- employee_leave 끝 -----------------------------
	
	
	// ----------------------------- employee_contract 시작 -----------------------------
		// 연봉 입력시 월급 자동 계산
		$("input[name=salary]").change(function() {
			var sal = parseInt($(this).val());
			var mon_sal = Math.floor(sal / 12);
			
			$(this).val(addComma(sal));
			$("input[name=mon_sal]").val(addComma(mon_sal));
		});
	
	
	
	
	// ----------------------------- employee_contract 끝  -----------------------------
	
	// 창 닫기 클릭
	$("input[name=window_close]").click(function() {
		window.close();
	});
	
	
	// 천단위 콤마 함수( , 삽입)
	function addComma(value){
	     value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	     return value; 
	};
	
	// 천단위 콤마 함수( , 삭제)
	function minusComma(value) {
		value = value.toString().replace(/[^\d]+/g, "");
		return value;
	};
	
});

