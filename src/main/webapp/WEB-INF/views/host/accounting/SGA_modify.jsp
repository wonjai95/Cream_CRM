<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>slip_modify.jsp</title>
<style type="text/css">
body {
	background-color: white;
}

#g_product {
	text-shadow: aqua;
}
</style>
<script type="text/javascript" src="${path}/resources/host/js/SGA_expenses1.js"></script>
</head>
<body>
	<div class="ibox-content">
		<h3 style="font-size:20px;">전표 입력</h3>
   			<hr>
            <p class="small">
                            복리후생비,소모품비,수수료비용을 적어주세요.
            </p><br>
	
		<form action="SGA_modifyAction" method="post" id="SGA_modifyForm">
			<sec:csrfInput/>
			<input type="hidden" value="${dto.slip_code}" name="SGA_code">
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">날짜</label>
				<div class="col-sm-7">
					<input type="date" class="form-control" name="SGA_regDate" 
						value="${dto.slip_regDate}" required style="width: 60%">
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">유형</label>
				<div class="col-sm-7">
					<select class="form-control-sm form-control input-s-sm inline" name="SGA_type" id="SGA_type" style="width:60%; ">
					   <option value="0">유형 선택</option>
	                   <option value="복리후생비">복리후생비</option>
	                   <option value="수수료비용">수수료비용</option>
	                   <option value="소모품비">소모품비</option>
	               </select>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">금액</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="SGA_money" 
						value="<fmt:formatNumber value='${dto.slip_money}' pattern="###,###,###" />" required>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">메모</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="SGA_memo" 
						value="${dto.slip_memo}" required>
				</div>
			</div>
			
			<!-- 등록 및 창 닫기 버튼 시작 -->
			<div class="hr-line-dashed"></div>
			<div class="col-sm-7">
				<div class="form-group" style="text-align: right; ">
					<input type="submit" class="btn btn-primary dim" style="width:100px;" value="수정">
					<input type="button" id="deleteBtn" class="btn btn-primary dim" style="width:100px;" value="삭제">
					<input type="button" class="btn btn-primary dim" name="window_close" style="width:100px;" value="창닫기">
				</div>
			</div>
			<!-- 등록 및 창 닫기 버튼 끝 -->
		</form>
	</div>

</body>
</html>