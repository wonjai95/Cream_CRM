$("document").ready(function(){
   
   $("#top-search").click(function() {
      console.log("focus in");
      $(this).css("background", "#c0c0c0");
   });
   
   $("input[name=top-search]").blur(function() {
      console.log("focus out");
      $(this).css("background", "#f3f3f4");
   });
   
   // 검색
   $("#top-search").keypress(function(key) {
      if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
         var header = $("meta[name='_csrf_header']").attr("content");
          var token = $("meta[name='_csrf']").attr("content");
           
           // 검색어
           var keyword = $("#top-search").val();
           console.log(keyword);
           $.ajax({
              url : "searchHostList",
              type : "Post",
              data : "keyword=" + keyword,
//              async: false,
              beforeSend : function(jqXHR, settings) {
                 console.log("beforesend 진행");
                   jqXHR.setRequestHeader(header, token);
              },
              success : function(result) {
                 $("#hostList").html(result);
              },
              error : function(error) {
               console.log(error);  
               $("#hostList").html("검색하신 내용에 일치하는 결과가 존재하지 않습니다.");
              }
           });
        }
      
   });
   
   
});