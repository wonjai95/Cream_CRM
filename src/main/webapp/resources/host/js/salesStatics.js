$("document").ready(function() {
   // 2번 탭 클릭시 ajax 발동
   $("a[href='#tab-2']").click(function() {
	  console.log("탭2 클릭");
	  
	  // var header = 'X-CSRF-TOKEN' 아래 방식이 안 될 경우 이거 사용
	  var header = $("meta[name='_csrf_header']").attr("content");
      var token = $("meta[name='_csrf']").attr("content");
      console.log("header : " + header);
      console.log("token : " + token);

      $.ajax({
         url : "managerSalesStatics",
         type : "Post",
         beforeSend : function(jqXHR, settings) {
            console.log("beforesend 진행");
            jqXHR.setRequestHeader(header, token);
         },
         success : function(result) {
            $(".tab-content").html(result);
         },
         error : function(error) {
        	alert("다시 시도해주세요.");
        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            window.history.back();
         }
         
      });
   });
   
});
