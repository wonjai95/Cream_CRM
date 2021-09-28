$("document").ready(function(){
	
	// 수정 버튼 클릭시 확인
	$("#modify").submit(function(){
		var result = confirm("수정하시겠습니까?");
		
		if(result){
			return true;
		} else {
			return false;
		}
	});
	
	// 1번 탭을  Ajax 발동
	// var header = 'X-CSRF-TOKEN' 아래 방식이 안 될 경우 이거 사용
	var header = $("meta[name='_csrf_header']").attr("content");
    var token = $("meta[name='_csrf']").attr("content");
    var empCode = $("input[name=employee_code]").val();
    // 현재 날짜의 년도와 월만 표시
    var curMonth = new Date().toISOString().slice(0, 7);
    
    console.log("header : " + header);
    console.log("token : " + token);
    console.log("empCode : " + empCode);
    console.log("currentMonth : " + curMonth);
    
    $.ajax({
       url : "employee_attendanceList",
       type : "Post",
       data : "employee_code="+empCode+"&currentMonth="+curMonth, 
       beforeSend : function(jqXHR, settings) {
          console.log("beforesend 진행");
          jqXHR.setRequestHeader(header, token);
       },
       success : function(result) {
          $(".tab-content").html(result);
       },
       error : function(error) {
      	alert("다시 시도해주세요.");
       }
       
    });
    
	// 1번 탭을 클릭시 Ajax 발동
	$("a[href='#tab-1']").click(function() {
		  console.log("탭1 클릭");
		  
		  // var header = 'X-CSRF-TOKEN' 아래 방식이 안 될 경우 이거 사용
		  var header = $("meta[name='_csrf_header']").attr("content");
	      var token = $("meta[name='_csrf']").attr("content");
	      var empCode = $("input[name=employee_code]").val();
	      var empName = $("input[name=employee_name]").val();
	      var curMonth = new Date().toISOString().slice(0, 7);
	      
	      console.log("header : " + header);
	      console.log("token : " + token);
	      console.log("empCode : " + empCode);
	      console.log("empName : " + empName);
	      console.log("currentMonth : " + curMonth);
	      
	      $.ajax({
	         url : "employee_attendanceList",
	         type : "Post",
	         data : "employee_code="+empCode+"&employee_name="+empName+"&currentMonth="+curMonth,
	         beforeSend : function(jqXHR, settings) {
	            console.log("beforesend 진행");
	            jqXHR.setRequestHeader(header, token);
	         },
	         success : function(result) {
	            $(".tab-content").html(result);
	         },
	         error : function(error) {
	        	alert("다시 시도해주세요.");
	         }
	         
	      });
	   });
	   
    // 2번 탭을 클릭시 Ajax 발동
    $("a[href='#tab-2']").click(function() {
		  console.log("탭2 클릭");
		  
		  // var header = 'X-CSRF-TOKEN' 아래 방식이 안 될 경우 이거 사용
		  var header = $("meta[name='_csrf_header']").attr("content");
	      var token = $("meta[name='_csrf']").attr("content");
	      var empCode = $("input[name=employee_code]").val();
	      var curYear = new Date().toISOString().slice(0, 4);
	      
	      console.log("header : " + header);
	      console.log("token : " + token);
	      console.log("empCode : " + empCode);
	      console.log("curYear : " + curYear);
	      
	      $.ajax({
	         url : "employee_leaveList",
	         type : "Post",
	         data : "employee_code=" + empCode+ "&curYear=" + curYear,
	         beforeSend : function(jqXHR, settings) {
	            console.log("beforesend 진행");
	            jqXHR.setRequestHeader(header, token);
	         },
	         success : function(result) {
	            $(".tab-content").html(result);
	         },
	         error : function(error) {
	        	alert("다시 시도해주세요.");
	         }
	         
	      });
	   });
    
    // 3번 탭을 클릭시 Ajax 발동
    $("a[href='#tab-3']").click(function() {
		  console.log("탭3 클릭");
		  
		  // var header = 'X-CSRF-TOKEN' 아래 방식이 안 될 경우 이거 사용
		  var header = $("meta[name='_csrf_header']").attr("content");
	      var token = $("meta[name='_csrf']").attr("content");
	      var empCode = $("input[name=employee_code]").val();
	      
	      console.log("header : " + header);
	      console.log("token : " + token);
	      console.log("empCode : " + empCode);
	      
	      $.ajax({
	         url : "employee_contractList",
	         type : "Post",
	         data : "employee_code=" + empCode,
	         beforeSend : function(jqXHR, settings) {
	            console.log("beforesend 진행");
	            jqXHR.setRequestHeader(header, token);
	         },
	         success : function(result) {
	            $(".tab-content").html(result);
	         },
	         error : function(error) {
	        	alert("다시 시도해주세요.");
	         }
	         
	      });
	   });
	
	
    // 4번 탭을 클릭시 Ajax 발동
    $("a[href='#tab-4']").click(function() {
		  console.log("탭4 클릭");
		  
		  // var header = 'X-CSRF-TOKEN' 아래 방식이 안 될 경우 이거 사용
		  var header = $("meta[name='_csrf_header']").attr("content");
	      var token = $("meta[name='_csrf']").attr("content");
	      var empCode = $("input[name=employee_code]").val();
	      var curYear = new Date().toISOString().slice(0, 4);
	      
	      console.log("header : " + header);
	      console.log("token : " + token);
	      console.log("empCode : " + empCode);
	      console.log("curYear : " + curYear);
	      
	      $.ajax({
	         url : "employee_paymentList",
	         type : "Post",
	         data : "employee_code=" + empCode+ "&curYear=" + curYear,
	         beforeSend : function(jqXHR, settings) {
	            console.log("beforesend 진행");
	            jqXHR.setRequestHeader(header, token);
	         },
	         success : function(result) {
	            $(".tab-content").html(result);
	         },
	         error : function(error) {
	        	alert("다시 시도해주세요.");
	         }
	         
	      });
	   });
	
});