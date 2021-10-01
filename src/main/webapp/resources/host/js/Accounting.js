/**
 * 
 */

$("document").ready(function(){
	$("a[href='#tab-2']").click(function(){
		alert("클릭");
		
		var header = $("meta[name='_csrf_header']").attr("content");
	    var token = $("meta[name='_csrf']").attr("content");
	    // 현재 날짜의 년도와 월만 표시
	    var curMonth = new Date().toISOString().slice(0, 7);
	    
	    console.log("header : " + header);
	    console.log("token : " + token);
	    // console.log("empCode : " + empCode);
	    console.log("currentMonth : " + curMonth);
	    
	    $.ajax({
	       url : "settlement",
	       type : "Post",
	       data : "currentMonth="+curMonth, 
	       beforeSend : function(jqXHR, settings) {
	          console.log("beforesend 진행");
	          jqXHR.setRequestHeader(header, token);
	       },
	       success : function(result) {
	          $("#tab-2").html(result);
	       },
	       error : function(error) {
	      	alert("다시 시도해주세요.");
	       }
	       
	    });
	});
});