<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add_inven_inout.jsp</title>
<style type="text/css">
body {
	background-color: white;
}

#g_product {
	text-shadow: aqua;
}
</style>
<script type="text/javascript" src="${path}/resources/host/js/inven_inout.js"></script>
</head>
<body>
	<div class="ibox-content">
		<form action="add_invenInout_action" method="post" id="add_invenInoutForm">
			<sec:csrfInput/>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">재고코드</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="stock_code" 
						value="${stock_code}" readonly>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">재고명</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="stock_name" 
						value="${stock_name}" readonly>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">매입수량 (개)</label>
				<div class="col-sm-3">
					<input type="number" min="0" class="form-control" name="stock_pur_cnt" value="0" placeholder="매입수량" required>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">매입가 (원) </label>
				<div class="col-sm-3">
					<input type="number" class="form-control" name="stock_pur_price" value="0"
						placeholder="매입가" required>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">매입일자</label>
				<div class="col-sm-5">
					<input type="date" class="form-control" name="stock_indate" required>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">매입 총액</label>
				<div class="col-sm-5">
					<input type="number" class="form-control" name="stock_pur_cal" 
						placeholder="수량 * 매입가" readonly>
				</div>
			</div>
			
			<!-- 등록 및 창 닫기 버튼 시작 -->
			<div class="hr-line-dashed"></div>
			<div class="col-sm-7">
				<div class="form-group" style="text-align: right;">
					<input type="submit" class="btn btn-primary dim" style="width:100px;" value="등록">
					<input type="button" class="btn btn-primary dim" name="window_close" style="width:100px;" value="창닫기">
				</div>
			</div>
			<!-- 등록 및 창 닫기 버튼 끝 -->
		</form>
	</div>

</body>
</html>