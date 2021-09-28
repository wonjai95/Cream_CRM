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
						"width=600, height=900, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
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
						"width=600, height=900, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
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

	function dddd(code){
		
		var header = $("meta[name='_csrf_header']").attr("content");
		var token = $("meta[name='_csrf']").attr("content");
		
		$.ajax({
			type:"post",
			url:"dddd",
			data: "code=" + code,
			beforeSend: function(jqXHR, settings){
				jqXHR.setRequestHeader(header,token);
			},
			success: function(list){
				
			},
			error: function(){
				alert("오류");
			}
			
		});
		
	}

	
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
									href="#tab-1">상품 관리</a></li>
								<li><a class="nav-link" data-toggle="tab" href="#tab-2">재고
										관리</a></li>
								<li><a class="nav-link" data-toggle="tab" href="#tab-4">입출고
										현황</a></li>
							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<div class="panel-body">
										<div class="ibox-content m-b-sm border-bottom">
											<div class="row">
												<div class="col-sm-2">
													<div class="form-group">
														<select name="" id="" class="form-control">
															<option value="1" selected="selected">판매 여부</option>
															<option value="2">판매중</option>
															<option value="3">판매중지</option>
														</select>
													</div>
												</div>

												<div class="col-sm-2">
													<div class="form-group">
														<select name="" id="" class="form-control">
															<option value="1" selected="selected">판매 형태</option>
															<option value="2">기간제</option>
															<option value="3">대여형</option>
														</select>
													</div>
												</div>

												<div class="col-sm-2">
													<div class="form-group">
														<input type="text" id="" name="" value=""
															placeholder="검색어" class="form-control">
													</div>
												</div>

												<div class="col-sm-2">
													<div class="form-group">
														<button class="btn btn-primary dim" type="button">찾기</button>
													</div>
												</div>
											</div>
										</div>

										<div class="wrapper wrapper-content">
											<div class="row">
												<div class="col-lg-3 animated fadeInRight">
													<form action="deleteProductGroupAction" method="post"
														onsubmit="return deleteProductGroup();">
														<input type="hidden" name="${_csrf.parameterName}"
															value="${_csrf.token}">
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
																<button type="submit" class="btn btn-primary dim">그룹삭제</button>
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

															<tbody>
																<c:forEach var="productGroup"
																	items="${productGroupList}">
																	<tr class="footable-odd">
																		<td class="footable-visible">&nbsp;&nbsp; <input
																			type="radio" name="product_group_code"
																			value="${productGroup.product_group_code}">
																		</td>

																		<td class="footable-visible">
																		<a href="#" onclick="dddd('${productGroup.product_group_code}');">
																			<span>${productGroup.product_group_name}</span>
																		</a>
																		</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>

													</form>
													<table>
														<tfoot>
															<tr>
																<td colspan="6" class="footable-visible">
																	<ul class="pagination float-right">
																		<li class="footable-page-arrow disabled"><a
																			data-page="first" href="#first">«</a></li>
																		<li class="footable-page-arrow disabled"><a
																			data-page="prev" href="#prev">‹</a></li>
																		<li class="footable-page active"><a data-page="0"
																			href="#">1</a></li>
																		<li class="footable-page"><a data-page="1"
																			href="#">2</a></li>
																		<li class="footable-page-arrow"><a
																			data-page="next" href="#next">›</a></li>
																		<li class="footable-page-arrow"><a
																			data-page="last" href="#last">»</a></li>
																	</ul>
																</td>
															</tr>
														</tfoot>
													</table>
												</div>
												<div class="col-lg-9 animated fadeInRight">

													<div class="ibox-content"
														style="margin: 0px; padding: 0px;">

														<form action="deleteProductAction" method="post"
															onsubmit="return deleteProduct();">
															<input type="hidden" name="${_csrf.parameterName}"
																value="${_csrf.token}">
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
																	<button type="submit" class="btn btn-primary dim">상품삭제</button>
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

																<tbody>

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

																			<td
																				class="text-right footable-visible footable-last-column">
																				<span class="label label-primary">${product.product_content}</span>
																			</td>

																			<td class="footable-visible"><span
																				class="label label-primary">${product.product_group_code}</span>
																			</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</form>
														<table>
															<tfoot>
																<tr>
																	<td colspan="6" class="footable-visible">
																		<ul class="pagination float-right">
																			<li class="footable-page-arrow disabled"><a
																				data-page="first" href="#first">«</a></li>
																			<li class="footable-page-arrow disabled"><a
																				data-page="prev" href="#prev">‹</a></li>
																			<li class="footable-page active"><a
																				data-page="0" href="#">1</a></li>
																			<li class="footable-page"><a data-page="1"
																				href="#">2</a></li>
																			<li class="footable-page-arrow"><a
																				data-page="next" href="#next">›</a></li>
																			<li class="footable-page-arrow"><a
																				data-page="last" href="#last">»</a></li>
																		</ul>
																	</td>
																</tr>
															</tfoot>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div id="tab-2" class="tab-pane">
									<jsp:include page="stock.jsp" />
								</div>

								<div id="tab-4" class="tab-pane">
									<jsp:include page="inputOutputStatus.jsp" />
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