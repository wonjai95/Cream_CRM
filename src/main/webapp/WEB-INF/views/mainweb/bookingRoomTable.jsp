<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting_tags.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>bookingRoomTable.jsp</title>

<script type="text/javascript" src="${path}/resources/host/js/bookingRoomTable.js"></script>
</head>
<sec:csrfInput/>
<input type="hidden" name="selectDate" value="${selectDate}">
<input type="hidden" name="room_setting_code" value="0">
<body class="top-navigation">
	<div style="display:inline-block" id="roomTable">
		 <!-- 인원 -->
      	<table class="box">		
	      	<tr>
				<c:forEach var="dto" items="${dtos}" varStatus="status">
					<td class="roomTr${status.index}">
						<button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn${status.index}"
		           			style="margin: 10px" value="${dto.room_setting_code}">${dto.room_name}</button>
		           		<input type="text" style="display: none" name="per_price" value="${dto.per_price}">
		           		<input type="text" style="display: none" name="min_cnt" value="${dto.min_cnt}">
		           		<input type="text" style="display: none" name="max_cnt" value="${dto.max_cnt}">
		           		<input type="hidden" name="selectRoom" value="${dto.room_name}">
		           	</td>
				</c:forEach>
			</tr>
		</table>
	</div>
</body>

</html>