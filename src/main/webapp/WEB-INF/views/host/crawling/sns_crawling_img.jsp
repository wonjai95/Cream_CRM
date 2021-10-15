<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting_tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <script>
$("document").ready(function() {
	var header = $("meta[name='_csrf_header']").attr("content");
    var token = $("meta[name='_csrf']").attr("content");
    
    $.ajax({
       	  url : "just_img",
       	  type : "Get",
		  beforeSend : function(jqXHR, settings) {
       		  console.log("beforesend 진행");
              jqXHR.setRequestHeader(header, token);
       	  },
       	  success : function(result) {
       		  $("#snsWordCloud2").html(result);
       		  console.log("성공");
       		 
       	  },
       	  error : function(error) {
       		console.log(error);  
       	  }
	});
	
	
	
});
</script> -->
</head>
<body>
<div class="ibox-content" style="border: none;" id="snsWordCloud">
	<img src="${path}/resources/images/crawling/Finally_wordcloud.jpg" width="800px;">            
</div>
</body>
</html>