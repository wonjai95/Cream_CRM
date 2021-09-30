<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: white;
}

#g_product {
	text-shadow: aqua;
}
</style>
<script type="text/javascript" >
$("document").ready(function() {

	$("#NOL_modifyForm").submit(function() {
		var slip_type = $("#NOL_type option:selected").val();
		if(slip_type == "0") {
			alert("유형을 선택하세요!");
			return false;
		}
		
	});
	
	$("#NOLdeleteBtn").click(function() {
		var slip_code = $("input[name=NOL_code]").val();
		if(confirm("삭제하시면 되돌릴 수 없습니다. 삭제 하시겠습니까?")) {
			console.log("확인");
			window.location="NOL_deleteAction?NOL_code=" + slip_code;
		} else {
			console.log("취소");
			return false;
		}
		
	});
	
	// 창 닫기 클릭
	$("input[name=detail_close]").click(function() {
		window.close();
	});
	
})


</script>
</head>
<body>
	<div class="ibox-content">
		<h3 style="font-size: 20px;">전표 입력</h3>
		<hr>
		<p class="small">비용,수익,법인세등을 적어주세요.</p>
		<br>

		<form action="NOL_modifyAction" method="post" id="NOL_modifyForm">
			<sec:csrfInput />
			<input type="hidden" value="${dto.slip_code}" name="NOL_code">
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">날짜</label>
				<div class="col-sm-7">
					<input type="date" class="form-control" name="NOL_regDate"
						value="${dto.slip_regDate}" required style="width: 60%">
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">유형</label>
				<div class="col-sm-7">
					<select class="form-control-sm form-control input-s-sm inline"
						name="NOL_type" id="NOL_type" style="width: 60%;">
						<option value="0">유형 선택</option>
						<option value="비용">비용</option>
						<option value="수익">수익</option>
						<option value="법인세등">법인세등</option>
					</select>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">금액</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="NOL_money"
						value="<fmt:formatNumber value='${dto.slip_money}' pattern="###,###,###" />"
						required>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">메모</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="NOL_memo"
						value="${dto.slip_memo}" required>
				</div>
			</div>

			<!-- 등록 및 창 닫기 버튼 시작 -->
			<div class="hr-line-dashed"></div>
			<div class="col-sm-7">
				<div class="form-group" style="text-align: right;">
					<input type="submit" class="btn btn-primary dim"
						style="width: 100px;" value="수정"> <input type="button"
						id="NOLdeleteBtn" class="btn btn-primary dim" style="width: 100px;"
						value="삭제"> <input type="button"
						class="btn btn-primary dim" name="detail_close"
						style="width: 100px;" value="창닫기">
				</div>
			</div>
			<!-- 등록 및 창 닫기 버튼 끝 -->
		</form>
	</div>
</body>
</html>