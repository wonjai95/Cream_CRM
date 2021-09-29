<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
<script type="text/javascript">
	function setRoom() {
		var url = "setRoom";
		window
				.open(url, "호실 등록",
						"width=800, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
</script>
</head>
<body>

	<div class="panel-body">
		<fieldset>
			<div class="wrapper wrapper-content">
				<div class="row">
					<div class="col-lg-9 animated fadeInRight">
						<div class="ibox-content" style="margin: 0px; padding: 0px;">
							<form action="" method="post" onsubmit="">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">

								<div id="p_group" style="display: flex;">
									<div>
										<button type="button" class="btn btn-primary dim"
											onclick="setRoom();">호실 등록</button>
									</div>
									<div>
										<button type="button" class="btn btn-primary dim"
											onclick="detailProduct();">호실 수정</button>
									</div>
									<div>
										<button type="submit" class="btn btn-primary dim">호실
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
												onclick="unselectedProduct();">선택</span>
											</th>

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">호실 이름</span>
											</th>

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator"> <select>
														<option value="0" selected>호실 상태</option>
														<option value="사용가능">사용 가능</option>
														<option value="사용불가능">사용 불가능</option>
												</select>
											</span>
											</th>

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">가격</span>
											</th>

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">최소인원</span>
											</th>

											<th class="text-right footable-visible footable-last-column">
												<span class="footable-sort-indicator">최대인원</span>
											</th>
										</tr>
									</thead>

									<tbody id="rooms">
										<!--  
										<tr class="footable-odd">
											<td class="footable-visible">&nbsp;&nbsp; 
												<input type="radio" name="" value="">
											</td>

											<td class="footable-visible"><span></span>
											</td>

											<td class="footable-visible"><span></span>
											</td>

											<td class="footable-visible"><span></span>
											</td>

											<td class="footable-visible"><span></span>
											</td>
											
											<td class="footable-visible"><span></span>
											</td>
										</tr>
										-->

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