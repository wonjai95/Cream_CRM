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
		<form
			action="modifyProductAction?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data"
			onsubmit="return chkfrom();">
			<input type="hidden" name="hiddenImg" value="${vo.product_img}">
			<input type="hidden" name="product_code" value="${vo.product_code}">
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">상품 수정</label>
			</div>
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">상품 그룹</label>
				<div class="col-sm-7">
					<select name="product_group_code" id="product_group_code" class="form-control">
						<option value="0">상품 그룹 선택</option>
						<c:forEach var="item" items="${list}">
							<c:if test="${item.product_group_code == vo.product_group_code}">
								<option value="${item.product_group_code}" selected>${item.product_group_name}</option>
							</c:if>
							<c:if test="${item.product_group_code != vo.product_group_code}">
								<option value="${item.product_group_code}">${item.product_group_name}</option>
							</c:if>

						</c:forEach>
					</select>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품명</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="product_name"
						value="${vo.product_name}" required>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">판매형태</label>

				<c:if test="${vo.product_typeOfSales == '서비스'}">
					<label class="col-sm-2 col-form-label"> <input type="radio"
						name="product_typeOfSales" value="서비스" checked> <span>서비스</span>
					</label>
				</c:if>

				<c:if test="${vo.product_typeOfSales != '서비스'}">
					<label class="col-sm-2 col-form-label"> <input type="radio"
						name="product_typeOfSales" value="서비스"> <span>서비스</span>
					</label>
				</c:if>
				
				<c:if test="${vo.product_typeOfSales == '기간'}">
					<label class="col-sm-2 col-form-label"> <input type="radio"
						name="product_typeOfSales" value="기간" checked> <span>기간</span>
					</label>
				</c:if>

				<c:if test="${vo.product_typeOfSales != '기간'}">
					<label class="col-sm-2 col-form-label"> <input type="radio"
						name="product_typeOfSales" value="기간"> <span>기간</span>
					</label>
				</c:if>


			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품가격</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="product_price" required placeholder="숫자입력"
						value="${vo.product_price}">
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">기간</label>
				<div class="col-sm-2">
					<input type="number" class="form-control" id ="product_rentalPeriod"
						name="product_rentalPeriod" min="1" max="12" required
						value="${vo.product_rentalPeriod}">
				</div>
				<label class="col-sm-2 col-form-label">개월</label>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품이미지</label>
				<div class="col-sm-7">
					<input type="file" class="form-control" name="product_img"
						value="${vo.product_img}">
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">판매 여부</label>
				<div class="col-sm-3">
					<select class="form-control" name="product_status" id="product_status">
						<option value="0">판매 여부</option>
						<c:if test="${vo.product_status == '판매중'}">
							<option value="판매중" selected>판매중</option>
						</c:if>
						
						<c:if test="${vo.product_status != '판매중'}">
							<option value="판매중">판매중</option>
						</c:if>
						
						<c:if test="${vo.product_status == '판매중지'}">
							<option value="판매중지" selected>판매중지</option>
						</c:if>
						
						<c:if test="${vo.product_status != '판매중지'}">
							<option value="판매중지">판매중지</option>
						</c:if>
						
					</select>
				</div>
			</div>


			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품설명</label>
				<div class="col-sm-7">
					<textarea rows="20" cols="10" name="product_content"
						style="width: 400px; height: 200px;">
						${vo.product_content}
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