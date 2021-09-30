<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/setting_tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("input[type=checkbox]").click(function(){
			var chk = $(this).is(":checked");
			if(chk == true){
				$(this).nextAll().removeAttr("disabled");
			}else{
				$(this).nextAll().attr("disabled", "disabled");
			}
		});
		
		
		$("#setTimeBtn").click(function(){
			var timeFrm = $("#timeFrm").serialize();
			var header = $("meta[name='_csrf_header']").attr("content");
			var token = $("meta[name='_csrf']").attr("content");
			
			var chkLen = $("input:checkbox[name=day]:checked").length;
			if(chkLen == 0){
				alert("시간설정할 항목을 선택하세요");
				return;
			}
			
			var validate = true;
			
			$("input:checkbox[name=day]:checked").each(function(){
				if(!$(this).next().next().val()){
					alert($(this).next().text() + " 출근시간을 입력하세요");
					$(this).next().next().focus();
					validate = false;
					return validate;
				}else if(!$(this).next().next().next().val()){
					alert($(this).next().text() + " 퇴근시간을 입력하세요");
					$(this).next().next().next().focus();
					validate = false;
					return validate;
				}
			});
			
			if(validate == true){
				$.ajax({
					type : "post",
					url : "setWorkTime",
					data : timeFrm,
					beforeSend : function(jqXHR, settings) {
						jqXHR.setRequestHeader(header, token);
					},
					async : false,
					success : function(response) {
						alert("시간이 설정되었습니다.");
						$("#workTimes").html(response);
					},
					error : function() {
						alert("에러");
					}
				});
			}
			
		});
		
		
	});
	
</script>
</head>
<body>
	
	 <form id="timeFrm">
	<!--  <form action="setWorkTime" method="post" onsubmit="return chkform();"> -->
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		        <c:forEach var="day" items="${dayList}" varStatus="i">
					<div class="form-group" style="font-size: 20px;">
						 <input type="checkbox" name="day" value="${i.index + 1}">
						 <label>${day}</label>
						 <input type="time" name="open" disabled="disabled" value="${operArray[i.index].open_sche}">
						  ~ 
						 <input type="time" name="close" disabled="disabled" value="${operArray[i.index].close_sche}">
					</div>
					<br/>
				</c:forEach>
	        <div>
	            <button class="btn btn-sm btn-primary m-t-n-xs" type="button" id="setTimeBtn"><strong>시간 설정</strong></button>
	        </div>
	    </form>
</body>
</html>