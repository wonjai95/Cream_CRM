/**
 * 
 */

$("document").ready(function(){
	
	$("tr[class=attendance]").click(function(){
		
		$("tr[class=attendance]").css("background","");
		
		var attCode = $(this).find("input[name=attendance_cd]").val();
		console.log("attCode : " + attCode);
		
		$("input[name=attendance_code]").val(attCode);
		$(this).css("background", "#20c997");
	});
	
	$("#attendanceUpd_btn").click(function(){
		
		var empCode = $("input[name=employee_code]").val();
		var empName = $("input[name=employee_name]").val();
		var attendanceCode = $("input[name=attendance_code]").val();
		console.log("empCode : " + empCode);
		console.log("attendanceCode : " + attendanceCode);
		
		var url = "employee_getAttendanceInfo?employee_code=" + empCode + "&employee_name=" + empName + "&attendance_code=" + attendanceCode;
		
		window.open(url, "employee_getAttendanceInfo", "menubar=no, width=800, height=800");
	});
	
	$("#attendanceDel_btn").click(function(){
		
		var attendanceCode = $("input[name=attendance_code]").val();
		console.log("attendanceCode : " + attendanceCode);
		
		if(attendanceCode == 0){
			alert("선택한 항목이 없습니다. 선택해주세요!");
		} else {
			if(confirm("삭제하시겠습니까? \n(삭제 후 복구가 불가능합니다.)")){
				console.log("확인");
				
				window.location = "employee_attendanceDelete?attendance_code=" + attendanceCode;
			} else {
				console.log("취소");
				return false;
			}
		}
	});
	
	
	$("input[id=currentMonth]").change(function(){
		alert("월 선택");
		
		var header = $("meta[name='_csrf_header']").attr("content");
	    var token = $("meta[name='_csrf']").attr("content");
		var empCode = $("input[name=employee_code]").val();
		var chanMonth = $("input[id=currentMonth]").val();
		
		console.log("empCode : " + empCode);
		console.log("chanMonth : " + chanMonth);
		
		$.ajax({
			url : "employee_attendanceList",
			type : "Post",
			data : "employee_code="+empCode+"&currentMonth="+chanMonth,
			beforeSend : function(jqXHR, settings) {
		          console.log("beforesend 진행");
		          jqXHR.setRequestHeader(header, token);
		    },
		    success : function(result){
		    	$(".attendanceList").html(result);
		    },
		    error : function(error){
		    	alert("다시 시도해주세요.");
		    }
		});
	});
});