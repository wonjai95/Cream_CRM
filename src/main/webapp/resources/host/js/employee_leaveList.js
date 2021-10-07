/**
 * 
 */

$("document").ready(function(){
    setDateBox();
    
    $("tr[class=leave]").click(function(){
    	
    	$("tr[class=leave]").css("background","");
    	
    	var leaveCd = $(this).find("input[name=leave_cd]").val();
    	
    	console.log("leaveCd : " + leaveCd);
    	
    	$("input[name=leave_code]").val(leaveCd);
    	$(this).css("background", "#20c997");
    });
    
    $("#leaveUpd_btn").click(function(){
    	
    	var empCode = $("input[name=employee_code]").val();
    	var leaveCode = $("input[name=leave_code]").val();
    	
    	console.log("empCode : " + empCode);
    	console.log("leaveCode : " + leaveCode);
    	
    	if(leaveCode == '0'){
    		alert("선택된 항목이 없습니다. 선택 해주세요!");
    	} else { 
			var url = "employee_getLeaveInfo?employee_code=" + empCode + "&leave_code=" + leaveCode;
			window.open(url, "employee_getLeaveInfo", "menubar=no, width=800, height=800");
    	}
    });
    
    $("#leaveDel_btn").click(function(){
    	
    	var leaveCode = $("input[name=leave_code]").val();
    	console.log("leaveCode : " + leaveCode);
    	
    	if(leaveCode == '0'){
    		
    		alert("선택된 항목이 없습니다. 선택 해주세요!");
    		
    	} else {
    		if(confirm('삭제하시겠습니까? \n(삭제 후 복구가 불가능합니다.)')){
    			console.log("확인");
    			window.location = "employee_leaveDelete?leave_code=" + leaveCode;
    		} else {
    			console.log("취소");
    			return false;
    		}
    	}
    });
    
});    
 
    // select box 연도 , 월 표시
    function setDateBox(){
        var dt = new Date();
        var currentYear = $("input[id=curYear]").val();
        console.log("currentYear : " + currentYear);
        
        var year = "";
        var com_year = dt.getFullYear();
        // 발행 뿌려주기
        $("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-5); y <= (com_year); y++){
            $("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        }
        
        // 기본값 설정
        $("#YEAR").val(currentYear).attr("selected", "selected");
        
    }
    
    