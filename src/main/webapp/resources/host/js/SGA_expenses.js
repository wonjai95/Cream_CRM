$("document").ready(function() {
	
	var insertDay = '1';
	var currentDay = new Date().toISOString().slice(8, 10);
	console.log(currentDay);
	
	if(currentDay == insertDay){
		alert("insert 해라!");
	} 

	// 유형 클릭
	$("input[name^=SGA_type]").click(function() {
		$("input[name^=SGA_type]").css("background", "");
		$("input[name^=SGA_type]").css("color", "");
		
		var SGA_type = $(this).val();
		console.log(SGA_type);
		$("#SGA_type").val(SGA_type);
		$(this).css("background", "#1ab394");
		$(this).css("color", "white");
	});
	
	$("#insertSGA").click(function() {
		
		if($("#SGA_type").val() == "") {
			alert("유형을 선택하세요.");
			return false;
		}; 
		
		var SGA_regDate = $("input[name=SGA_regDate]").val();
		var SGA_type = $("#SGA_type").val();
		var SGA_money = $("input[name=SGA_money]").val();
		var SGA_memo = $("textarea[name=SGA_memo]").val();
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        console.log("header : " + header);
        
         $.ajax({
	       	  url : "insertSGA",
	       	  type : "Post",
	       	  data : "SGA_regDate=" + SGA_regDate + "&SGA_type=" + SGA_type 
	       	  			+ "&SGA_money=" + SGA_money + "&SGA_memo=" + SGA_memo,
       	  	  async: false,	
  			  beforeSend : function(jqXHR, settings) {
	       		  console.log("beforesend 진행");
	                 jqXHR.setRequestHeader(header, token);
	       	  },
	       	  success : function(result) {
	       		  console.log("result : " + result);
	       		  if(result == "1") {
	       			  alert("판관비가 등록되었습니다.");
	       			  window.location.reload();
	       		  } else {
	       			alert("판관비 등록에 실패했습니다.");
	       		  }
	       		 
	       	  },
	       	  error : function(error) {
	       		console.log(error);  
	       	  }
         });
		
	});
	
	
	$("table").on("click", "tr[class^=SGA_info]", function() {
		$("tr[class^=SGA_info]").css("background", "");
		
		$(this).css("background", "#20c997");
		
	});
	
	$("table").on("dblclick", "tr[class^=SGA_info]", function(){
		var popUpWidth = 800;
		var popUpHeight = 800;
		
		var thisTr = $(this);
		var thisTd = $(this).children();
		var SGA_code = thisTd.find("input[name^=slip_code]").val();
		console.log(SGA_code);
		
		var popupX = (window.screen.width/2) - (popUpWidth/2);
		var popupY = (window.screen.height/2) - (popUpHeight/2);
		console.log("popupX : " + popupX);
		console.log("popupY : " + popupY);
		
		var url = "SGA_modify?SGA_code=" + SGA_code;
			window.open(url, "SGA_modify", "status=no, width=800, height=600, left="+ popupX + ", top="+ popupY);
	});
	
	/*
	$("tr[class^=SGA_info]").dblclick(function() {
		var popUpWidth = 800;
		var popUpHeight = 800;
		
		var thisTr = $(this);
		var thisTd = $(this).children();
		var SGA_code = thisTd.find("input[name^=slip_code]").val();
		console.log(SGA_code);
		
		var popupX = (window.screen.width/2) - (popUpWidth/2);
		var popupY = (window.screen.height/2) - (popUpHeight/2);
		console.log("popupX : " + popupX);
		console.log("popupY : " + popupY);
		
		var url = "SGA_modify?SGA_code=" + SGA_code;
			window.open(url, "SGA_modify", "status=no, width=800, height=600, left="+ popupX + ", top="+ popupY);
	
	});
	*/
	
	// SGA_modify 수정 submit 클릭시
	$("#SGA_modifyForm").submit(function() {
		var SGA_type = $("#SGA_type option:selected").val();
		if(SGA_type == "0") {
			alert("유형을 선택하세요!");
			return false;
		}
		
	});
	
	$("#deleteBtn").click(function() {
		var SGA_code = $("input[name=SGA_code]").val();
		if(confirm("삭제하시면 되돌릴 수 없습니다. 삭제 하시겠습니까?")) {
			console.log("확인");
			window.location="SGA_deleteAction?SGA_code=" + SGA_code;
		} else {
			console.log("취소");
			return false;
		}
		
	});
	
	// 목록의 option 선택시
	$("select[name=SGA_type]").change(function(){
		
		var selectType = $("select[name=SGA_type] option:selected").val();
		console.log("selectType : " + selectType);
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        console.log("header : " + header);
        
         $.ajax({
	       	  url : "SGA_List",
	       	  type : "Post",
	       	  data : "SGA_type=" + selectType,
       	  	  async: false,	
  			  beforeSend : function(jqXHR, settings) {
	       		  console.log("beforesend 진행");
	                 jqXHR.setRequestHeader(header, token);
	       	  },
	       	  success : function(result) {
	       		  $("#SGAList").html(result);
	       	  },
	       	  error : function(error) {
	       		console.log(error);  
	       	  }
         });
	})
	
	var timeout = null;
	
	$("#Search_content").keyup(function(){
		
		clearTimeout = null;
		
		timeout = setTimeout(function(){
			
			var header = $("meta[name='_csrf_header']").attr("content");
		    var token = $("meta[name='_csrf']").attr("content");
			var content = $("#Search_content").val();
			console.log("content : " + content);
			
			$.ajax({
		       	  url : "SGA_Search",
		       	  type : "Post",
		       	  data : "search_content=" + content,
		 	  	  async: false,
				  beforeSend : function(jqXHR, settings) {
		       		  console.log("beforesend 진행");
		                 jqXHR.setRequestHeader(header, token);
		       	  },
		       	  success : function(result) {
		       		  $("#SGAList").html(result);
		       	  },
		       	  error : function(error) {
		       		console.log(error);  
		       	  }
		   });
		}, 900);
	})
	
	/*
	// 검색 버튼 클릭시
	$("input[id=Search_btn]").click(function(){
		alert("검색");
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
		var content = $("#Search_content").val();
		console.log("content : " + content);
		
		$.ajax({
	       	  url : "SGA_Search",
	       	  type : "Post",
	       	  data : "search_content=" + content,
     	  	  async: false,	
			  beforeSend : function(jqXHR, settings) {
	       		  console.log("beforesend 진행");
	                 jqXHR.setRequestHeader(header, token);
	       	  },
	       	  success : function(result) {
	       		  $("#SGAList").html(result);
	       	  },
	       	  error : function(error) {
	       		console.log(error);  
	       	  }
       });
	});
	*/
	// 창 닫기 클릭
	$("input[name=window_close]").click(function() {
		window.close();
	});
	
	
});

