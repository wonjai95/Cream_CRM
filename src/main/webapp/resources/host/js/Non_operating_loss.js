/**
 * 
 */

$("document").ready(function() {
	
	// 1번 탭을  Ajax 발동
	// var header = 'X-CSRF-TOKEN' 아래 방식이 안 될 경우 이거 사용
	var header = $("meta[name='_csrf_header']").attr("content");
    var token = $("meta[name='_csrf']").attr("content");
    
    console.log("header : " + header);
    console.log("token : " + token);
    
    $.ajax({
       url : "Non_operating_loss",
       type : "Post",
       beforeSend : function(jqXHR, settings) {
          console.log("beforesend 진행");
          jqXHR.setRequestHeader(header, token);
       },
       success : function(result) {
          $("#operlossList").html(result);
       },
       error : function(error) {
      	alert("다시 시도해주세요.");
       }
       
    });
	
		
	// 유형 클릭
	$("input[name^=operloss_type]").click(function() {
		$("input[name^=operloss_type]").css("background", "");
		$("input[name^=operloss_type]").css("color", "");
		
		var operloss_type = $(this).val();
		console.log(operloss_type);
		$("#operloss_type").val(operloss_type);
		$(this).css("background", "#1ab394");
		$(this).css("color", "white");
	});
	
	$("#insertNOL").click(function() {
		
		if($("#operloss_type").val() == "") {
			alert("유형을 선택하세요.");
			return false;
		}; 
		
		var operloss_regDate = $("input[name=operloss_regDate]").val();
		var operloss_type = $("#operloss_type").val();
		var operloss_money = $("input[name=operloss_money]").val();
		var operloss_memo = $("textarea[name=operloss_memo]").val();
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        console.log("header : " + header);
        
         $.ajax({
	       	  url : "insertNOL",
	       	  type : "Post",
	       	  data : "operloss_regDate=" + operloss_regDate + "&operloss_type=" + operloss_type 
	       	  			+ "&operloss_money=" + operloss_money + "&operloss_memo=" + operloss_memo,
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
	
	// ajax로 innerhtml한 값들의 경우 자바스크립트 적용이 어렵다... 따라서, on을 이용해서 미래의 즉, 다음 jsp에도 같은 function을 적용 시키는 방법으로 진행
	$("table").on("click", "tr[class^=NOL_info]", function(){
		$("tr[class^=NOL_info]").css("background", "");
		
		$(this).css("background", "#20c997");
	});
	
	$("table").on("dblclick", "tr[class^=NOL_info]", function(){
		var popUpWidth = 800;
		var popUpHeight = 800;
		
		var thisTr = $(this);
		var thisTd = $(this).children();
		var NOL_code = thisTd.find("input[name^=NOL_code]").val();
		console.log(NOL_code);
		
		var popupX = (window.screen.width/2) - (popUpWidth/2);
		var popupY = (window.screen.height/2) - (popUpHeight/2);
		console.log("popupX : " + popupX);
		console.log("popupY : " + popupY);
		
		var url = "NOL_modify?NOL_code=" + NOL_code;
			window.open(url, "NOL_modify", "status=no, width=800, height=600, left="+ popupX + ", top="+ popupY);
	});
	
	/*
	$("tr[class^=NOL_info]").click(function() {
		$("tr[class^=NOL_info]").css("background", "");
		
		$(this).css("background", "#20c997");
		
	});
	
	$("tr[class^=NOL_info]").dblclick(function() {
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
	*/
	// slip_modify 수정 submit 클릭시
	$("#NOL_modifyForm").submit(function() {
		var slip_type = $("#NOL_type option:selected").val();
		if(slip_type == "0") {
			alert("유형을 선택하세요!");
			return false;
		}
		
	});
	
	$("#NOLdeleteBtn").click(function() {
		var slip_code = $("input[name=NOL_code]").val();
		if(confirm("삭제하시면 되돌릴 수 없습니다. 삭제 하시겠습니까?")) {
			console.log("확인");
			window.location="NOL_deleteAction?NOL_code=" + slip_code;
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
	
	var timeout = null;
	
	$("#Search_content").keyup(function(){
		
		clearTimeout = null;
		
		timeout = setTimeout(function(){
			
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
	$("input[name=detail_close]").click(function() {
		window.close();
	});
	
	
});