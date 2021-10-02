<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Insert title here</title>
<style type="text/css">
#p_group {
	display: flex;
}
</style>

<script type="text/javascript">
	/************************* 상품그룹 ****************************/
	function addProductGroup() {
		var url = "addProductGroup";
		window
				.open(url, "상품그룹추가",
						"width=600, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}

	function getProductGroupCode() {
		var names = document.getElementsByName("product_group_code");
		var product_group_code = "";
		for (var i = 0; i < names.length; i++) {
			if (names[i].checked == true) {
				product_group_code = names[i].value;
				return product_group_code;
			}
		}
		if (product_group_code == "") {
			alert("그룹을 선택하세요.");
			return;
		}
	}

	function detailProductGroup() {
		var product_group_code = getProductGroupCode();
		if (product_group_code == null || product_group_code == "") {
			return;
		}
		var url = "detailProductGroup?product_group_code=" + product_group_code;
		window
				.open(url, "상품그룹디테일",
						"width=600, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}

	function unselectedGroup() {
		var names = document.getElementsByName("product_group_code");
		for (var i = 0; i < names.length; i++) {
			if (names[i].checked == true) {
				names[i].checked = false;
				break;
			}
		}
	}

	function deleteProductGroup() {
		var product_group_code = getProductGroupCode();
		if (product_group_code == null || product_group_code == "") {
			return false;
		}
		var chk = confirm("삭제 하시겠습니까? 삭제 후 복구는 불가능합니다.");
		if (chk != true) {
			return false;
		}
	}

	/************************* 상품 ****************************/
	function addProduct() {
		var url = "addProduct";
		window
				.open(url, "상품추가",
						"width=600, height=1000, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}

	function unselectedProduct() {
		var names = document.getElementsByName("product_code");
		for (var i = 0; i < names.length; i++) {
			if (names[i].checked == true) {
				names[i].checked = false;
				break;
			}
		}
	}

	function getProductCode() {
		var names = document.getElementsByName("product_code");
		var product_code = "";
		for (var i = 0; i < names.length; i++) {
			if (names[i].checked == true) {
				product_code = names[i].value;
				return product_code;
			}
		}
		if (product_code == "") {
			alert("상품을 선택하세요.");
			return;
		}
	}

	function detailProduct() {
		var product_code = getProductCode();
		if (product_code == null || product_code == "") {
			return;
		}
		var url = "detailProduct?product_code=" + product_code;
		window
				.open(url, "상품디테일",
						"width=600, height=1000, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}

	function deleteProduct() {
		var product_code = getProductCode();
		if (product_code == null || product_code == "") {
			return false;
		}
		var chk = confirm("삭제 하시겠습니까? 삭제 후 복구는 불가능합니다.");
		if (chk != true) {
			return false;
		}
	}
	
	//ajax
	$(function(){
		$("#deleteGroupBtn").click(function(){
			var value = $("#groupList input[type=radio]:checked").val();
			if(value == null){
				alert("삭제할 그룹을 선택하세요");
				return;
			}
			var deleteGroupFrm = $("#deleteGroupFrm").serialize();
			var header = $("meta[name='_csrf_header']").attr("content");
			var token = $("meta[name='_csrf']").attr("content");
			
			$.ajax({
				type : "post",
				url : "deleteProductGroupAction",
				data : deleteGroupFrm,
				dataType : 'json',
				beforeSend : function(jqXHR, settings) {
					jqXHR.setRequestHeader(header, token);
				},
				async : false,
				success : function(response) {
					if(response != 0){
						alert("삭제하였습니다");
						$("#groupList input[type=radio]:checked").parent().parent().remove();
					}else{
						alert("삭제 실패, 잠시후 다시 시도해주세요");
					}
				},
				error : function() {
					alert("에러");
				}
			});
		});
		
		
		$("#deleteProductBtn").click(function(){
			var value = $("#productList input[type=radio]:checked").val();
			if(value == null){
				alert("삭제할 상품을 선택하세요");
				return;
			}
			var deleteProductFrm = $("#deleteProductFrm").serialize();
			var header = $("meta[name='_csrf_header']").attr("content");
			var token = $("meta[name='_csrf']").attr("content");
			
			$.ajax({
				type : "post",
				url : "deleteProductAction",
				data : deleteProductFrm,
				dataType : 'json',
				beforeSend : function(jqXHR, settings) {
					jqXHR.setRequestHeader(header, token);
				},
				async : false,
				success : function(response) {
					if(response != 0){
						alert("삭제하였습니다");
						$("#productList input[type=radio]:checked").parent().parent().remove();
					}else{
						alert("삭제 실패, 잠시후 다시 시도해주세요");
					}
				},
				error : function() {
					alert("에러");
				}
			});
		});
		
		$(".group, #find ,#justList").click(function(e){
			e.preventDefault();
			var queryForStatus = $("#queryForStatus").val();
			var queryForType = $("#queryForType").val();
			var queryForName = $("#queryForName").val();
			
			if(queryForName == ""){
				queryForName = null;
			}
			if(queryForStatus == '전체'){
				queryForStatus = null;
			}
			if(queryForType == '전체'){
				queryForType = null;
			}
			
			var groupCode = $("input[name=product_group_code]:checked").val();
			if(groupCode == null){
				groupCode = null;
			}
			if($(this).hasClass("group") === true){
				$(this).parent().prev().children().first().prop("checked",true);
				groupCode = $(this).parent().prev().children().first().val();
			}
			
			if($(this).attr("id") == 'justList'){
				queryForStatus = null;
				queryForType = null;
				groupCode = null;
				queryForName = null;
			}
			
			$.ajax({
				type:"get",
				url: "selectProductByQuery",
				data : "product_name="+queryForName+"&product_typeOfSales="+queryForType+
						"&product_status="+queryForStatus +"&product_group_code="+groupCode,
				dataType : "json",
				success: function(response){
						$("#productList").html("");
					for (var i = 0; i < response.length; i++) {
						var temp = addHtml(response[i]);
						$("#productList").append(temp);
					}
				},
				error: function() {
					alert("오류");
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
		
		
		$("#roomList").click(function(){
			$.ajax({
				type:"get",
				url:"roomList",
				success: function(roomList){
					$("#rooms").html(roomList);
					/*
					for (var i = 0; i < roomList.length; i++) {
						var temp = addHtml(roomList[i]);
						$("#rooms").append(temp);
					}
					*/
				},
				error: function(){
					alert("오류");
				}
			});
		});
		
	});
	
	
</script>
</head>
<body>
	<div id="wrapper">

		<!-- frame  -->
		<jsp:include page="../Frame.jsp" />

		<div id="page-wrapper" class="gray-bg">

			<!-- nav bar  -->
			<jsp:include page="../navbar.jsp" />

			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-8">
					<h2 id = "product">상품</h2>
				</div>
			</div>


			<div class="wrapper wrapper-content animated fadeInRight ecommerce">

				<div class="row">
					<div class="col-lg-12">
						<div class="tabs-container">
							<ul class="nav nav-tabs">
								<li><a class="nav-link active" data-toggle="tab"
									href="#tab-1" id="justList">상품 관리</a></li>
								<li><a class="nav-link" data-toggle="tab" 
									href="#tab-2" id="roomList">호실 목록</a></li>
							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<div class="panel-body">
										<div class="ibox-content m-b-sm border-bottom">
											<div class="row">
												<div class="col-sm-2">
													<div class="form-group">
														<select name="queryForStatus" id="queryForStatus" class="form-control">
															<option value="전체" selected="selected">전체</option>
															<option value="판매중">판매중</option>
															<option value="판매중지">판매중지</option>
														</select>
													</div>
												</div>

												<div class="col-sm-2">
													<div class="form-group">
														<select name="queryForType" id="queryForType" class="form-control">
															<option selected="selected">전체</option>
															<option value="기간">기간</option>
															<option value="서비스">서비스</option>
														</select>
													</div>
												</div>

												<div class="col-sm-2">
													<div class="form-group">
														<input type="text" id="queryForName" name="queryForName"
															placeholder="상품명" class="form-control">
													</div>
												</div>

												<div class="col-sm-2">
													<div class="form-group">
														<button class="btn btn-primary dim" id="find" type="button">찾기</button>
													</div>
												</div>
											</div>
										</div>

										<div class="wrapper wrapper-content">
											<div class="row">
												<div class="col-lg-3 animated fadeInRight">
													<form id="deleteGroupFrm">
													<!-- <form action="deleteProductGroupAction" method="post"
														onsubmit="return deleteProductGroup();"> -->
														<%-- <input type="hidden" name="${_csrf.parameterName}"
															value="${_csrf.token}"> --%>
														<div id="p_group">
															<div>
																<button type="button" class="btn btn-primary dim"
																	onclick="addProductGroup();">그룹등록</button>
															</div>
															<div>
																<button type="button" class="btn btn-primary dim"
																	onclick="detailProductGroup();">그룹수정</button>
															</div>
															<div>
																<button type="button" id="deleteGroupBtn" class="btn btn-primary dim">그룹삭제</button>
															</div>
														</div>

														<table
															class="footable table table-stripped toggle-arrow-tiny footable-loaded tablet breakpoint"
															data-page-size="15">
															<thead>
																<tr>
																	<th
																		class="text-right footable-visible footable-last-column">
																		<span class="footable-sort-indicator"
																		onclick="unselectedGroup();">선택</span>
																	</th>

																	<th
																		class="text-right footable-visible footable-last-column">
																		<span class="footable-sort-indicator">상품 그룹명</span>
																	</th>
																</tr>
															</thead>

															<tbody id = "groupList">
																<c:forEach var="productGroup"
																	items="${productGroupList}">
																	<tr class="footable-odd">
																		<td class="footable-visible">&nbsp;&nbsp; <input
																			type="radio" name="product_group_code"
																			value="${productGroup.product_group_code}">
																		</td>

																		<td class="footable-visible">
																		<a href="${productGroup.product_group_code}" class="group">
																			<span>${productGroup.product_group_name}</span>
																		</a>
																		</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>

													</form>
												</div>
												<div class="col-lg-9 animated fadeInRight">

													<div class="ibox-content"
														style="margin: 0px; padding: 0px;">
															 <form id = deleteProductFrm>
														<%-- <form action="deleteProductAction" method="post"
															onsubmit="return deleteProduct();">
															<input type="hidden" name="${_csrf.parameterName}"
																value="${_csrf.token}"> --%>
															<div id="p_group">
																<div>
																	<button type="button" class="btn btn-primary dim"
																		onclick="addProduct();">상품등록</button>
																</div>
																<div>
																	<button type="button" class="btn btn-primary dim"
																		onclick="detailProduct();">상품수정</button>
																</div>
																<div> 
																	<button type="button" id="deleteProductBtn" class="btn btn-primary dim">상품삭제</button>
																</div>
															</div>
															<table
																class="footable table table-stripped toggle-arrow-tiny footable-loaded tablet breakpoint"
																data-page-size="15">
																<thead>
																	<tr>
																		<th
																			class="text-right footable-visible footable-last-column">
																			<span class="footable-sort-indicator"
																			onclick="unselectedProduct();">선택</span>
																		</th>

																		<th
																			class="text-right footable-visible footable-last-column">
																			<span class="footable-sort-indicator">구분</span>
																		</th>

																		<th
																			class="text-right footable-visible footable-last-column">
																			<span class="footable-sort-indicator">상품 이미지</span>
																		</th>

																		<th
																			class="text-right footable-visible footable-last-column">
																			<span class="footable-sort-indicator">상품명</span>
																		</th>

																		<th
																			class="text-right footable-visible footable-last-column">
																			<span class="footable-sort-indicator">상품가격</span>
																		</th>

																		<th
																			class="text-right footable-visible footable-last-column">
																			<span class="footable-sort-indicator">상품기간</span>
																		</th>

																		<th
																			class="text-right footable-visible footable-last-column">
																			<span class="footable-sort-indicator">상품설명</span>
																		</th>

																		<th
																			class="text-right footable-visible footable-last-column">
																			<span class="footable-sort-indicator">상품그룹</span>
																		</th>

																	</tr>
																</thead>

																<tbody id = "productList">

																	<c:forEach var="product" items="${productList}">
																		<tr class="footable-odd">
																			<td class="footable-visible">&nbsp;&nbsp; <input
																				type="radio" name="product_code"
																				value="${product.product_code}">
																			</td>

																			<td class="footable-visible"><span>${product.product_typeOfSales}</span>
																			</td>

																			<td class="footable-visible"><span>${product.product_img}</span>
																			</td>

																			<td class="footable-visible"><span>${product.product_name}</span>
																			</td>

																			<td class="footable-visible"><span>${product.product_price}</span>
																			</td>

																			<td class="footable-visible"><span>${product.product_rentalPeriod}개월</span>
																			</td>

																			<td class="footable-visible"><span>${product.product_content}</span>
																			</td>

																			<td class="footable-visible">
																			<span class="label label-primary">${product.product_group_code}</span>
																			</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div id="tab-2" class="tab-pane">
									<jsp:include page="../hostPage/roomList.jsp" />
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>