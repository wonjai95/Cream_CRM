<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting_tags.jsp"%>
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
<script type="text/javascript" src="${path}/resources/host/js/inventory.js"></script>
</head>
<body>
	<div id="tab-1" class="tab-pane active">
		<div class="panel-body" style="border: none;">
				<div class="ibox-content m-b-sm border-bottom">
					<div class="row">
						<div class="col-sm-2">
							<div class="form-group">
								<input type="month" id="inven_date" name="inven_date" value=""
									class="form-control">
							</div>
						</div>
		
						<div class="col-sm-2">
							<div class="form-group">
								<input type="text" id="keyword" name="keyword" value="" placeholder="입출고 내역 검색"
									class="form-control">
							</div>
						</div>
		
						<div class="col-sm-2">
							<div class="form-group">
								<button class="btn btn-primary dim" type="button" id="searchBtn">검색</button>
						</div>
					</div>
				</div>
			</div>
	
			<fieldset>
				<div class="wrapper wrapper-content">
					<div class="row">
						<div class="col-lg-3 animated fadeInRight" style="width:40%">
							<form action="add_periodic_inven" method="post" id="invenForm">
								<sec:csrfInput/>
								<input type="hidden" name="cnt" value="${cnt}">
								<table
									class="footable table table-stripped toggle-arrow-tiny footable-loaded tablet breakpoint"
									data-page-size="15">
									<thead>
										<tr>
											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">재고코드</span>
												
											</th>
	
											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">재고명</span>
											</th>
											
											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">실사수량</span>
											</th>
										</tr>
									</thead>
	
									<tbody>
										<c:forEach var="dto" items="${dtos}" varStatus="status">
											<tr class="footable-odd" name="inven">
												<td class="footable-visible">
													<span>
														${dto.stock_code}
														<input type="text" min="0" class="form-control" name="stock_code${status.index}" id="stock_code${status.index}" 
															value="${dto.stock_code}" style="display:none;"> 
													</span>
												</td>
												<td class="footable-visible">
													<span>${dto.stock_name}</span>
												</td>
												<td class="footable-visible">
													<input type="number" min="0" class="form-control" name="indiv_inven_cnt${status.index}" id="indiv_inven_cnt${status.index}" required> 
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div>
									<button type="submit" class="btn btn-primary dim">재고조사 등록</button>
								</div>
							</form>
						</div>
						<div class="col-lg-9 animated fadeInRight" style="width: 60%">
	
							<div class="ibox-content" style="margin: 0px; padding: 0px; border: none;">
	
								<form action="" method="post">
									<sec:csrfInput/>
									<input type="hidden" value="" id="inven_code_send">
									<input type="hidden" value="" id="indiv_inven_cnt_send">
									<table
										class="footable table table-stripped toggle-arrow-tiny footable-loaded tablet breakpoint"
										data-page-size="15">
										<thead>
											<tr>
												<th class="text-right footable-visible footable-last-column">
													<span class="footable-sort-indicator">재고조사 코드</span>
												</th>
	
												<th class="text-right footable-visible footable-last-column">
													<span class="footable-sort-indicator">재고코드</span>
												</th>
	
												<th class="text-right footable-visible footable-last-column">
													<span class="footable-sort-indicator">재고명</span>
												</th>
												
												<th class="text-right footable-visible footable-last-column">
													<span class="footable-sort-indicator">수량</span>
												</th>
												
												<th class="text-right footable-visible footable-last-column">
													<span class="footable-sort-indicator">조사일자</span>
												</th>
	
											</tr>
										</thead>
	
										<tbody class="search_result">
											<c:forEach var="dto2" items="${dtos_inven}" varStatus="status2">
												<tr class="footable-odd" class="inven_list${status2.index}">
													<td class="footable-visible">
														<span>${dto2.inven_code}</span>
														<input type="text" name="inven_code${status2.index}" id="inven_code${status2.index}" 
															value="${dto2.inven_code}" style="display: none;">
													</td>
	
													<td class="footable-visible">
														<span>${dto2.stock_code}</span>
													</td>
	
													<td class="footable-visible">
														<span>${dto2.stock_name}</span>
													</td>
	
													<td class="footable-visible">
														<span>${dto2.indiv_inven_cnt}개</span>
														<input type="text" name="indiv_inven_cnt${status2.index}" id="indiv_inven_cnt${status2.index}"
															 value="${dto2.indiv_inven_cnt}" style="display: none;">
													</td>
	
													<td class="text-right footable-visible footable-last-column">
														<span>${dto2.inven_date}</span>
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
				</fieldset>
			</div>
		</div>
</body>
</html>