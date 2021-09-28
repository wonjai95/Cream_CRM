/**
 * 
 */

$("document").ready(function(){
    setDateBox();
    
    $("tr[class=salary]").click(function(){
//		console.log("선택");
//		alert("선택");
//		
		$("tr[class=salary]").css("background", "");
		
		var salCode = $(this).find("input[name=salary_cd]").val();
		console.log("salCode : " + salCode);
		
		$("input[name=salary_code]").val(salCode);
		$(this).css("background","#20c997");
	});    
    
 // 급여 지급 목록에서 삭제 버튼 클릭시
	$("#salaryDel_btn").click(function(){
//		console.log("contractDel_btn click");
//		alert("contractDel_btn click");
		var salaryCode = $("input[name=salary_code]").val();
		console.log("salaryCode : " + salaryCode);
		
		if(salaryCode == '0'){
			
			alert("선택된 항목이 없습니다. 선택 해주세요!");
			
		} else {
		
			// 왜 안먹지???? 아는 사람 알려주라~~~
			if(confirm('삭제하시겠습니까? \n(삭제 후 복구가 불가능합니다.)')){
				console.log("확인");
				
				window.location = "employee_paymentDelete?salary_code=" + salaryCode;
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


