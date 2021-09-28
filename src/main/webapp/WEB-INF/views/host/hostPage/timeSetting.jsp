<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	});
	
	function chkform(){
		var days = document.getElementsByName("day");
		var chk = false;
		
		for (var i = 0; i < days.length; i++) {
			if (days[i].checked == true) {
				chk = true;
				break;
			}
		}
		if(!chk){
			alert("시간설정할 항목을 선택해주세요.");
			return false;
		}
	}
	
</script>
</head>
<body>

	<div class="ibox-content">
	    <h2>
	    	근무시간 설정
	    </h2>
	    <p class="font-bold">근무시간 설정</p>
	    
	    <form action="setWorkTime" method="post" onsubmit="return chkform();">
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		        <c:forEach var="day" items="${dayList}" varStatus="i">
					<div class="form-group" style="font-size: 20px;">
						 <input type="checkbox" name="day" value="${i.index + 1}">
						 <label>${day}</label>
						 <input type="time" name="open" disabled="disabled" required="required" value="${operArray[i.index].open_sche}">
						  ~ 
						 <input type="time" name="close" disabled="disabled" required="required" value="${operArray[i.index].close_sche}">
					</div>
					<br/>
				</c:forEach>
	        <div>
	            <button class="btn btn-sm btn-primary m-t-n-xs" type="submit"><strong>시간 설정</strong></button>
	        </div>
	    </form>
	</div>


</body>
</html>