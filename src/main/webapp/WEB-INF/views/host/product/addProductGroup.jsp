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
		
		$(function() {
			$("#product_group_name").blur(function() {
						var product_group_name = $(this).val();
						if (product_group_name != "") {
							$.ajax({
								type : "get",
								url : "chkGroupName",
								data : "product_group_name=" + product_group_name,
								success : function(result) {
									$("#chkName").css("display", "block").css(
											"color", "red").css("font-size",
											"10px");
									if (result != 0) {
										$("#chkName").html("그룹명이 중복되었습니다.");
										$("#hiddenName").val("0");
									} else {
										$("#chkName").html(
												product_group_name + " 은(는) 사용 가능합니다.");
										$("#hiddenName").val(product_group_name);
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
			
			$("#groupSubmitBtn").click(function(e){
				e.preventDefault();
				var groupFrm = $("#groupFrm").serialize();
				var header = $("meta[name='_csrf_header']").attr("content");
				var token = $("meta[name='_csrf']").attr("content");
				
				if(!$("#product_group_name").val()){
					alert("그룹명을 입력해주세요");
					return;
				}else if($("#hiddenName").val() != $("#product_group_name").val()){
					alert("중복확인을 다시하세요");
					return;
				}else if($("#hiddenName").val() == "0"){
					alert("호실 이름이 중복되었습니다");
					$("#product_group_name").val("");
					return;
				}
				
				$.ajax({
					type : "post",
					url : "addProductGroupAction",
					data : groupFrm,
					dataType : 'json',
					beforeSend : function(jqXHR, settings) {
						jqXHR.setRequestHeader(header, token);
					},
					async : false,
					success : function(response) {
						var temp = addHtml(response);
						$(opener.document).find("#groupList").prepend(temp);
						opener.alert("그룹 등록");
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
					+ '<input type="radio" name="product_group_code"' 
					+ 'value="'+ vo.product_group_code +'">'
					+ '</td>'
					+ '<td class="footable-visible">'
					+ '<a href="'+ vo.product_group_code +'"><span>'
					+ vo.product_group_name
					+ '</span></a></td></tr>';
			}
				
	});
</script>
</head>
<body>
	<div class="ibox-content">
		<!-- <form action="addProductGroupAction" method="post" > -->
		<form id="groupFrm" >
			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
			<input type="hidden" id="hiddenName">
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">그룹 등록</label>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">그룹명</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="product_group_name" id="product_group_name">
					<p class="font-bold" id="chkName" style="display: none;"></p>
				</div>
				
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<div class="col-sm-7 col-sm-offset-2" align="right">
					<input type="submit" id="groupSubmitBtn" class="btn btn-primary btn-sm" value="확인">
					<input type="button" class="btn btn-primary btn-sm" value="창 닫기"
						onclick="self.close();">
				</div>
			</div>
		</form>
	</div>

</body>
</html>