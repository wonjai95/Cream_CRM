<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting_tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="dto" items="${dtos}">

<c:if test="${dto.comp_res eq '담당자'}">

	<c:if test="${cnt > 0}">
	<%-- <c:if test="${dto.res_state == '서비스 완' > 0}"> --%>
	<%-- c:forEach var="작은 바구니 참조변수(임의로 지정하기)" items="${큰 바구니}" --%>
	
		<tr class="gradeX">
			<td style="text-align:center">
				<!-- 상세페이지 -->
				<a href="requestDetails?res_code=${dto.res_code}&res_detail_code=${dto.res_detail_code}&user_id=${dto.user_id}">${dto.res_code}</a>
			</td>
			
			<td style="text-align:center">${dto.user_id}</td>
			<%-- ${param.dto.user_id} --%>
			<td style="text-align:center">${dto.employee_code}</td>
			
			<td style="text-align:center">${dto.res_state}</td>
			
			<td style="text-align:center">${dto.res_hour}시</td>
			
			<td style="text-align:center">${dto.res_date}</td>
		</tr>
	</c:if>
	
	<%-- </c:if> --%>
</c:if>
</c:forEach>




<c:forEach var="dto" items="${dtos}">

<c:if test="${dto.comp_res eq '호실'}">

	<c:if test="${cnt > 0}">
	<%-- <c:if test="${dto.res_state == '서비스 완' > 0}"> --%>
	<%-- c:forEach var="작은 바구니 참조변수(임의로 지정하기)" items="${큰 바구니}" --%>
	
		<tr class="gradeX">
			<td style="text-align:center">
				<!-- 상세페이지 -->
				<a href="requestDetails?res_code=${dto.res_code}&res_detail_code=${dto.res_detail_code}&user_id=${dto.user_id}">${dto.res_code}</a>
			</td>
			
			<td style="text-align:center">${dto.user_id}</td>
			<%-- ${param.dto.user_id} --%>
			<td style="text-align:center">${dto.room_name}</td>
			
			<td style="text-align:center">${dto.res_state}</td>
			
			<td style="text-align:center">${dto.res_hour}시</td>
			
			<td style="text-align:center">${dto.res_date}</td>
		</tr>
	</c:if>
	
	<%-- </c:if> --%>


</c:if>
</c:forEach>
				
				
</body>
</html>