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
	
$("docuemnt").ready(function() {	
	// 재고관리 탭
	$("#tab-1").click(function() {
		location.reload();
	})
	
	// 재고실사 탭
	$("#tab-3").click(function() {
		var header = $("meta[name='_csrf_header']").attr("content");
	    var token = $("meta[name='_csrf']").attr("content");
	    
	    $.ajax({
	  	  url : "inven_inout",
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
	  		$(".panel-body").html("입출고 관리 페이지가 현재 작동하지 않습니다.");
	  	  }
	    });
	});
	
	
	// 재고실사 탭
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
	});
	
	// 검색 
	$("#stockSearchBtn").click(function() {
		var keyword = $("#stockKeyword").val();
		if(keyword == "" || keyword == null) {
			alert("검색어를 입력하세요!");
			return false;
		} else {
			var header = $("meta[name='_csrf_header']").attr("content");
		    var token = $("meta[name='_csrf']").attr("content");
		    
		    $.ajax({
		  	  url : "search_stock",
		  	  type : "Post",
		  	  data : "keyword=" + keyword,
		  	  beforeSend : function(jqXHR, settings) {
		  		  console.log("beforesend 진행");
		            jqXHR.setRequestHeader(header, token);
		  	  },
		  	  success : function(result) {
		  		  $(".stockContent").html(result);
		  	  },
		  	  error : function(error) {
		  		console.log(error);  
		  		$(".stockContent").html("재고 목록 검색이 작동하지 않습니다.");
		  	  }
		    });
		}
		
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
								<li><a class="nav-link active" data-toggle="tab" id="tab-1" href="#tab-1">재고 관리</a></li>
								<li><a class="nav-link" data-toggle="tab" id="tab-3" href="#tab-3">입출고 관리</a></li>
								<li><a class="nav-link" data-toggle="tab" id="tab-2" href="#tab-2">재고 실사</a></li>
										
							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<div class="panel-body">
											<div class="ibox-content m-b-sm border-bottom">
												<div class="row">
													<div class="col-sm-2">
														<div class="form-group">
															<input type="text" id="stockKeyword" name="stockKeyword" value="" placeholder="재고목록 검색"
																class="form-control">
														</div>
													</div>
									
													<div class="col-sm-2">
														<div class="form-group">
															<button class="btn btn-primary dim" type="button" id="stockSearchBtn">검색</button>
														</div>
													</div>
												</div>
											</div>
									
											<fieldset>
												<div class="wrapper wrapper-content">
													<div class="row">
														<div class="col-lg-3 animated fadeInRight" style="width: 30%">
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
																	<table>
																	<tfoot>
																		<tr>
																			<td colspan="6" class="footable-visible">
																				<ul class="pagination float-right">
																					<c:if test="${tradeCnt>0}">
																						<c:if test="${tradeStartPage > tradePageBlock}">
																							<li class="footable-page-arrow disabled">
																							<a class="page" data-page="first" href="stock?stockPageNum=${stockPageNum}">«</a>
																							</li>
																							<li class="footable-page-arrow disabled">
																								<a class="page" data-page="prev" href="stock?tradePageNum=${tradeStartPage - tradePageBlock}&stockPageNum=${stockPageNum}">‹</a>
																							</li>
																						</c:if>
																							
																						<c:forEach var="i" begin="${tradeStartPage}" end="${tradeEndPage}">
																						
																							<c:if test="${i == tradePageNum}">
																								<li class="footable-page active">
																									<a data-page="0">${i}</a>
																								</li>
																							</c:if>
																							
																							<c:if test="${i != tradePageNum}">
																								<li class="footable-page">
																									<a class="page" data-page="1" href="stock?tradePageNum=${i}&stockPageNum=${stockPageNum}">${i}</a>
																								</li>
																							</c:if>	
																						</c:forEach>
																						
																						<c:if test="${tradePageCount > tradeEndPage}">
																							<li class="footable-page-arrow">
																								<a class="page" data-page="next" href="stock?tradePageNum=${tradeStartPage + tradePageBlock}&stockPageNum=${stockPageNum}">›</a>
																							</li>
																							<li class="footable-page-arrow">
																								<a class="page" data-page="last" href="stock?tradePageNum=${tradePageCount}&stockPageNum=${stockPageNum}">»</a>
																							</li>
																						</c:if>
																					</c:if>
																				</ul>
																			</td>
																		</tr>
																	</tfoot>
																</table>
															</form>
														</div>
														<div class="col-lg-9 animated fadeInRight" style="width: 70%; border: none;">
									
															<div class="ibox-content" style="margin: 0px; padding: 0px;  border: none;">
									
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
																					<span class="footable-sort-indicator">재고브랜드</span>
																				</th>
																				
																				<th class="text-right footable-visible footable-last-column">
																					<span class="footable-sort-indicator">수량</span>
																				</th>
									
																				<th class="text-right footable-visible footable-last-column">
																					<span class="footable-sort-indicator">거래처코드</span>
																				</th>
									
																			</tr>
																		</thead>
									
																		<tbody class="stockContent">
									
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
									
																					<td class="footable-visible"><span>${stock.stock_brand}</span>
																					</td>
									
																					<td class="footable-visible"><span>${stock.stock_cnt}개</span>
																					</td>
									
									
																					<td class="footable-visible">
																						<span>${stock.trade_code}</span>
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
																					<c:if test="${stockCnt>0}">
																					
																						<c:if test="${stockStartPage > stockPageBlock}">
																							<li class="footable-page-arrow disabled">
																							<a class="page" data-page="first" href="stock?tradePageNum=${tradePageNum}">«</a>
																							</li>
																							<li class="footable-page-arrow disabled">
																								<a class="page" data-page="prev" href="stock?stockPageNum=${stockStartPage - stockPageBlock}&tradePageNum=${tradePageNum}">‹</a>
																							</li>
																						</c:if>
																							
																						<c:forEach var="i" begin="${stockStartPage}" end="${stockEndPage}">
																						
																							<c:if test="${i == stockPageNum}">
																								<li class="footable-page active">
																									<a data-page="0">${i}</a>
																								</li>
																							</c:if>
																							
																							<c:if test="${i != stockPageNum}">
																								<li class="footable-page">
																									<a class="page" data-page="1" href="stock?stockPageNum=${i}&tradePageNum=${tradePageNum}">${i}</a>
																								</li>
																							</c:if>	
																						</c:forEach>
																						
																						<c:if test="${stockPageCount > stockEndPage}">
																							<li class="footable-page-arrow">
																								<a class="page" data-page="next" href="stock?stockPageNum=${stockStartPage + stockPageBlock}&tradePageNum=${tradePageNum}">›</a>
																							</li>
																							<li class="footable-page-arrow">
																								<a class="page" data-page="last" href="stock?stockPageNum=${stockPageCount}&tradePageNum=${tradePageNum}">»</a>
																							</li>
																						</c:if>
																					</c:if>
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