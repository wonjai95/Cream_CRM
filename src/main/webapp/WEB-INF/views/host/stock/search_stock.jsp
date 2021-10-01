<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting_tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Insert title here</title>
</head>
<body>
<sec:csrfInput/>
<c:forEach var="stock" items="${stockList}">
	<tr class="footable-odd">
		<td class="footable-visible">&nbsp;&nbsp; <input
			type="radio" name="stock_code"
			value="${stock.stock_code}">
		</td>
		<td class="footable-visible"><span>${stock.stock_status}</span></td>
		<td class="footable-visible"><span>${stock.stock_name}</span></td>
		<td class="footable-visible"><span>${stock.stock_brand}</span></td>
		<td class="footable-visible"><span>${stock.stock_cnt}개</span></td>
		<td class="footable-visible">
			<span>${stock.trade_code}</span>
		</td>
	</tr>
</c:forEach>
</body>
</html>