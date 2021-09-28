/**
 * 
 */

$("document").ready(function(){
	cal_leave_date();
	
	// 현재 날짜 구하기
	var sysdate = new Date();
	console.log("현재 날짜 : " + sysdate);
	var today = sysdate.getFullYear() + "-" + ("0" + (sysdate.getMonth()+1)).slice(-2) 
				+ "-" + ("0" + sysdate.getDate()).slice(-2);
	console.log("현재 날짜 string : " + today)
	$(".register_date").val(today);
	
	// 등록시 확인/취소
	$("#employee_leaveForm").submit(function() {
		if(confirm("진행하시겠습니까?")) {
			console.log("확인");
		} else {
			console.log("취소");
			return false;
		}
	});
	
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
});

//연차 일수 계산 함수
function cal_leave_date() {
	var leave_start = new Date($("input[name=leave_start]").val());
	var leave_end = new Date($("input[name=leave_end]").val());
	
	var total_date = (leave_end - leave_start)/(1000*3600*24) + 1;
	console.log("total_date : " + total_date);
	
	$("#leave_total_days").val(total_date);
};