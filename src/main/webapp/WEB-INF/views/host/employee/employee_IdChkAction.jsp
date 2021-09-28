<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee_idChkAction.jsp</title>
<link rel="stylesheet" href="${path}/resources/host/css/confirmIdAction.css">
<script type="text/javascript" src="${path}/resources/host/js/employee_enlist.js"></script>
</head>
<body>
<form action="employee_IdChkAction" method="post" name="confirmform" 
	style="margin-top: 30px; text-align: -webkit-center;">
   
<sec:csrfInput/>
	<!-- 직원등록 완료된 id : 1 -->
	<c:if test="${selectCnt == 1}">
		<table>
			<tr align="center">
				<td colspan="2">
					<span>${employee_id}</span>는 이미 직원 등록이 완료된 아이디입니다. 
				</td>
			</tr>
			<tr>
				<th colspan="2" style="text-align: center;">
					<input type="button" class="inputButton" value="확인" id="cancelAllBtn">
				</th>
			</tr>
		</table>
	</c:if>

	<!-- 회원가입된 id(정상등록 가능) : 2 -->
	<c:if test="${selectCnt == 2}">
		<table>
			<tr align="center">
				<td colspan="2">
					<span>${employee_id}</span>는 사용가능한 아이디 입니다.
				</td>
			</tr>
			<tr>
				<th colspan="2" style="text-align: center;">
					<input type="button" class="inputButton" value="확인" id="idConfirmBtn">
					<input type="text" value="${employee_id}" id="idChkVal" style="display:none;">
				</th>
			</tr>
		</table>
	</c:if>

	<!-- 회원가입 x인 id : 3 -->
	<c:if test="${selectCnt == 3}">
		<table>
			<tr>
				<th colspan="2">
					<span>${employee_id}</span>는 이미 존재하는 아이디입니다.
				</th>			
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="employee_id" class="input" maxlength="20"
					style="width:150px" autofocus required></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" class="inputButton" id="idChkBtn2" value="확인">
					<input type="reset" class="inputButton" id="cancelBtn" value="취소">
				</th>
			</tr>
		</table>
	</c:if>
	

</form>
</body>
</html>