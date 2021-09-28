$("document").ready(function() {
	// 유형 클릭
	$("input[name^=slip_type]").click(function() {
		$("input[name^=slip_type]").css("background", "");
		$("input[name^=slip_type]").css("color", "");
		
		var slip_type = $(this).val();
		console.log(slip_type);
		$("#slip_type").val(slip_type);
		$(this).css("background", "#1ab394");
		$(this).css("color", "white");
	});
	
	$("#insertSGA").click(function() {
		
		if($("#slip_type").val() == "") {
			alert("유형을 선택하세요.");
			return false;
		}; 
		
		var slip_regDate = $("input[name=slip_regDate]").val();
		var slip_type = $("#slip_type").val();
		var slip_money = $("input[name=slip_money]").val();
		var slip_memo = $("textarea[name=slip_memo]").val();
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        console.log("header : " + header);
        
         $.ajax({
	       	  url : "insertSlip",
	       	  type : "Post",
	       	  data : "slip_regDate=" + slip_regDate + "&slip_type=" + slip_type 
	       	  			+ "&slip_money=" + slip_money + "&slip_memo=" + slip_memo,
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
	
	$("tr[class^=sga_info]").click(function() {
		$("tr[class^=sga_info]").css("background", "");
		
		$(this).css("background", "#20c997");
		
	});
	
	$("tr[class^=sga_info]").dblclick(function() {
		var popUpWidth = 800;
		var popUpHeight = 800;
		
		var thisTr = $(this);
		var thisTd = $(this).children();
		var slip_code = thisTd.find("input[name^=slip_code]").val();
		console.log(slip_code);
		
		var popupX = (window.screen.width/2) - (popUpWidth/2);
		var popupY = (window.screen.height/2) - (popUpHeight/2);
		console.log("popupX : " + popupX);
		console.log("popupY : " + popupY);
		
		var url = "slip_modify?slip_code=" + slip_code;
			window.open(url, "slip_modify", "status=no, width=800, height=600, left="+ popupX + ", top="+ popupY);
	
	});
	
	// slip_modify 수정 submit 클릭시
	$("#slip_modifyForm").submit(function() {
		var slip_type = $("#slip_type option:selected").val();
		if(slip_type == "0") {
			alert("유형을 선택하세요!");
			return false;
		}
		
	});
	
	$("#deleteBtn").click(function() {
		var slip_code = $("input[name=slip_code]").val();
		if(confirm("삭제하시면 되돌릴 수 없습니다. 삭제 하시겠습니까?")) {
			console.log("확인");
			window.location="slip_deleteAction?slip_code=" + slip_code;
		} else {
			console.log("취소");
			return false;
		}
		
	});
	
	// 목록의 option 선택시
	$("select[name=slip_type]").change(function(){
		
		var selectType = $("select[name=slip_type] option:selected").val();
		console.log("selectType : " + selectType);
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        console.log("header : " + header);
        
         $.ajax({
	       	  url : "slip_List",
	       	  type : "Post",
	       	  data : "slip_type=" + selectType,
       	  	  async: false,	
  			  beforeSend : function(jqXHR, settings) {
	       		  console.log("beforesend 진행");
	                 jqXHR.setRequestHeader(header, token);
	       	  },
	       	  success : function(result) {
	       		  $("#slipList").html(result);
	       	  },
	       	  error : function(error) {
	       		console.log(error);  
	       	  }
         });
	})
	
	$("#Search_content").keyup(function(){
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
		var content = $("#Search_content").val();
		console.log("content : " + content);
		
		$.ajax({
	       	  url : "slip_Search",
	       	  type : "Post",
	       	  data : "search_content=" + content,
     	  	  async: false,	
			  beforeSend : function(jqXHR, settings) {
	       		  console.log("beforesend 진행");
	                 jqXHR.setRequestHeader(header, token);
	       	  },
	       	  success : function(result) {
	       		  $("#slipList").html(result);
	       	  },
	       	  error : function(error) {
	       		console.log(error);  
	       	  }
       });
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
	       	  url : "slip_Search",
	       	  type : "Post",
	       	  data : "search_content=" + content,
     	  	  async: false,	
			  beforeSend : function(jqXHR, settings) {
	       		  console.log("beforesend 진행");
	                 jqXHR.setRequestHeader(header, token);
	       	  },
	       	  success : function(result) {
	       		  $("#slipList").html(result);
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