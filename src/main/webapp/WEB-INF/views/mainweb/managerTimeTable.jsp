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
    <title>bookingTimeTable.jsp</title>

   <style type="text/css">
      table {
         border-collapse: separate;
         border-spacing: 0 20px;
      }
      
      .panel-heading {
         margin-bottom: 20px;
      }
   
   </style>
<script type="text/javascript" src="${path}/resources/host/js/managerTimeTable.js"></script>
</head>

<body class="top-navigation">
	<div style="display:inline-block" id="managerTable">
		 <!-- 인원 -->
      	<table class="box">		
      		<tr>
      			<c:if test="${dtos.size() == 0}">
      				예약 가능한 담당자가 없습니다.
      			</c:if>
      			<c:if test="${dtos.size() != 0}">
			      	<c:forEach var="dto" items="${dtos}" varStatus="status">
						<td class="mangTr${status.index}">
							<button type="button" class="btn btn-outline btn-primary" class="managerBtn" id="managerBtn${status.index}" 
				                 style="margin: 10px" value="${dto.employee_name}">${dto.employee_name}</button>
				             <input type="text" style="display: none" name="employee_code" value="${dto.employee_code}">
			             </td>
					</c:forEach>
				</c:if>
			</tr>
		</table>
	</div>
</body>

</html>