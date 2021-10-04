$("document").ready(function() {
	
	// 검색 기능
	$("#search_btn").click(function(){
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        console.log("header : " + header);
		
		var searchCode = $("input[id=employee_code]").val();
		var searchName = $("input[id=employee_name]").val();
		var searchDep = $("input[id=department]").val();
		
		console.log("searchCode : " + searchCode);
		console.log("searchName : " + searchName);
		console.log("searchDep : " + searchDep);
		
		if(searchCode == "" && searchName == "" && searchDep == ""){
			alert("검색어를 입력하세요.");
		} else {
		
			$.ajax({
		       	  url : "employee_searchList",
		       	  type : "Post",
		       	  data : "employee_code=" + searchCode + "&employee_name=" + searchName + "&department=" + searchDep,
	     	  	  async: false,	
				  beforeSend : function(jqXHR, settings) {
		       		  console.log("beforesend 진행");
		                 jqXHR.setRequestHeader(header, token);
		       	  },
		       	  success : function(result) {
		       		  $("#employeeList").html(result);
		       		  console.log("성공");
		       		 
		       	  },
		       	  error : function(error) {
		       		console.log(error);  
		       	  }
			});
		}
	});
	
	
	// 테이블에서 직원 선택시 직원 코드 hidden에 설정
	$("tr[class^=employee]").click(function() {

		$("tr[class^=employee]").css("background", "");
		
		var thisTr = $(this);
		var thisTd = $(this).children();
		var empCode = thisTd.eq(0).find("input[name^=employee]").val();
		var empName = thisTd.eq(1).find("input[name^=employee]").val();
		var empDepart = thisTd.eq(2).find("input[name^=employee]").val();
		console.log("empCode : " + empCode);
		
		$("input[name=employee_code_hidden]").val(empCode);
		$("input[name=employee_name_hidden]").val(empName);
		$("input[name=employee_depart_hidden]").val(empDepart);
		$(this).css("background", "#20c997");
			
	});
	
//	$("table").on("click", "tr[class^=employee]", function() {
//		alert("click");
//	});
	
	
	// 테이블에서 직원 더블 클릭시 상세 정보 페이지로 이동
	$("tr[class^=employee]").dblclick(function(){
		
		console.log("doublic Click");
		
		var empCode = $("input[name=employee_code_hidden]").val();
		console.log(empCode);
		
		var url = "employee_detail?employee_code=" + empCode;
		window.open(url, "employee_detail", "menubar=no, width=1300, height=800");
		
	});
	
	
	// 직원 등록 버튼 클릭
	$("#employee_enlist_btn").click(function() {
		var empCode = $("input[name=employee_code_hidden]").val();
		console.log(empCode);
		
		var url = "employee_enlist"
		window.open(url, "employee_enlist", "menubar=no, width=800, height=800");
	});
	
	// 근태 버튼 클릭
	$("#employee_attend_btn").click(function() {
		if($("input[name=employee_code_hidden]").val() == 0) {
			alert("직원을 선택하세요!");
			return false;
		} else {
			var empCode = $("input[name=employee_code_hidden]").val();
			var empName = $("input[name=employee_name_hidden]").val();
			console.log(empCode);
			
			// 팝업창 중앙에 띄우기 하고 싶은데 안됨....ㅠ
			var popUpWidth = 800;
			var popUpHeight = 800;
			
			var popupX = (window.screen.width/2) - (popUpWidth/2);
			var popupY = (window.screen.height/2) - (popUpHeight/2);
			console.log("popupX : " + popupX);
			console.log("popupY : " + popupY);
			
			var url = "employee_attendance?employee_code=" + empCode + "&employee_name=" + empName;
				window.open(url, "employee_attendance", "status=no, width=800, height=800, left="+ popupX + ", top="+ popupY);
						
		}
	});
	
	// 근무시간 버튼 클릭
	$("#employee_workhours_btn").click(function() {
		if($("input[name=employee_code_hidden]").val() == 0) {
			alert("직원을 선택하세요!");
			return false;
		} else {
			var empCode = $("input[name=employee_code_hidden]").val();
			var empName = $("input[name=employee_name_hidden]").val();
			console.log(empCode);
			
			var url = "employee_workhours?employee_code=" + empCode + "&employee_name=" + empName;
			window.open(url, "employee_workhours", "menubar=no, width=800, height=800");
		}
		
	});
	
	// 휴가 버튼 클릭
	$("#employee_leave_btn").click(function() {
		if($("input[name=employee_code_hidden]").val() == 0) {
			alert("직원을 선택하세요!");
			return false;
		} else {
			var empCode = $("input[name=employee_code_hidden]").val();
			var empName = $("input[name=employee_name_hidden]").val();
			console.log(empCode);
			
			var url = "employee_leave?employee_code=" + empCode + "&employee_name=" + empName;
			window.open(url, "employee_leave", "menubar=no, width=800, height=800");
		}
	});
	
	// 급여계약 버튼 클릭
	$("#employee_contract_btn").click(function() {
		if($("input[name=employee_code_hidden]").val() == 0) {
			alert("직원을 선택하세요!");
			return false;
		} else {
			var empCode = $("input[name=employee_code_hidden]").val();
			var empName = $("input[name=employee_name_hidden]").val();
			console.log(empCode);
			
			// var url = "employee_contract?employee_code=" + empCode + "&employee_name=" + empName;
			var url = "http://localhost:3000/contract_form?employee_code=" + empCode;
			window.open(url, "employee_contract", "menubar=no, width=800, height=800");
		}
	});
	
	// 창 닫기 클릭
	$("input[name=window_close]").click(function() {
		window.close();
	});
	
});