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
<c:forEach var="dto2" items="${inoutList}" varStatus="status2">
	<tr class="footable-odd" class="inven_list${status2.index}">
		<td class="footable-visible">
			<span>${dto2.stock_detail_code}</span>
			<input type="text" name="inven_code${status2.index}" id="inven_code${status2.index}" 
				value="${dto2.stock_detail_code}" style="display: none;">
		</td>
	
		<td class="footable-visible">
			<span>${dto2.stock_code}</span>
		</td>
	
		<td class="footable-visible">
			<span>${dto2.stock_name}</span>
		</td>
		
		<td class="footable-visible">
			<span>${dto2.stock_pur_price}</span>
		</td>
	
		<td class="footable-visible">
			<span>${dto2.stock_pur_cnt}개</span>
			<input type="text" name="indiv_inven_cnt${status2.index}" id="indiv_inven_cnt${status2.index}"
				 value="${dto2.stock_pur_cnt}" style="display: none;">
		</td>
	
		<td class="text-right footable-visible footable-last-column">
			<span>${dto2.stock_indate}</span>
		</td>
	</tr>
</c:forEach>
</body>
</html>