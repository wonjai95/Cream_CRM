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
	
	$("tr[id^=index_]").click(function(){
		$("tr[id^=index_]").css("background","");
		
		var thisTr = $(this);
	    var thisTd = $(this).children();
	    
	    var title = thisTd.find("input[name^=h_title]").val();
	    
	    console.log("title : "+title);
	    window.location = "playlist_py2?keyword="+title;
	})
	
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
	        <h2>트렌드</h2>
	        <ol class="breadcrumb">
	            <li class="breadcrumb-item">
	                <a href="home">Home</a>
	            </li>
	            <li class="breadcrumb-item">
	                Trend
	            </li>
	            <li class="breadcrumb-item active">
	                <strong>플레이리스트</strong>
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
		                    	<form action="#" method="get">
			                        <div class="form-group" style="display:flex; width: 1500px;">
			                        	<div style="margin-right: 40px;">
				                        	<div style="margin-bottom: 20px;">
				                        		<h1 style="color: black;">현재 플레이 리스트 : ${first_title}</h1>
				                        	</div>
				                        	<div>
				                        		<iframe name="melon_window" src="${url_list.get(0)}" style="width: 800px; height: 600px; border: 2px solid black; box-shadow: 5px 5px black;"></iframe>
				                        	</div>
			                        	</div>
			                        	
			                        	<div style="width: 600px; margin-top: 50px;">
			                        		<h2>현재 플레이 리스트 기반 추천 플레이 리스트</h2>
			                        		<br><br>
			                        		<table>
					                        	<c:forEach var="str" items="${url_list}" varStatus="i">
					                        	<c:if test="${i.index != 0}">
					                        	<tr id="index_${i.index}">
					                        		<td>
					                        		<input type="hidden" name="h_title${i.index}" value="${title_list[i.index]}">
						                        		<div style="margin-bottom: 10px;">
						                        			<a href="${str}" target="melon_window" style="text-decoration: none; color: #0E7D48"><span style="font-size: 20px;">${i.index}&nbsp;&nbsp;&nbsp;&nbsp;${title_list[i.index]}</span></a>
						                        		</div>
					                        		</td>
					                        	</tr>
					                        	</c:if>
					                        	</c:forEach>
				                        	</table>
			                        	</div>
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