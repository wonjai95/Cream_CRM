$("document").ready(function(){
	
	//찾기 버튼 클릭
	$("#search_btn").click(function(){
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        console.log("header : " + header);
        
        var option = $("#search_option option:selected").val();
        var keyword = $("input[id=search_key]").val();
        
        console.log("keyword : "+keyword);
        console.log("option : "+option);
        
        //입력창에 아무것도 입력하지 않은경우
        if(keyword == "")
        	alert("검색어를 입력하세요");
        else if(option == "1")
        	alert("검색 옵션을 설정하세요");
        else{
        	
        	$.ajax({
        		url : "review_searchlist",
        		type: "post",
        		data : "option="+option+"&keyword="+keyword,
        		async: false,	
				beforeSend : function(jqXHR, settings) {
		       	  console.log("beforesend 진행");
		               jqXHR.setRequestHeader(header, token);
		       	},
		       	success : function(result){
		       		$("#reviewList").html(result);
		       		console.log("success");
		       		
		       	},
		       	error : function(error){
		       		console.log(error);
		       	}
        		
        	});
        }
	}); // 검색 end
	
	
});