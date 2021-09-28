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
</style>
<script type="text/javascript">
	function chkfrom(){
		if(document.getElementById("stock_status").value == "0"){
			alert("품절 여부를 선택하세요");
			return false;
		}else if(document.getElementById("trade_code").value == "0"){
			alert("거래처를 선택하세요");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="ibox-content">
		<form action="addStockAction" method="post" onsubmit="return chkfrom()">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">재고등록</label>
			</div>
			<div class="hr-line-dashed"></div>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">재고명</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="stock_name" required>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">매입가</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="stock_price" required placeholder="숫자 입력">
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">수량</label>
				<div class="col-sm-2">
					<input type="number" class="form-control" min="1" name="stock_count" required>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">브랜드</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="stock_brand" required>
				</div>
			</div>



			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">품절 여부</label>
				<div class="col-sm-3">
					<select name="stock_status" id="stock_status" class="form-control">
						<option value="0" selected>품절 여부</option>
						<option value="품절">품절</option>
						<option value="재고">재고</option>
					</select>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">거래처</label>
				<div class="col-sm-3">
					<select name="trade_code" id = "trade_code" class="form-control">
						<option value="0" selected>거래처 선택</option>
						<c:forEach var="trade" items="${list}">
							<option value="${trade.trade_code}">${trade.trade_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<div align="center">
					<div class="col-sm-6 col-sm-offset-2">
						<input type="submit" class="btn btn-primary btn-sm" value="확인">
						<input type="button" class="btn btn-primary btn-sm" value="창 닫기"
							onclick="self.close();">
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>