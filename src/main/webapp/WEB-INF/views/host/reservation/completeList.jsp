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

<c:forEach var="mdto" items="${mdtos}">

<c:if test="${mdto.comp_res eq '담당자'}">
		
	<c:if test="${cnt > 0}">
		<tr class="gradeX">
			<td style="text-align:center">
				<!-- 상세페이지 -->
				<a href="completeDetails?res_code=${mdto.res_code}&res_detail_code=${mdto.res_detail_code}&user_id=${mdto.user_id}&comp_res=${mdto.comp_res}">${mdto.res_code}</a>
			</td>
			
			<td style="text-align:center">${mdto.user_id}</td>
			<%-- ${param.dto.user_id} --%>
			<td style="text-align:center">${mdto.employee_code}</td>
			
			<td style="text-align:center">${mdto.res_state}</td>
			
			<td style="text-align:center">${mdto.res_hour}시</td>
			
			<td style="text-align:center">${mdto.res_date}</td>
		</tr>
	</c:if>
</c:if>

</c:forEach>



<c:forEach var="rdto" items="${rdtos}">

<c:if test="${rdto.comp_res eq '호실'}">

	<c:if test="${cnt > 0}">
	<%-- <c:if test="${dto.res_state == '서비스 완' > 0}"> --%>
	<%-- c:forEach var="작은 바구니 참조변수(임의로 지정하기)" items="${큰 바구니}" --%>
	
		<tr class="gradeX">
			<td style="text-align:center">
				<!-- 상세페이지 -->
				<a href="completeDetails?res_code=${rdto.res_code}&res_detail_code=${rdto.res_detail_code}&user_id=${rdto.user_id}&comp_res=${rdto.comp_res}">${rdto.res_code}</a>
			</td>
			
			<td style="text-align:center">${rdto.user_id}</td>
			<%-- ${param.dto.user_id} --%>
			<td style="text-align:center">${rdto.room_name}</td>
			
			<td style="text-align:center">${rdto.res_state}</td>
			
			<td style="text-align:center">${rdto.res_hour}시</td>
			
			<td style="text-align:center">${rdto.res_date}</td>
		</tr>
	</c:if>
	
	<%-- </c:if> --%>


</c:if>
</c:forEach>
				
				
</body>
</html>