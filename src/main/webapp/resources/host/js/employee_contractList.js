/**
 * 
 */
$("document").ready(function(){
	
//	alert("급여 계약 ajax");
	// 급여 계약에서 선택시 직원 코드 및 급여 계약 코드 hidden에 설정
	$("tr[class=contract]").click(function(){
//		console.log("선택");
//		alert("선택");
//		
		$("tr[class=contract]").css("background", "");
		
		var conCode = $(this).find("input[name=contract_code]").val();
		var monSalary = $(this).find("input[name=monthly_sal]").val();
		console.log("conCode : " + conCode);
		console.log("monSalary : " + monSalary);
		
		$("input[name=salary_contract_code]").val(conCode);
		$("input[name=monthly_salary]").val(monSalary);
		$(this).css("background","#20c997");
	});
	
	// 급여 계약 목록에서 지급 버튼 클릭시
	$("#payment_btn").click(function(){
		
		var empCode = $("input[name=employee_code]").val();
		var monSal = $("input[name=monthly_salary]").val();
		var salary_payDate = new Date().toISOString().slice(0, 10);
		
		var now = new Date();
		var month = now.getMonth();
		var year = now.getFullYear();
		var pay_month = year+"년 "+month+"월분";
		console.log(pay_month);
		
		
		window.location = "employee_paymentAction?employee_code="+empCode+"&monthly_salary="+monSal+"&salary_payDate="+salary_payDate+"&pay_month="+pay_month;
	});
	
	
	// 급여 계약 목록에서 삭제 버튼 클릭시
	$("#contractDel_btn").click(function(){
//		console.log("contractDel_btn click");
//		alert("contractDel_btn click");
		var ContractCode = $("input[name=salary_contract_code]").val();
		console.log("ContractCode : " + ContractCode);
		
		if(ContractCode == '0'){
			
			alert("선택된 항목이 없습니다. 선택 해주세요!");
			
		} else {
		
			// 왜 안먹지???? 아는 사람 알려주라~~~
			if(confirm('삭제하시겠습니까? \n(삭제 후 복구가 불가능합니다.)')){
				console.log("확인");
				
				window.location = "employee_contractDelete?salary_contract_code=" + ContractCode;
			} else {
				console.log("취소");
				return false;
			}
		}
	});
	
});
