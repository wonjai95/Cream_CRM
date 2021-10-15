<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewML.jsp</title>
<link rel="stylesheet" href="${path}/resources/host/css/confirmIdAction.css">
<script type="text/javascript">
$("document").ready(function(){
	// 확인 버튼 클릭시 창 닫기
	$("#confirmform").on("click", "#cancelAllBtn", function() {
		window.close();
	});

	
})

</script>

</head>
<body>
<form action="employee_IdChkAction" method="post" name="confirmform" id="confirmform"
	style="margin-top: 30px; text-align: -webkit-center;">
   
	<table>
		<tr align="center">
			<td colspan="2">
				분석 결과 : <span>${predict}</span>
			</td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<input type="button" class="inputButton" value="확인" id="cancelAllBtn">
			</th>
		</tr>
	</table>


</form>
</body>
</html>