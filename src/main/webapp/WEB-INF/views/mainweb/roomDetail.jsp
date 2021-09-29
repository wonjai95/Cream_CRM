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
    <title>roomDetail.jsp</title>

<style>
	.home_div {
	    border-radius: 10px;
	    margin-bottom: 5px;
	    padding: 5px;
	}
</style>

<script type="text/javascript" src="${path}/resources/host/js/bookingRoomTable.js"></script>
</head>
<sec:csrfInput/>
<input type="hidden" name="selectDate" value="${selectDate}">

<body class="top-navigation">
<div class="col-lg-12" id="roomDetail">
<div class="ibox ">
	<input type="hidden" name="open_sche" value="${open_sche}">
	<input type="hidden" name="close_sche" value="${close_sche}">
    <div class="ibox-title">
        <h5>호실 상세 정보  - 영업시간 : ${open_sche} ~ ${close_sche}</h5>
    </div>
    <div class="ibox-content">
        <div id='external-events'>
            <p style="font-size: 14px;">최소/최대 인원수 : ${roomDto.min_cnt} / ${roomDto.max_cnt}</p>
           	<p style="font-size: 14px;">1인당 가격 : <fmt:formatNumber pattern="#,###">${roomDto.per_price}</fmt:formatNumber> 원</p>
           	<hr>
           	<p style="font-size: 14px;">${selectDate} 해당 호실 예약 현황</p>
            <c:forEach var="dto" items="${dtos}">
            	<div class='home_div navy-bg'>&nbsp; 예약 완료 :&nbsp; ${dto.res_start} - ${dto.res_end}</div>
            </c:forEach>
            <br>
				<p class="m-t" style="border-top: 1px solid gray; padding-top: 15px; display: flex; margin-bottom: 10px;">
					<span class="timeTxt" style="font-size: 16px; place-self: center;">시간 입력 : &nbsp;</span> 
					<input type="number" class="form-control" placeholder="시작 NN" name="res_start" min="0" max="24"
						 style="width: 25%" required>
						 <span class="timeTxt" style="font-size: 16px; place-self: center;">&nbsp;시&nbsp; ~ &nbsp;&nbsp;</span>
					<input type="number" class="form-control" placeholder="종료 NN" name="res_end" min="0" max="24"
						 style="width: 25%" required>
						 <span class="timeTxt" style="font-size: 16px; place-self: center;">&nbsp;시 </span>            
				</p>
        </div>
         <div class="panel-heading" style="background-color: #e5e6e7; margin-top:15px; color: black">
	         <input type="text" name="calTime" id="calTime" style="display: none">이용 시간 : <span class="calTime">N </span>시간
	      </div>
    </div>
</div>
</div>              
</body>

</html>