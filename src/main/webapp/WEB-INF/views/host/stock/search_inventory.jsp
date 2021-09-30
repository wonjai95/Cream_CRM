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
<c:forEach var="dto3" items="${dtos}" varStatus="status3">
	<tr class="footable-odd" class="inven_list${status3.index}">
		<td class="footable-visible">
			<span>${dto3.inven_code}</span>
			<input type="text" name="inven_code${status3.index}" id="inven_code${status3.index}" 
				value="${dto3.inven_code}" style="display: none;">
		</td>
		
		<td class="footable-visible">
			<span>${dto3.stock_code}</span>
		</td>
		
		<td class="footable-visible">
			<span>${dto3.stock_name}</span>
		</td>
		
		<td class="footable-visible">
			<span>${dto3.indiv_inven_cnt}개</span>
			<input type="text" name="indiv_inven_cnt${status3.index}" id="indiv_inven_cnt${status3.index}"
				 value="${dto3.indiv_inven_cnt}" style="display: none;">
		</td>
		
		<td class="text-right footable-visible footable-last-column">
			<span>${dto3.inven_date}</span>
		</td>
	</tr>
</c:forEach>
</body>
</html>