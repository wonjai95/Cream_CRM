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
$("docuemnt").ready(function() {
	
	/************************* 거래처 ****************************/
	function addTrade() {
		var url = "addTrade";
		window
				.open(url, "거래처 추가",
						"width=600, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
	
	function getTradeCode() {
		var names = document.getElementsByName("trade_code");
		var trade_code = "";
		for (var i = 0; i < names.length; i++) {
			if (names[i].checked == true) {
				trade_code = names[i].value;
				return trade_code;
			}
		}
		if (trade_code == "") {
			alert("거래처를 선택하세요.");
			return;
		}
	}
	
	function detailTrade() {
		var trade_code = getTradeCode();
		if (trade_code == null || trade_code == "") {
			return;
		}
		var url = "detailTrade?trade_code=" + trade_code;
		window
				.open(url, "거래처 디테일",
						"width=600, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
	
	function unselectedTrade() {
		var names = document.getElementsByName("trade_code");
		for (var i = 0; i < names.length; i++) {
			if (names[i].checked == true) {
				names[i].checked = false;
				break;
			}
		}
	}
	
	function deleteTrade() {
		var trade_code = getTradeCode();
		if (trade_code == null || trade_code == "") {
			return false;
		}
		var chk = confirm("삭제 하시겠습니까? 삭제 후 복구는 불가능합니다.");
		if (chk != true) {
			return false;
		}
	}
	
	/************************* 재고  ****************************/
	function addStock() {
		var url = "addStock";
		window
				.open(url, "재고추가",
						"width=600, height=900, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
	
	function unselectedStock() {
		var names = document.getElementsByName("stock_code");
		for (var i = 0; i < names.length; i++) {
			if (names[i].checked == true) {
				names[i].checked = false;
				break;
			}
		}
	}
	
	function getStockCode() {
		var names = document.getElementsByName("stock_code");
		var stock_code = "";
		for (var i = 0; i < names.length; i++) {
			if (names[i].checked == true) {
				stock_code = names[i].value;
				return stock_code;
			}
		}
		if (stock_code == "") {
			alert("재고를 선택하세요.");
			return;
		}
	}
	
	function detailStock() {
		var stock_code = getStockCode();
		if (stock_code == null || stock_code == "") {
			return;
		}
		var url = "detailStock?stock_code=" + stock_code;
		window
				.open(url, "재고디테일",
						"width=600, height=900, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
	
	function deleteStock() {
		var stock_code = getStockCode();
		if (stock_code == null || stock_code == "") {
			return false;
		}
		var chk = confirm("삭제 하시겠습니까? 삭제 후 복구는 불가능합니다.");
		if (chk != true) {
			return false;
		}
	
	}
	
	$("#tab-2").click(function() {
		var header = $("meta[name='_csrf_header']").attr("content");
	    var token = $("meta[name='_csrf']").attr("content");
	    
	    $.ajax({
	  	  url : "inventory",
	  	  type : "Post",
	  	  beforeSend : function(jqXHR, settings) {
	  		  console.log("beforesend 진행");
	            jqXHR.setRequestHeader(header, token);
	  	  },
	  	  success : function(result) {
	  		  $(".panel-body").html(result);
	  	  },
	  	  error : function(error) {
	  		console.log(error);  
	  		$(".panel-body").html("재고 실사 페이지가 현재 작동하지 않습니다.");
	  	  }
	    });
	})

})	
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
					<h2 id = "product">재고</h2>
				</div>
			</div>


			<div class="wrapper wrapper-content animated fadeInRight ecommerce">

				<div class="row">
					<div class="col-lg-12">
						<div class="tabs-container">
							<ul class="nav nav-tabs">
								<li><a class="nav-link active" data-toggle="tab"
									href="#tab-1">재고 관리</a></li>
								<li><a class="nav-link" data-toggle="tab" id="tab-2" href="#tab-2">재고 실사</a></li>
										
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
															<input type="text" id="" name="" value="" placeholder="검색어"
																class="form-control">
														</div>
													</div>
									
													<div class="col-sm-2">
														<div class="form-group">
															<button class="btn btn-primary dim" type="button">찾기</button>
														</div>
													</div>
												</div>
											</div>
									
											<fieldset>
												<div class="wrapper wrapper-content">
													<div class="row">
														<div class="col-lg-3 animated fadeInRight">
															<form action="deleteTradeAction" method="post"
																onsubmit="return deleteTrade();">
																<input type="hidden" name="${_csrf.parameterName}"
																	value="${_csrf.token}">
																<div id="p_group">
																	<div>
																		<button type="button" class="btn btn-primary dim"
																			onclick="addTrade();">거래처 등록</button>
																	</div>
																	<div>
																		<button type="button" class="btn btn-primary dim"
																			onclick="detailTrade();">거래처 수정</button>
																	</div>
																	<div>
																		<button type="submit" class="btn btn-primary dim">거래처
																			삭제</button>
																	</div>
																</div>
																<table
																	class="footable table table-stripped toggle-arrow-tiny footable-loaded tablet breakpoint"
																	data-page-size="15">
																	<thead>
																		<tr>
																			<th class="text-right footable-visible footable-last-column">
																				<span class="footable-sort-indicator"
																				onclick="unselectedTrade();">선택</span>
																			</th>
									
																			<th class="text-right footable-visible footable-last-column">
																				<span class="footable-sort-indicator">거래처 명</span>
																			</th>
																		</tr>
																	</thead>
									
																	<tbody>
																		<c:forEach var="trade" items="${tradeList}">
																			<tr class="footable-odd">
																				<td class="footable-visible">&nbsp;&nbsp; <input
																					type="radio" name="trade_code"
																					value="${trade.trade_code}">
																				</td>
																				<td class="footable-visible"><span>${trade.trade_name}</span>
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
																				<li class="footable-page"><a data-page="1" href="#">2</a></li>
																				<li class="footable-page-arrow"><a data-page="next"
																					href="#next">›</a></li>
																				<li class="footable-page-arrow"><a data-page="last"
																					href="#last">»</a></li>
																			</ul>
																		</td>
																	</tr>
																</tfoot>
															</table>
														</div>
														<div class="col-lg-9 animated fadeInRight">
									
															<div class="ibox-content" style="margin: 0px; padding: 0px;">
									
																<form action="deleteStockAction" method="post"
																	onsubmit="return deleteStock();">
																	<input type="hidden" name="${_csrf.parameterName}"
																		value="${_csrf.token}">
																	<div id="p_group">
																		<div>
																			<button type="button" class="btn btn-primary dim"
																				onclick="addStock();">재고등록</button>
																		</div>
																		<div>
																			<button type="button" class="btn btn-primary dim"
																				onclick="detailStock();">재고수정</button>
																		</div>
																		<div>
																			<button type="submit" class="btn btn-primary dim">재고삭제</button>
																		</div>
																	</div>
																	<table
																		class="footable table table-stripped toggle-arrow-tiny footable-loaded tablet breakpoint"
																		data-page-size="15">
																		<thead>
																			<tr>
																				<th class="text-right footable-visible footable-last-column">
																					<span class="footable-sort-indicator"
																					onclick="unselectedStock();">선택</span>
																				</th>
																				
																				<th class="text-right footable-visible footable-last-column">
																					<span class="footable-sort-indicator">구분</span>
																				</th>
									
																				<th class="text-right footable-visible footable-last-column">
																					<span class="footable-sort-indicator">재고명</span>
																				</th>
									
																				<th class="text-right footable-visible footable-last-column">
																					<span class="footable-sort-indicator">매입가</span>
																				</th>
																				
																				<th class="text-right footable-visible footable-last-column">
																					<span class="footable-sort-indicator">재고브랜드</span>
																				</th>
																				
																				<th class="text-right footable-visible footable-last-column">
																					<span class="footable-sort-indicator">수량</span>
																				</th>
									
																				<th class="text-right footable-visible footable-last-column">
																					<span class="footable-sort-indicator">입고 날짜</span>
																				</th>
									
																				<th class="text-right footable-visible footable-last-column">
																					<span class="footable-sort-indicator">거래처코드</span>
																				</th>
									
																			</tr>
																		</thead>
									
																		<tbody>
									
																			<c:forEach var="stock" items="${stockList}">
																				<tr class="footable-odd">
																					<td class="footable-visible">&nbsp;&nbsp; <input
																						type="radio" name="stock_code"
																						value="${stock.stock_code}">
																					</td>
									
																					<td class="footable-visible"><span>${stock.stock_status}</span>
																					</td>
									
																					<td class="footable-visible"><span>${stock.stock_name}</span>
																					</td>
									
																					<td class="footable-visible"><span>${stock.stock_price}</span>
																					</td>
									
																					<td class="footable-visible"><span>${stock.stock_brand}</span>
																					</td>
									
																					<td class="footable-visible"><span>${stock.stock_count}개</span>
																					</td>
									
																					<td class="text-right footable-visible footable-last-column">
																						<span class="label label-primary">${stock.stock_indate}</span>
																					</td>
									
																					<td class="footable-visible"><span
																						class="label label-primary">${stock.trade_code}</span>
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
																					<li class="footable-page"><a data-page="1" href="#">2</a></li>
																					<li class="footable-page-arrow"><a data-page="next"
																						href="#next">›</a></li>
																					<li class="footable-page-arrow"><a data-page="last"
																						href="#last">»</a></li>
																				</ul>
																			</td>
																		</tr>
																	</tfoot>
																</table>
															</div>
														</div>
													</div>
												</div>
											</fieldset>
										</div>

								<div id="tab-2" class="tab-pane">
								
								</div>

								<div id="tab-4" class="tab-pane">
								
								</div>

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