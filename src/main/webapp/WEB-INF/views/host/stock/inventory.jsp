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
	

})	

	
</script>
</head>
<body>
	<div id="tab-1" class="tab-pane active">
		<div class="panel-body">
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
								<input type="text" id="keyword" name="keyword" value="" placeholder="검색어"
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
						<div class="col-lg-3 animated fadeInRight" style="width: 30%">
							<form action="deleteTradeAction" method="post">
								<sec:csrfInput/>
								<div id="p_group">
									<div>
										<span id="inven_sysdate"></span>
									</div>
									<div>
										<button type="button" class="btn btn-primary dim">재고조사 등록</button>
											
									</div>
								</div>
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
											<tr class="footable-odd" name="inven${status.index}">
												<td class="footable-visible">
													<span>${dto.stock_code}</span>
												</td>
												<td class="footable-visible">
													<span>${dto.stock_name}</span>
												</td>
												<td class="footable-visible">
													<input type="text" class="form-control" id="indiv_inven_cnt" required>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
						<div class="col-lg-9 animated fadeInRight" style="width: 70%">
	
							<div class="ibox-content" style="margin: 0px; padding: 0px;">
	
								<form action="deleteStockAction" method="post">
									<sec:csrfInput/>
									<div id="p_group">
										<div>
											<button type="button" class="btn btn-primary dim">수정</button>
										</div>
										<div>
											<button type="button" class="btn btn-primary dim">삭제</button>
										</div>
									</div>
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
	
										<tbody>
	
											<c:forEach var="dto2" items="${dtos_inven}" varStatus="status2">
												<tr class="footable-odd">
													<td class="footable-visible">
														<span>${dto2.inven_code}</span>
													</td>
	
													<td class="footable-visible">
														<span>${dto2.stock_code}</span>
													</td>
	
													<td class="footable-visible">
														<span>${dto2.stock_name}</span>
													</td>
	
													<td class="footable-visible">
														<span>${dto2.indiv_inven_cnt}개</span>
													</td>
	
													<td class="text-right footable-visible footable-last-column">
														<span class="label label-primary">${dto2.inven_date}</span>
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