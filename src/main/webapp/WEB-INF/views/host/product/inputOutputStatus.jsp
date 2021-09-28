<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
					<div class="col-lg-9 animated fadeInRight">
						<div class="ibox-content" style="margin: 0px; padding: 0px;">
							<form action="" method="post" onsubmit="">
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

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">구분</span>
											</th>

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">거래처 이름</span>
											</th>

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">입고 날짜</span>
											</th>

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">브랜드</span>
											</th>

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">재고명</span>
											</th>

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">가격</span>
											</th>

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">수량</span>
											</th>
											
											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">총 금액</span>
											</th>

										</tr>
									</thead>

									<tbody>

										<c:forEach var="st" items="${stList}">
											<tr class="footable-odd">

												<td class="footable-visible"><span>${st.stock_status}</span>
												</td>

												<td class="footable-visible"><span>${st.trade_name}</span>
												</td>

												<td class="footable-visible"><span>${st.stock_indate}</span>
												</td>

												<td class="footable-visible"><span>${st.stock_brand}</span>
												</td>

												<td class="footable-visible"><span>${st.stock_name}</span>
												</td>
												
												<td class="footable-visible"><span>${st.stock_price}</span>
												</td>
												
												<td class="footable-visible"><span>${st.stock_count}</span>
												</td>

												<td class="text-right footable-visible footable-last-column">
													<span class="label label-primary">${st.stock_count * st.stock_price}</span>
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
</body>
</html>