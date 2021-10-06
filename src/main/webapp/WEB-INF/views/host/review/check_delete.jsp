<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>check_delete</title>
<link rel="stylesheet" href="${path}/resources/host/css/deleteOutreview.css">
<script type="text/javascript">

function input_valuecode(){
	
	document.confirmform.outReview_hiddencode.value = opener.document.getElementById('delete_code').value;
	
}



$("document").ready(function(){
	// 취소 버튼 클릭시 창 닫기
	$("#confirmform").on("click", "#cancelBtn", function() {
		window.close();
	});

})



</script>

</head>
<body>
<form action="delete_outReviewAction" method="post" name="confirmform" id="confirmform"
	style="margin-top: 30px; text-align: -webkit-center;">
	<input type="hidden" value="" name="outReview_hiddencode" >
   
<sec:csrfInput/>
		<table>
			<tr>
				<th colspan="2" align="center">
					<span>삭제하시겠습니까?</span>
				</th>			
			</tr>
			<tr>
				<th colspan="2" align="center">
					<input type="submit" onclick="input_valuecode();" class="inputButton" id="idChkBtn2" value="확인">
					<input type="reset" class="inputButton" id="cancelBtn" value="취소">
				</th>
			</tr>
		</table>
	

</form>
</body>
</html>