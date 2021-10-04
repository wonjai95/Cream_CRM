<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//다음 주소입력 API
	function addressSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				//우편번호
				document.getElementById('postcode').value = data.zonecode;
				//시도
				document.getElementById('sido').value = data.sido;
				//구군
				document.getElementById('sigungu').value = data.sigungu;

				var fullAddr = '';
				var extraAddr = '';
				if (data.userSelectedType === 'R') {
					if (data.buildingName !== '') {
						extraAddr = "(" + data.buildingName + ")";
					}
					fullAddr = data.roadAddress;
					fullAddr += extraAddr;
				} else {
					fullAddr = data.jibunAddress;
				}
				document.getElementById('comp_address').value = fullAddr;

				document.getElementById("chkPostBtn").value = "1";
			}
		}).open();

	}

	function chkfrom() {
		if (document.getElementById("chkPostBtn").value == "0") {
			alert("주소를 입력하세요");
			return false;
		}

		if (document.getElementById("com_res").value == "0") {
			alert("예약 종류를 선택하세요.");
			return false;
		}
	}
</script>
</head>
<body>


	<div class="ibox-content">
		<h2>사업자 정보</h2>

		<c:if test="${hostVo.comp_no != null}">
			<p class="font-bold">사업자 정보</p>
			<form action="" method="post">
				<div class="form-group">
					<label>사업자 번호</label> <input type="text" class="form-control"
						name="comp_no" readonly value="${hostVo.comp_no}">
				</div>
				<div class="form-group">
					<label>주소</label> <input type="text" class="form-control"
						name="comp_address" readonly value="${hostVo.comp_address}">
				</div>
				<div class="form-group">
					<label>업태</label> <input type="text" class="form-control"
						name="comp_condition" readonly value="${hostVo.comp_condition}">
				</div>
				<div class="form-group">
					<label>업종</label> <input type="text" class="form-control"
						name="comp_type" readonly value="${hostVo.comp_type}">
				</div>
				<div class="form-group">
					<label>우편번호</label> <input type="text" class="form-control"
						name="zipcode" readonly value="${hostVo.zipcode}">
				</div>
				<div class="form-group">
					<label>예약 종류</label> <input type="text" class="form-control"
						name="com_res" readonly value="${hostVo.comp_res}">
				</div>
			</form>
		</c:if>

		<c:if test="${hostVo.comp_no == null}">
			<form action="addCompanyAction" method="post"
				onsubmit="return chkfrom();">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}"> <input type="hidden"
					id="chkPostBtn" value="0">
				<div class="form-group">
					<label>업태</label> <input type="text" class="form-control"
						name="comp_condition" required>
				</div>
				<div class="form-group">
					<label>업종</label> <input type="text" class="form-control"
						name="comp_type" required>
				</div>


				<div class="form-group">
					<label>주소</label>
					<div class="form-group" style="display: flex;">
						<div class="input-group date" style="width: 80%;">
							<input name="zipcode" id="postcode" type="text"
								class="form-control" readonly placeholder="우편번호">
							<div style="width: 5px; align-self: center;"></div>
							<input type="button" onclick="addressSearch()"
								class="btn btn-primary btn-xs" style="margin: 2px 4px;"
								value="주소검색">
						</div>
					</div>
					<div class="form-group" style="display: flex;">
						<div class="input-group date" style="width: 80%;">
							<input name="sido" id="sido" type="text" class="form-control"
								placeholder="시/도" readonly> <input name="gugun"
								id="sigungu" type="text" class="form-control" placeholder="구/군"
								readonly>
						</div>
					</div>
					<div class="form-group" style="display: flex; margin-bottom: 20px;">
						<div class="input-group date" style="width: 80%;">
							<input name="comp_address" id="comp_address" type="text"
								class="form-control" placeholder="상세주소">
						</div>
					</div>
				</div>

				<div class="form-group">
					<label>예약 종류</label> <select name=comp_res id="com_res"
						class="form-control">
						<option value="0" selected>선택</option>
						<option value="담당자">담당자</option>
						<option value="호실">호실</option>
					</select>
				</div>

				<br>
				<div>
					<button class="btn btn-sm btn-primary m-t-n-xs" type="submit">
						<strong>등록</strong>
					</button>
				</div>
			</form>
		</c:if>

	</div>


</body>
</html>