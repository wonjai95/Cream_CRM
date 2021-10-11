<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>employee</title>

<script type="text/javascript">

$("document").ready(function() {
	$("input[name=search_keyword]").change(function() {
		
		
	/* 	$("#keyword").attr('href', 'http://192.168.219.101:5000/instaCrawling/' + keyword);
		console.log($("#keyword").attr('href')); */
		
	});
	
	$("#snsSearchBtn").click(function() {
		var keyword = $("input[name=search_keyword]").val();
		
		var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        
        $.ajax({
	       	  url : "snsCrawling_test",
	       	  type : "Get",
	       	  data : "keyword=" + keyword,
			  beforeSend : function(jqXHR, settings) {
	       		  console.log("beforesend 진행");
                  jqXHR.setRequestHeader(header, token);
	       	  },
	       	  success : function(result) {
	       		  setTimeout(function() {
       				  $("#snsWordCloud").html(result); 
	   	       		  console.log("성공");
	   	       		  $("#snsWordCloud").ajax.reload(null, false);
	       		  }, 25000);
	       	  },
	       	  error : function(error) {
	       		console.log(error);  
	       	  }
		});
	});
	
});

</script>

</head>
<body>
<div id="wrapper">

	<!-- frame  -->
	<jsp:include page="../Frame.jsp" />
	
	<div id="page-wrapper" class="gray-bg">
	
		<!-- nav bar  -->
		<jsp:include page="../navbar.jsp" />
		
	<!-- 직원 -->
	<div class="row wrapper border-bottom white-bg page-heading">
	    <div class="col-lg-8">
	        <h2>직원관리</h2>
	        <ol class="breadcrumb">
	            <li class="breadcrumb-item">
	                <a href="index.html">Home</a>
	            </li>
	            <li class="breadcrumb-item">
	                Extra pages
	            </li>
	            <li class="breadcrumb-item active">
	                <strong>Calendar</strong>
	            </li>
	        </ol>
	    </div>
	</div>
	<div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
	        <div class="col-lg-12">
	        <div class="ibox ">
	            <div class="ibox-title" style="padding-right: 15px;">
	                <!-- 검색 시작 -->
	                 <div class="ibox-content m-b-sm border-bottom">
		                <div class="row">
		                    <div class="col-sm-4">
		                    	<form action="http://192.168.219.101:5000/instaCrawling/" method="get">
			                        <div class="form-group">
			                            <label class="col-form-label" for="employee_code">SNS 키워드 검색</label>
			                            <input type="text" class="form-control" id="search_keyword" name="search_keyword" placeholder="키워드" >
			                            <input type="button" name="snsSearchBtn" id="snsSearchBtn" value="검색">
			                        </div>
		                        </form>
		                    </div>
		            </div>
		             <!-- 검색 끝 -->   
	            </div>
	            <!-- 웹 크롤링 이미지 -->
	            <div class="ibox-content" style="border: none;" id="snsWordCloud">
	            	<img src="" id="snsImage">
	            </div>
	        </div>
	    </div>
	    </div>
	</div>
	</div>
	</div>
</div>

</body>
</html>