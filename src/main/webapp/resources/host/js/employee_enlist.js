$("document").ready(function() {
	// submit 클릭시 필수 항목 체크
	$("#employeeEnlistForm").submit(function() {
		if($("input[name=idChk]").val() == 0){
			alert("직원 아이디를 확인하세요!");
			return false;
		} else if($("input[name=pwd_chkVal]").val() == 0){
			alert("직원 비밀번호 확인하세요!");
			return false;
		} else if($("select[name=employee_type] option:selected").val() == "1") {
			alert("고용 형태를 선택하세요!");
			return false;
			
		// 확인/취소
		} else if(confirm("진행하시겠습니까?")) {
			console.log("확인");
		} else {
			console.log("취소");
			return false;
		}
	});
	
	// 직원 아이디 확인 버튼 클릭
	$("#idChkBtn").click(function() {
		var id = $("input[name=employee_id]").val();
		
		var popUpWidth = 350;
		var popUpHeight = 150;
		
		var popupX = (window.screen.width/2) - (popUpWidth/2);
		var popupY = (window.screen.height/2) - (popUpHeight/2);
		console.log("popupX : " + popupX);
		console.log("popupY : " + popupY);
		
		var url ="employee_IdChkAction?employee_id=" + id;
		    window.open(url, "employee_IdChkAction", "menubar=no, width=350, height=150 , left="+ popupX + ", top="+ popupY);
	});
	
	// 팝업창에서 직원 아이디 확인 버튼 클릭
	$("#idChkBtn2").click(function() {
		var id = $("input[name=employee_id]").val();
		window.location = "employee_IdChkAction?employee_id=" + id;
	});
	
	// 비밀번호 일치 확인
	$("#password_chk").change(function() {
		var pwd = $("#password").val();
		var pwd_chk = $(this).val();
		
		if(pwd == pwd_chk) {
			$(".pwd_chkMsg").html("비밀번호 확인");
			$("input[name=pwd_chkVal]").val("1");
		} else {
			$(".pwd_chkMsg").html("비밀번호가 일치하지 않습니다.");
		}
		
	});
	
	// 취소 버튼 클릭시 창 닫기
	$("#cancelBtn").click(function() {
		window.close();
	});
	
	// 팝업창 아이디 확인 완료
	$("#idConfirmBtn").click(function() {
		var id = $("#idChkVal").val();
		$(opener.document).find("#employee_id").val(id);
		$(opener.document).find("#idChk").val("1");
		window.self.close();
	});
	
	// 이미 직원 등록이 완료된 아이디 입력시 전체 팝업창 닫기
	$("#cancelAllBtn").click(function() {
		window.close();
		opener.parent.location.reload();
		
	});
	
	
});

