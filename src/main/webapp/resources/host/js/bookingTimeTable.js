$(document).ready(function() {
	
    // 시간 선택
    $("button[id^=timeBtn]").click(function() {
       var timeClick = $(this).attr('value');
       $('#selectTime').val(timeClick);
       $('.timeSelectedInfo').html(timeClick);
       
       // 선택한 시간과 요일
       var selectDate = $("input[name=selectDate]").val();
       var selectTime =  $('#selectTime').val();
       var selectDay =  $("#chkDay").val();
       console.log("selectDate : " + selectDate);
       console.log("selectDay : " + selectDay + ", selectTime : " + selectTime);
       var host_code = $("input[name=host_code]").val();
       
       var header = $("meta[name='_csrf_header']").attr("content");
       var token = $("meta[name='_csrf']").attr("content");
       console.log("header : " + header);
       console.log("token : " + token);
       
       $.ajax({
     	  url : "managerTimeTable",
     	  type : "Post",
     	  data : "selectDay=" + selectDay + "&selectTime=" + selectTime + "&host_code=" + host_code
     	  			+ "&selectDate=" + selectDate,
     	  beforeSend : function(jqXHR, settings) {
     		  console.log("beforesend 진행");
               jqXHR.setRequestHeader(header, token);
     	  },
     	  success : function(result) {
     		  $("#managerTable").html(result);
     	  },
     	  error : function(error) {
     		console.log(error);  
     		$("#managerTable").html("예약 가능한 담당자가 없습니다.");
     	  }
     	  
       });
       
       
       
    });
    
    
    
});