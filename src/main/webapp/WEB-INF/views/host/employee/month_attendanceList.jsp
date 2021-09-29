<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting_tags.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="list1" items="${attList}" varStatus="status">
	<tr class="attendance">
    	<td>
			<fmt:formatDate value="${list1.attendance_date}" pattern="dd" />
			<input type="hidden" name="attendance_cd" value="${list1.attendance_code}">
		</td>
		<td>${list1.check_in_time}</td>
		<td>
	 		<c:if test="${list1.check_out_time == '0'}">
				-
			</c:if>
		
			<c:if test="${list1.check_out_time != '0'}">
				${list1.check_out_time}
	 		</c:if>
		</td>
		<td>
	 		<c:if test="${list1.lateChk == '0'}">
				-
			</c:if>
		
			<c:if test="${list1.lateChk !=  '0'}">
				${list1.lateChk}
		 	</c:if>
		</td>
		<td>${list1.memo}</td>
		<td>${list1.temperature}</td>
		<td>
			<c:if test="${list1.examination_chk1 != null || list1.examination_chk2 != null || list1.examination_chk3 != null}">
				O
			</c:if>
			<c:if test="${list1.examination_chk1 == null || list1.examination_chk2 == null || list1.examination_chk3 == null}">
				X
			</c:if>
		</td>
		<td>${list1.examination_chk1}</td>
		<td>${list1.examination_chk2}</td>
		<td>${list1.examination_chk3}</td>
	</tr>
</c:forEach>
</body>
</html>