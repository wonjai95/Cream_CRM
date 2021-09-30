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
</head>
<body>

	<div class="ibox-content">
		<h2>호실 등록</h2>
		<p class="font-bold">호실 상세</p>
		<form id="frm">
			<!-- <form action="setRoomAction" method="post" onsubmit="return chkform();"> -->
			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
			<input type="hidden" id="hiddenName">
			<input type="hidden" name="room_setting_code" id="room_setting_code" value="${vo.room_setting_code}">
			<div class="form-group">
				<label>호실 이름</label> <input type="text" class="form-control"
					name="room_name" id="room_name" value="${vo.room_setting_code}">
			</div>
			<p class="font-bold" id="chkName" style="display: none;"></p>
			<div class="form-group">
				<label>호실 상태</label> <select name=room_stat id="room_stat" 
					class="form-control">
					<option value="0">여부 선택</option>
					<c:if test="${vo.room_stat == '사용가능'}">
						<option value="사용가능" selected>사용가능</option>
					</c:if>
					
					<c:if test="${vo.room_stat != '사용가능'}">
						<option value="사용가능">사용가능</option>
					</c:if>
					
					<c:if test="${vo.room_stat == '사용불가능'}">
						<option value="사용불가능" selected>사용불가능</option>
					</c:if>
					
					<c:if test="${vo.room_stat != '사용불가능'}">
						<option value="사용불가능">사용불가능</option>
					</c:if>
				</select>
			</div>

			<div class="form-group">
				<label>1인당 가격</label> <input type="text" class="form-control"
					name="per_price" id="per_price" value="${vo.per_price}">
			</div>
			<div class="form-group">
				<label>최소 인원수</label> <input type="number" class="form-control"
					min="1" max="999" name="min_cnt" id="min_cnt" value="${vo.min_cnt}">
			</div>
			<div class="form-group">
				<label>최대 인원수</label> <input type="number" class="form-control"
					min="1" max="9999" name="max_cnt" id ="max_cnt" value="${vo.max_cnt}">
			</div>
			<div align="center">
				<div><br></div>
				<button class="btn btn-sm btn-primary m-t-n-xs" id="submitForm"
					type="button">
					<strong>등록</strong>
				</button>
			</div>
		</form>
		
	</div>

</body>
</html>