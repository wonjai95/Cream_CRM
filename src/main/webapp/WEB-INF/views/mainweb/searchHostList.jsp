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
    <title>searchHostList</title>
<script type="text/javascript" src="${path}/resources/host/js/selectHost.js"></script>
</head>
<sec:csrfInput/>
<input type="hidden" name="selectDate" value="${selectDate}">
<div class="row" id="hostList">
	<c:forEach var="dto" items="${dtos}">
	    <div class="col-lg-4">
	        <div class="contact-box">
	            <a class="row" href="custBooking?host_code=${dto.host_code}&comp_address=${dto.comp_address}&comp_res=${dto.comp_res}" 
	            	style="justify-content: center;">
	             <div class="col-8" style="text-align: center;">
	                 <h3><strong>${dto.comp_name}</strong></h3>
	                 <p>${dto.host_name}</p>
	                 <address>
	                    <i class="fa fa-map-marker"></i> <strong>${dto.comp_address}</strong><br>
	                                                               우편번호 : ${dto.zipcode}<br>
	                     	전화 : ${dto.host_ph}<br>
	                 </address>
	             </div>
	            </a>
	        </div>
	    </div>
   </c:forEach>
</div>

</html>