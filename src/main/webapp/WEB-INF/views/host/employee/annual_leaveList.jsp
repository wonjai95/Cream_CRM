<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting_tags.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="list2" items="${leaveList}">
	<tr class="leave">
		<td>● 연차 <input type="hidden" name="leave_cd"
			value="${list2.leave_code}">
		</td>
		<td>승인</td>
		<td>${list2.leave_date}</td>
		<td>${list2.leave_end}</td>
		<td>${list2.leave_usage_cnt}</td>
		<td>${list2.emergency_contact}</td>
		<td>
			<c:if test="${list2.leave_memo == '0'}">
				-
			</c:if> <c:if test="${list2.leave_memo != '0'}">
				${list2.leave_memo}
			</c:if>
		</td>
		<td>${list2.leave_regDatae}</td>
	</tr>
</c:forEach>
</body>
</html>