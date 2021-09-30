<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/setting.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>Insert title here</title>
<script type="text/javascript" src="${path}/resources/host/js/Non_operating_loss.js"></script>
</head>
<body>
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-6 col-md-12" style="width: 30%;">
				<div class="ibox" style="padding: 0;">
					<div class="ibox-content">
						<h3 style="font-size: 20px;">전표 입력</h3>
						<hr>
						<p class="small">비용, 수익, 법인세등을 적어주세요.</p>

						<form id="SGAform">
							<sec:csrfInput />
							<div class="form-group">
								<label>날짜</label> <input type="date" class="form-control"
									name="operloss_regDate" style="width: 50%;" required>
							</div>

							<div class="form-group">
								<label>유형</label><br> <input type="button"
									class="btn btn-outline btn-primary" name="operloss_type1"
									id="operloss_type1" value="비용"> <input type="button"
									class="btn btn-outline btn-primary" name="operloss_type2"
									id="operloss_type3" value="수익"> <input type="button"
									class="btn btn-outline btn-primary" name="operloss_type3"
									id="operloss_type4" value="법인세등"> <input type="text"
									style="display: none" name="operloss_type" id="operloss_type">
							</div>

							<div class="form-group">
								<label>금액</label> <input type="text" class="form-control"
									name="operloss_money" style="width: 50%;" placeholder="금액을 입력해주세요."
									required>
							</div>

							<div class="form-group">
								<label>메모</label>
								<textarea class="form-control" name="operloss_memo"
									style="width: 80%;" placeholder="영업외 손익 내용" rows="3" required></textarea>
							</div>
							<br> <input type="button" class="btn btn-primary btn-block"
								id="insertNOL" value="등록"> <input type="reset"
								class="btn btn-primary btn-block" value="취소">
						</form>
					</div>
				</div>
			</div>

			<!-- 리스트 부분 -->
			<div class="col-lg-6 col-md-12" style="width: 70%;">
				<div class="ibox" style="padding: 0;">
					<div class="ibox-content" style="height: auto;">
						<div class="row">
							<div class="col-sm-5 m-b-xs" style="width: 30%;">
								<select class="form-control-sm form-control input-s-sm inline"
									name="operloss_type" style="width: 80%;">
									<option value="0">유형 선택</option>
									<option value="비용">비용</option>
									<option value="수익">수익</option>
									<option value="법인세등">법인세등</option>
								</select>
							</div>
							<div class="col-sm-4 m-b-xs" style="width: 30%;">
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-sm btn-white "> <input
										type="radio" name="options" id="option1" autocomplete="off"
										checked> Day
									</label> <label class="btn btn-sm btn-white active"> <input
										type="radio" name="options" id="option2" autocomplete="off">
										Week
									</label> <label class="btn btn-sm btn-white"> <input
										type="radio" name="options" id="option3" autocomplete="off">
										Month
									</label>
								</div>
							</div>
							<div class="col-sm-3" style="width: 40%;">
								<div class="input-group">
									<input placeholder="Search" type="text" id="Search_NOLcontent"
										class="form-control form-control-sm"> <span
										class="input-group-append"> <input type="button"
										class="btn btn-sm btn-primary" id="Search_NOLbtn" value="검색">
									</span>
								</div>

							</div>
						</div>
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>날짜</th>
										<th>유형</th>
										<th>금액</th>
										<th>메모</th>
									</tr>
								</thead>
								<tbody id="operlossList">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>