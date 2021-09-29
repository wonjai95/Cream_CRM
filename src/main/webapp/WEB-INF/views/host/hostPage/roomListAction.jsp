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

	<c:forEach var="item" items="${list}">
		<tr class="footable-odd">
			<td class="footable-visible">&nbsp;&nbsp;
				<input type="radio" name="room_setting_code" value="${item.room_setting_code}">
			</td>
			<td class="footable-visible"><span>${item.room_name}</span></td>
			<td class="footable-visible"><span>${item.room_stat}</span></td>
			<td class="footable-visible"><span>${item.per_price}</span></td>
			<td class="footable-visible"><span>${item.min_cnt}</span></td>
			<td class="footable-visible"><span>${item.max_cnt}</span></td>
		</tr>
	</c:forEach>

</body>
</html>