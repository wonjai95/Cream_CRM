$("document").ready(function() {
	
	function search_ajax(inven_date, keyword) {
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        console.log("header : " + header);
        console.log("token : " + token);
        
        if(inven_date == "" && keyword == ""){
			alert("검색어를 입력하세요.");
		} else {
		
			$.ajax({
		       	  url : "search_periodic_inven",
		       	  type : "Post",
		       	  data : "inven_date=" + inven_date + "&keyword=" + keyword,
				  beforeSend : function(jqXHR, settings) {
		       		  console.log("beforesend 진행");
		                 jqXHR.setRequestHeader(header, token);
		       	  },
		       	  success : function(result) {
		       		  console.log("ajax 전송 성공");
		       		  $(".search_result").html(result);
		       		  console.log("성공");
		       		 
		       	  },
		       	  error : function(error) {
		       		console.log(error);  
		       	  }
			});
		}
	}
	
	// 연월 선택시 검색
	$("body").on("change", "#inven_date", function() {
		var inven_date = $("input[id=inven_date]").val();
		var keyword = $("#keyword").val();
		console.log("inven_date : " + inven_date);
		console.log("keyword : " + keyword);
		
		search_ajax(inven_date, keyword);
		
	});
	
	
	// 검색 버튼 클릭 
	$("body").on("click", "#searchBtn", function() {
		var inven_date = $("input[id=inven_date]").val();
		var keyword = $("#keyword").val();
		console.log("inven_date : " + inven_date);
		console.log("keyword : " + keyword);
		
		search_ajax(inven_date, keyword);
		
	});
	
	
	// 창 닫기
	$("#window_close").click(function() {
		window.close();
	});
	
	
})	
