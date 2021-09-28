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

	$(document).ready(function(){
		var radio = $("input[name='product_typeOfSales']:checked");
		if(radio.val() == "서비스"){
			$("#product_rentalPeriod").attr("disabled", "disabled");
		}
	});
	
	$(function(){
		$("input[type=radio]").click(function(){
			var radioName = $(this).val();
			if(radioName == "서비스"){
				$("#product_rentalPeriod").attr("disabled", "disabled");
			}else{
				$("#product_rentalPeriod").removeAttr("disabled");
			}
		});
	});
	
	function chkfrom(){
		if(document.getElementById("product_group_code").value == "0"){
			alert("그룹을 선택하세요");
			return false;
		}else if(document.getElementById("product_status").value == "0"){
			alert("판매여부를 선택하세요");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="ibox-content">
		<form action="addProductAction?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" onsubmit="return chkfrom();">
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">상품등록</label>
			</div>
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">상품 그룹</label>
				<div class="col-sm-7">
					<select name="product_group_code" id="product_group_code" class="form-control">
						<option value="0" selected="selected">상품 그룹 선택</option>
						<c:forEach var="item" items="${list}">
							<option value="${item.product_group_code}">${item.product_group_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품명</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="product_name" name="product_name" required>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">판매형태</label>
				<label class="col-sm-2 col-form-label"> 
					<input type="radio" name="product_typeOfSales" value="서비스" checked>
					<span>서비스</span>
				</label>
				<label class="col-sm-2 col-form-label"> 
					<input type="radio" name="product_typeOfSales" value="기간"> 
					<span>기간</span>
				</label>

			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품가격</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" placeholder="숫자입력" name="product_price" required>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">기간</label>
				<div class="col-sm-2">
					<input type="number" id ="product_rentalPeriod" class="form-control" name="product_rentalPeriod" min="1" max="12"
					required>
				</div>
				<label class="col-sm-2 col-form-label">개월</label>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품이미지</label>
				<div class="col-sm-7">
					<input type="file" class="form-control" name="product_img">
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">판매 여부</label>
				<div class="col-sm-3">
					<select class="form-control" name="product_status" id="product_status">
						<option value="0" selected="selected">판매 여부</option>
						<option value="판매중">판매중</option>
						<option value="판매중지">판매중지</option>
					</select>
				</div>
			</div>


			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품설명</label>
				<div class="col-sm-7">
					<textarea rows="20" cols="10" name="product_content" style="width: 400px; height: 200px;">
					</textarea>
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