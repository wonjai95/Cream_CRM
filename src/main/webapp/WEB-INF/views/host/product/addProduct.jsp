<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
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
		
		
		$("#product_name").blur(function() {
			var product_name = $(this).val();
			var product_code = $("#product_code").val();
			if (product_name != "") {
				$.ajax({
					type : "get",
					url : "chkProductName",
					data : "product_name=" + product_name +"&product_code=" +product_code,
					success : function(result) {
						$("#chkName").css("display", "block").css(
								"color", "red").css("font-size",
								"10px");
						if (result != 0) {
							$("#chkName").html("상품명이 중복되었습니다");
							$("#hiddenName").val("0");
						} else {
							$("#chkName").html(product_name + " 은(는) 사용 가능합니다.");
							//$("#chkName").css("display", "none");
							$("#hiddenName").val(product_name);
						}
					},
					error : function() {
						alert("오류");
					}

				});
			} else {
				$("#chkName").css("display", "none");
				$("#hiddenName").val("");
			}
		});
		
		
		$("#addProductBtn").click(function(e){
			e.preventDefault();
			var header = $("meta[name='_csrf_header']").attr("content");
			var token = $("meta[name='_csrf']").attr("content");
			//var addProductFrm = $("#addProductFrm").serialize(); //안댐
		    var addProductFrm = $('#addProductFrm')[0];
		    addProductFrm = new FormData(addProductFrm); 
			
			if($("#product_group_code").val() == "0"){
				alert("상품 그룹을 선택하세요");
				return;
			}else if(!$("#product_name").val()){
				alert("상품명을 입력하세요");
				return;
			}else if(!$("#product_price").val() || isNaN($("#product_price").val())){
				alert("가격을 올바른 값으로 입력하세요");
				return;
			}else if($("#product_status").val() == "0"){
				alert("판매 여부를 선택해주세요");
				return;
			}else if(!$("#product_content").val()){
				alert("내용을 입력하세요");
				return;
			}else if($("#hiddenName").val() != $("#product_name").val()){
				alert("중복확인을 다시하세요");
				return;
			}else if($("#hiddenName").val() == "0"){
				alert("상품 이름이 중복되었습니다");
				$("#product_name").val("");
				return;
			}
			if($("input[type=radio]:checked").val() != '서비스'){
				if(!$("#product_rentalPeriod").val()){
					alert("기간을 설정해주세요");
					return;
				}
			}
			
			$.ajax({
				type : "post",
				beforeSend : function(jqXHR, settings) {
					jqXHR.setRequestHeader(header, token);
				},
			  	enctype: 'multipart/form-data',//필
				url : "addProductAction",
				data : addProductFrm,
			  	processData: false,//필
			  	contentType: false,//필
				dataType : 'json',
				async : false,
				success : function(response) {
					var temp = addHtml(response);
					$(opener.document).find("#productList").prepend(temp);
					opener.alert("상품 등록");
					window.close();
				},
				error : function() {
					alert("에러");
				}
			});
		});
		
		function addHtml(vo) {
			return '<tr class="footable-odd">'
			+ '<td class="footable-visible">&nbsp;&nbsp;&nbsp;'
			+ '<input type="radio" name="product_code" value="' + vo.product_code + '"></td>'
			+ '<td class="footable-visible"><span>' + vo.product_typeOfSales + '</span></td>'
			+ '<td class="footable-visible"><span>' + vo.product_img + '</span></td>'
			+ '<td class="footable-visible"><span>' + vo.product_name + '</span></td>'
			+ '<td class="footable-visible"><span>' + vo.product_price + '</span></td>'
			+ '<td class="footable-visible"><span>' + vo.product_rentalPeriod + '개월</span></td>'
			+ '<td class="footable-visible"><span>' + vo.product_content + '</span></td>'
			+ '<td class="footable-visible"><span class="label label-primary">' + vo.product_group_code + '</span></td>'
			+ '</tr>';
		}
		
	});
	
</script>
</head>
<body>
	<div class="ibox-content">
		<%-- <form action="addProductAction?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" onsubmit="return chkfrom();"> --%>
		<form id="addProductFrm" method="post" enctype="multipart/form-data">
			<input type="hidden" id="hiddenName">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품 등록</label>
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
					<input type="text" class="form-control" id="product_name" name="product_name">
					<p class="font-bold" id="chkName" style="display: none;"></p>
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
					<input type="radio" name="product_typeOfSales" id="product_typeOfSales" value="기간"> 
					<span>기간</span>
				</label>

			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품가격</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="product_price" name="product_price">
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
					<textarea rows="20" cols="10" id="product_content" name="product_content" style="width: 400px; height: 200px;">
					</textarea>
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<div align="center">
					<div class="col-sm-6 col-sm-offset-2">
						<input type="submit" id="addProductBtn" class="btn btn-primary btn-sm" value="확인">
						<input type="button" class="btn btn-primary btn-sm" value="창 닫기"
							onclick="self.close();">
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>