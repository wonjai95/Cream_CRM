<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/setting_tags.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="dto" items="${NOL}" varStatus="status">
	<tr class="NOL_info${status.index}">
		<td>
			${dto.slip_regDate}
		<input type="hidden" name="NOL_code${status}" value="${dto.slip_code}">
		</td>
		<td>${dto.slip_type}</td>
		<td><fmt:formatNumber value="${dto.slip_money}" pattern="###,###,###원" /></td>
		<td>${dto.slip_memo}</td>
	 </tr>
</c:forEach>
</body>
</html>