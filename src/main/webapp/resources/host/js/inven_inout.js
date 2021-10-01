$("document").ready(function() {
	// 재고 탭 더블 클릭시 입고 탭 오픈
	$("body").on("dblclick", "tr[name^=inven_inout]", function() {
		$("tr[name^=inven_inout]").css("background", "");
		
		var thisTr = $(this);
		var thisTd = $(this).children();
		var stock_code = thisTd.find("input[name^=stock_code]").val();
		var stock_name = thisTd.find("input[name^=stock_name]").val();
		console.log("stock_code : " + stock_code);
		console.log("stock_name : " + stock_name);
		
		var url = "add_invenInout?stock_code=" + stock_code + "&stock_name=" + stock_name;
		window.open(url, "add_invenInout", "menubar=no, width=800, height=800");
		
		$(this).css("background", "#20c997");
	});
	
	
	// 검색
	$("body").on("click", "#invenSearchBtn", function() {
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
       
        var keyword = $("#keyword").val();
        
        if(keyword == "" || keyword == null){
			alert("검색어를 입력하세요.");
		} else {
		
			$.ajax({
		       	  url : "search_inout",
		       	  type : "Post",
		       	  data : "keyword=" + keyword,
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
		
	});
	
	// 매입 수량 * 매입가 계산
	function calInvenPrice() {
		var price = $("input[name=stock_pur_price]").val();
		var cnt = $("input[name=stock_pur_cnt]").val();
		console.log("price : " + price);
		console.log("cnt : " + cnt);
		
		var result = parseInt(price) * parseInt(cnt);
		$("input[name=stock_pur_cal]").val(result);
		
	}
	
	// 매입수량 입력
	$("#add_invenInoutForm").on("change", "input[name=stock_pur_cnt]", function() {
		calInvenPrice();
	});
	
	// 매입가 입력
	$("#add_invenInoutForm").on("change", "input[name=stock_pur_price]", function() {
		calInvenPrice();
	});
	
	
	// 창 닫기 버튼 클릭
	$("input[name=window_close]").click(function() {
		window.self.close();
	});
	
});