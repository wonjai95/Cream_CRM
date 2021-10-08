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
<script type="text/javascript" src="${path}/resources/host/js/employee_leaveList.js"></script>
<script>
$("document").ready(function(){
	$("#YEAR").change(function(){
		
		var header = $("meta[name='_csrf_header']").attr("content");
	    var token = $("meta[name='_csrf']").attr("content");
	    var empCode = $("input[name=employee_code]").val();
		var changeYear = $("#YEAR").val();
		
		console.log("empCode : " + empCode);
		console.log("changeYear : " + changeYear);
		
		$.ajax({
			url : "annual_leaveList",
			type : "Post",
			data : "employee_code="+empCode+"&changeAnnual="+changeYear,
			beforeSend : function(jqXHR, settings) {
		          console.log("beforesend 진행");
		          jqXHR.setRequestHeader(header, token);
		    },
		    success : function(result){
		    	$("#leaveList").html(result);
		    },
		    error : function(error){
		    	alert("다시 시도해주세요.");
		    }
		});
		
	});
});
</script>
</head>
<body>
<!-- 휴가탭 시작 -->
<div id="tab-2" class="tab-pane active">
    <div class="panel-body">
	
	<input type="hidden" name="employee_code" value="${employee_code}">
	<input type="hidden" name="leave_code" value="0">
    
    <form id="leaveform">
	    <!-- 월선택 달력!!! -->
		<div class="form-group" id="data_4" style="width:13%; margin-bottom:10px; display:inline-block;">
			<div class="input-group date">
		 		 <input type="hidden" id="curYear" value="${curYear}">
			  	 <select name="YEAR" id="YEAR" title="년도" class="form-control"></select>
		    </div>
		</div>
	
		<div class="round-btn" style="display:inline-block; float:right;">
			<a class="btn btn-default btn-rounded" id="leaveUpd_btn">수정</a>
			<a class="btn btn-default btn-rounded" id="leaveDel_btn">삭제</a>
		</div>
	</form>
	
		<fieldset>
		    <table class="table table-bordered" style="font-size:12px; text-align:center;">
				<thead>
					<tr>
						<!-- 여기 파트 보면 비타민에 사유가 있는데 기타메모에 합치는건 어떨까??? -->
						<th style="width:7%;">구분</th>
						<th style="width:7%;">상태</th>
						<th style="width:9%;">시작일자</th>
						<th style="width:9%;">종료일자</th>
						<th style="width:6%">사용일수</th>
						<th style="width:10%;">비상연락망</th>
						<th>기타메모</th>
						<th style="width:9%;">신청일자</th>
					</tr>
				</thead>
				
				<tbody id=leaveList>
					<c:forEach var="list2" items="${leaveList}">
						<tr class="leave">
						    <td>
						    	● 연차
						    	<input type="hidden" name="leave_cd" value="${list2.leave_code}">
						    </td>
						    <td>승인</td>
						    <td>${list2.leave_date}</td>
							<td>${list2.leave_end}</td>
							<td>${list2.leave_usage_cnt}</td>
							<td>${list2.emergency_contact}</td>
							<td>
								<c:if test="${list2.leave_memo == '0'}">
									-
								</c:if>
								
								<c:if test="${list2.leave_memo != '0'}">
									${list2.leave_memo}
								</c:if>
							</td>
							<td>${list2.leave_regDatae}</td>
						</tr>
					</c:forEach>
	            </tbody>
	       </table>
		</fieldset>
    </div>
</div>
<!-- 휴가 탭 끝 -->
</body>
</html>