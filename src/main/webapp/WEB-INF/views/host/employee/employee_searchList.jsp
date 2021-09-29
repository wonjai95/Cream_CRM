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
<c:forEach var="dto" items="${dtos}" varStatus="status">
	<tr class="employee${status.index}">
		<td id="empCode${status.index}">
			<input type="text" name="employee${status.index}" value="${dto.employee_code}"
					style="display: none">${dto.employee_code}
		</td>
		<td>
			<input type="text" name="employee_name${status.index}" value="${dto.employee_name}"
					style="display: none">
			<span style="text-decoration: none; color:black;">${dto.employee_name}</span>
		</td>
		<td>${dto.department}</td>
		<td class="center">${dto.position}</td>
		<td class="center">${dto.employee_hireDate}</td>
	</tr>
</c:forEach>
</body>
</html>