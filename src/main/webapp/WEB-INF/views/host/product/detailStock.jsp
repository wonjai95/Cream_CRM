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
		alert("사용 여부를 선택하세요");
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
		<form action="modifyStockAction" method="post" onsubmit="return chkfrom();">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="stock_code" value="${vo.stock_code}">
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">재고 수정</label>
			</div>
			<div class="hr-line-dashed"></div>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">재고명</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="stock_name" value="${vo.stock_name}" required>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">수량</label>
				<div class="col-sm-2">
					<input type="number" class="form-control" min="0" name="stock_count" value="${vo.stock_cnt}" required>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">브랜드</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="stock_brand" value="${vo.stock_brand}" required>
				</div>
			</div>



			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">사용 여부</label>
				<div class="col-sm-3">
					<select name="stock_status" id="stock_status" class="form-control">
						<option value="0">사용 여부</option>
						<c:if test="${vo.stock_status == '사용중단'}">
							<option value="사용중단" selected>사용중단</option>
						</c:if>
						
						<c:if test="${vo.stock_status != '사용중단'}">
							<option value="사용중단">사용중단</option>
						</c:if>
						
						<c:if test="${vo.stock_status == '사용중'}">
							<option value="사용중" selected>사용중</option>
						</c:if>
						
						<c:if test="${vo.stock_status != '사용중'}">
							<option value="사용중">사용중</option>
						</c:if>
						
					</select>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">거래처</label>
				<div class="col-sm-3">
					<select name="trade_code" id="trade_code" class="form-control">
						<option value="0" selected>거래처 선택</option>
						<c:forEach var="trade" items="${list}">
							<c:if test="${trade.trade_code == vo.trade_code}">
								<option value="${vo.trade_code}" selected>${trade.trade_name}</option>
							</c:if>
							
							<c:if test="${trade.trade_code != vo.trade_code}">
								<option value="${vo.trade_code}">${trade.trade_name}</option>
							</c:if>
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