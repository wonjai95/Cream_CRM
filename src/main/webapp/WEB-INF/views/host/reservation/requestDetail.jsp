<!-- 
이름 : 이시현
작성날짜 : 2021-09-16 ~ 2021-09-16 
회원으로부터 예약 요청된 내용을 나타내는 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<title> 예약상세정보 </title>

<script type="text/javascript">
// 예약등록 버튼을 눌러 INSERT하기
/* 	function insertReservation(){
		var qty = document.getElementById("c_quantity").value;
		var m_number = document.getElementById("m_number").value;
		m_number = document.getElementById("m_number").innerHTML;
		if(qty == 0){
			alert("수량을 입력해 주세요.");
		}else{
			var m_name = document.getElementById("m_name").innerHTML;
			var isTrue = confirm(m_name +" "+ qty + "개를 장바구니에 담으시겠습니까?");
			
			if(isTrue==true){
				window.location = 'cartPutAction.bo_od?c_quantity=' + qty + '&m_number=' + m_number;
			}
		}
	} */
	
	function insertReservation(){		
		var isTrue = confirm("해당 요청을 등록하시겠습니까?");
		
		if(isTrue==true){
			window.location = 'insertAction';
		} else {
			window.location = 'requestDetail';
		}
	}
	
	function modifyReservation(){		
		var isTrue = confirm("해당 요청을 수정하시겠습니까?");
		
		if(isTrue==true){
			return true;
			//window.location = 'modifyAction?res_code=${dto.res_code}&res_detail_code=${dto.res_detail_code}&res_state=${dto.res_state}&res_hour=${dto.res_hour}&res_room=${dto.res_room}&res_cnt=${dto.res_cnt}&employee_code=${dto.employee_code}&res_indiv_request=${dto.res_indiv_request}&res_memo=${dto.res_memo}';
		} else {
			return false;
			//window.location = 'requestDetail';
		}
	}
	
	function deleteReservation(){		
		var isTrue = confirm("해당 요청을 취소하시겠습니까?");
		
		if(isTrue==true){
			return true;
		} else {
			return false;
		}
	}
	
	function completeService(){		
		var isTrue = confirm("해당 서비스를 완료하시겠습니까?");
		
		if(isTrue==true){
			return true;
		} else {
			return false;
		}
	}
	

</script>

<script type="text/javascript">

	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/requestDetail',  // 전송페이지 => 컨트롤러/basic1_next
			type : 'POST',						// 전송방식('GET', 'POST')
			dataType : {},						// 요청한 데이터 형식('html', 'xml', 'json', text', 'jsoup')
			success : function(data) {			// 콜백함수 - 전송에 성공했을때의 결과(= basic1_next.jsp)가 data 변수에 전달된다.
				$('#requestDetail').html(data);	// .html은 innerHTML과 같다. data 변수명은 내가 임의로 정하기 나름.
			},				
			error : function() {
				alert('오류');
			}
		});
	});
</script>

<script type="text/javascript" src="${path}/resources/host/js/reservationDetail.js"></script>
</head>
<body>

<!-- ------------------------------- 테이블표 시작 전 '예약요청' 설명란 시작 -->
<div class="panel-body">
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		    <div class="col-lg-12">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h5>예약요청건에 대해 관리합니다.</h5>
	            
	            &nbsp;&nbsp;&nbsp;
	            <button type="submit" class="btn btn-primary btn-lg"
	            		formaction="insertAction">예약 등록
	            </button>
	            &nbsp;&nbsp;&nbsp;
	            <button type="submit" class="btn btn-primary btn-lg"
	            		formaction="modifyAction" form="requestDetail" onclick="return modifyReservation();">예약 수정
	            </button>
	            &nbsp;&nbsp;&nbsp;
	            <button type="submit" class="btn btn-primary btn-lg"
	            		formaction="deleteAction" form="requestDetail" onclick="return deleteReservation();">예약 취소
	            </button>
	            &nbsp;&nbsp;&nbsp;
	            <button type="submit" class="btn btn-primary btn-lg"
	            		formaction="completeAction" form="requestDetail" onclick="return completeService();">서비스 완료
	            </button>
	            &nbsp;&nbsp;&nbsp;
	            <button type="button" class="btn btn-primary btn-lg"
	            		onclick="window.location='reservation'">예약요청목록
	            </button>	            
	        </div>
<!-- ------------------------------- 테이블표 시작 전 '예약등록' 설명란 끝 -->

<!-- ------------------------------- 회원정보 시작 -->
<div class="row">
<div class="col-sm-4">
<div class="ibox selected">
	<div class="ibox-content">
	    <div class="tab-content">
	        <div id="contact-1" class="tab-pane active">
	            <div class="row m-b-lg">
	                <div class="col-lg-4 text-center">
	                    <h2>${udto.user_name}</h2>
	                </div>
	                <div class="col-lg-8">
	                    <strong>
	                        자기소개
	                    </strong>
	
	                    <p>
	                        ${udto.user_memo}
	                        <!-- 안녕하세요. 서울 신림동에 사는 강수현입니다. 사장님이 헤어 펌 잘하신다고 여기저기 소문이 많이 나서 가입합니다.
	                        잘 부탁드려요~! -->
	                    </p>
	                </div>
	            </div>
	            
	            <div class="hr-line-dashed"></div>
	            
	            <div class="client-detail">
	            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="full-height-scroll" style="overflow: hidden; width: auto; height: 100%;">
	            	<form action="" id="userDetail">
	            	<strong>기본정보</strong>
	                
	                <ul class="list-group clear-list">
	                    <li class="list-group-item fist-item">
	                        <span class="float-right"> 회원코드 : </span>
	                        ${udto.user_code}
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 회원아이디 : </span>
	                        ${udto.user_id}
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 생년월일 : </span>
	                        ${udto.user_birth}
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 성별 : </span>
	                        ${udto.user_gender}
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 휴대폰 : </span>
	                        ${udto.user_ph}
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 결혼기념일 : </span>
	                        ${udto.wedding_anniversary}
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right">차량번호 : </span>
	                        ${udto.car_number}
	                    </li>
	                </ul>
	                
	                
	                </form>
	                <hr>
	            </div><div class="slimScrollBar" style="background-color: rgb(0, 0, 0); width: 7px; position: absolute; top: 42px; opacity: 0.4; display: none; border-top-left-radius: 7px; border-top-right-radius: 7px; border-bottom-right-radius: 7px; border-bottom-left-radius: 7px; z-index: 99; right: 1px; height: 412.88936627282493px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-top-left-radius: 7px; border-top-right-radius: 7px; border-bottom-right-radius: 7px; border-bottom-left-radius: 7px; background-color: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
	            </div>
	        </div>
	      </div>  
	    </div>    
	  </div>      
	</div>
<!-- ------------------------------- 회원정보 끝 -->
	
<!-- ------------------------------- 예약상세정보 조회(담당자) 시작 -->
<c:if test="${mdto.comp_res eq '담당자'}">
	<div class="col-sm-8">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h3>예약 상세</h3>
	            <small>예약 코드 : ${mdto.res_code}</small>
	        </div>
	        <div class="ibox-content">
<!-- form -->	<form action="" method="post" id="requestDetail">
				<sec:csrfInput/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" id="res_code" name="res_code" value="${mdto.res_code}">
				<input type="hidden" id="user_id" name="user_id" value="${mdto.user_id}">
				<input type="hidden" id="res_review_chk" name="res_review_chk" value="${mdto.res_review_chk}">
				<input type="hidden" id="product_code" name="product_code" value="${mdto.product_code}">
				<input type="hidden" id="res_detail_code" name="res_detail_code" value="${mdto.res_detail_code}">
	                <!-- 예약 테이블 시작 -->
                    <table class="box">
                     <!-- 예약 상태 -->
                     <tr>
                        <td><strong>예약상태</strong></td>
                     </tr>
                     <tr>
                        <td>
                           <div style="display:inline-block">
                              <button type="button" class="btn btn-outline btn-primary" class="typeBtn" id="stateBtn1"
                                 style="margin: 10px" value="예약신청">예약신청</button>
                              <button type="button" class="btn btn-outline btn-primary" class="typeBtn" id="stateBtn2"
                                 style="margin: 10px" value="예약중">예약중</button>
                           </div>
                           <div class="col-lg-3" style="margin-top:15px; color: black">
                         <%-- <input type="text" name="selectType" id="selectType" style="display: none">형태 : <span class="stateSelectedInfo">${dto.res_state}</span> --%>
                         <input type="text" name="res_state" id="selectState" value="${mdto.res_state}">
                      </div>
                      <div class="hr-line-dashed"></div>
                        </td>
                     </tr>
                     
                     
                     <tr>
                        <td><strong>날짜</strong>
                     </tr>
                     <tr>
                        <td class="dashed">
                           <!-- 날짜 -->
                           <div class="col-lg-3" style="margin-top:15px; color: black">
                              <input type="date" id="res_date" name="res_date" value="${mdto.res_date}"  readonly>
                           </div>
                      <div class="hr-line-dashed"></div>
                        </td>
                     </tr>
                     
                     
                     <tr>
                        <td><strong>시간</strong><br></td>
                     </tr>
                     <tr>
                        <td class="dashed">
                           <!-- 시간 -->
                           <div style="display:inline-block">
                              <button type="button" class="btn btn-outline btn-primary" class="timeBtn" id="timeBtn1"
                                 style="margin: 10px" value="09:00">09:00</button>
                              <button type="button" class="btn btn-outline btn-primary" class="timeBtn" id="timeBtn2"
                                 style="margin: 10px" value="10:00">10:00</button>
                              <button type="button" class="btn btn-outline btn-primary" class="timeBtn" id="timeBtn3"
                                 style="margin: 10px" value="11:00">11:00</button>
                              <button type="button" class="btn btn-outline btn-primary" class="timeBtn" id="timeBtn4"
                                 style="margin: 10px" value="12:00">12:00</button>
                              <button type="button" class="btn btn-outline btn-primary" class="timeBtn" id="timeBtn5"
                                 style="margin: 10px" value="13:00">13:00</button>
                              <button type="button" class="btn btn-outline btn-primary" class="timeBtn" id="timeBtn6"
                                 style="margin: 10px" value="14:00">14:00</button>
                              <button type="button" class="btn btn-outline btn-primary" class="timeBtn" id="timeBtn7"
                                 style="margin: 10px" value="15">15:00</button>
                              <button type="button" class="btn btn-outline btn-primary" class="timeBtn" id="timeBtn8"
                                 style="margin: 10px" value="16">16:00</button>
                              <button type="button" class="btn btn-outline btn-primary" class="timeBtn" id="timeBtn9"
                                 style="margin: 10px" value="17">17:00</button>
                              <button type="button" class="btn btn-outline btn-primary" class="timeBtn" id="timeBtn10"
                                 style="margin: 10px" value="18">18:00</button>
                           </div>
                      <div class="col-lg-3" style="margin-top:15px; color: black">
                         <%-- <input type="text" name="selectTime" id="selectTime" value="${dto.res_hour}" style="display: none">선택 시간 : <span class="timeSelectedInfo">${dto.res_hour}</span> --%>
			         	 <input type="text" name="res_hour" id="selectTime" value="${mdto.res_hour}">
                      </div>
                      <div class="hr-line-dashed"></div>
                        </td>
                     </tr>
   
                     <!-- 인원 -->
                     <tr>
                        <td><strong>인원</strong></td>
                     </tr>
                     <tr>
                        <td>
                           <div class="row" style="margin-top:15px; color: black">
                              <div class="col-3" style="width: auto;">
                                 <input type="button" id="GuestCountMinus" name="GuestCountMinus" class="btn btn-primary" value="－" />
                              </div>
                              <div class="col-2">
                                 <!-- <input type="text" id="GuestCount" name="GuestCount" maxlength="4" class="form-control text-center" value="0" readonly /> -->
                                 <input type="text" id="GuestCount" name="res_cnt" maxlength="4" class="form-control text-center" value="${mdto.res_cnt}" readonly>
                              </div>
                              <div class="col-3">
                                 <input type="button" id="GuestCountPlus" name="GuestCountPlus" class="btn btn-primary" value="＋" />
                              </div>
                              <div class="offset-1"></div>
                           </div>
                     <div class="hr-line-dashed"></div>   
                        </td>
                     </tr>
                     
                     <!-- 담당자 -->
                     <tr>
                        <td><strong>담당자</strong></td>
                     </tr>
                     <tr>
                        <td>
                           <div style="display:inline-block">
                              <button type="button" class="btn btn-outline btn-primary" class="managerBtn" id="managerBtn1" 
                                 value="E181" style="margin: 10px">정원제</button>
                              <button type="button" class="btn btn-outline btn-primary" class="managerBtn" id="managerBtn2" 
                                 value="E201" style="margin: 10px">이시현</button>
                              <button type="button" class="btn btn-outline btn-primary" class="managerBtn" id="managerBtn3"
                                 value="E202" style="margin: 10px">주수림</button>
                           </div>
                           <div class="col-lg-3" style="margin-top:15px; color: black">
                               <%-- <input type="text" name="selectManager" id="selectManager" style="display: none">담당자 : <span class="managerSelectedInfo">${dto.employee_code}</span> --%>
                               <input type="text" name="employee_code" id="selectManager" value="${mdto.employee_code}">
                           </div>
                         <div class="hr-line-dashed"></div>   
							</td>
						</tr>  
						
						<!-- 금액 -->
						<tr>
							<td><span><strong>금액</strong></span></td>
						</tr>
						<tr>
							<td>
								<div class="col-4" style="margin-top:15px;">
									<input type="text" id="priceTotal" name="res_sales" 
									class="form-control text-center" value="${mdto.res_sales} 원" />
								</div>
						<div class="hr-line-dashed"></div>   
							</td>
						</tr>
                           
                         <!-- 고객의 추가 요청사항 -->
	                     <tr>
	                        <td><span><strong>추가 요청사항</strong></span></td>
	                     </tr>
	                     <tr>
	                        <td>
								<div class="form-group" style="margin-top:15px;">
								<textarea class="form-control" rows="3"
	                         			name="res_indiv_request" style="margin-top:10px; color: black">
	                         			${mdto.res_indiv_request}
								</textarea>
	                     		</div>
	                     <div class="hr-line-dashed"></div>   
	                        </td>
	                     </tr>
                     
                     
                     
                     <!-- 직원 기타메모 -->
                     <tr>
                        <td><strong>담당자 기타메모</strong></td>
                     </tr>
                     <tr>
                        <td>
                     
			         <div class="col-lg-12" style="margin-top:15px; color: black">
			         	<input type="text" id="res_memo" name="res_memo"
			         			value="${mdto.res_memo}" class="form-control">
			         </div>
			  				<div class="hr-line-dashed"></div>  
			                     </td>
			                     </tr>
                  		</table>                             
						<!-- 예약 테이블 끝 -->
						</form>
		                </div>
				                
				                
				        </div>
				    </div>
				</c:if>
<!-- ------------------------------- 예약상세정보 조회(담당자) 끝 -->

<!-- ------------------------------- 예약상세정보 조회(호실) 시작 -->
<c:if test="${rdto.comp_res eq '호실'}">
	<div class="col-sm-8">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h3>예약 상세</h3>
	            <small>예약 코드 : ${rdto.res_code}</small>
	        </div>
	        <div class="ibox-content">
<!-- form -->	<form action="" method="post" id="requestDetail">
				<sec:csrfInput/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" id="res_code" name="res_code" value="${rdto.res_code}">
				<input type="hidden" id="user_id" name="user_id" value="${rdto.user_id}">
				<input type="hidden" id="res_review_chk" name="res_review_chk" value="${rdto.res_review_chk}">
				<input type="hidden" id="product_code" name="product_code" value="${rdto.product_code}">
				<input type="hidden" id="res_detail_code" name="res_detail_code" value="${rdto.res_detail_code}">
	                <!-- 예약 테이블 시작 -->
                    <table class="box">
                     <!-- 예약 상태 -->
                     <tr>
                        <td><strong>예약상태</strong></td>
                     </tr>
                     <tr>
                        <td>
                           <div style="display:inline-block">
                              <button type="button" class="btn btn-outline btn-primary" class="typeBtn" id="stateBtn1"
                                 style="margin: 10px" value="예약신청">예약신청</button>
                              <button type="button" class="btn btn-outline btn-primary" class="typeBtn" id="stateBtn2"
                                 style="margin: 10px" value="예약중">예약중</button>
                           </div>
                           <div class="col-lg-3" style="margin-top:15px; color: black">
                         <%-- <input type="text" name="selectType" id="selectType" style="display: none">형태 : <span class="stateSelectedInfo">${dto.res_state}</span> --%>
                         <input type="text" name="res_state" id="selectState" value="${rdto.res_state}">
                      </div>
                      <div class="hr-line-dashed"></div>
                        </td>
                     </tr>
                     
                     
                     <tr>
                        <td><strong>날짜</strong>
                     </tr>
                     <tr>
                        <td class="dashed">
                           <!-- 날짜 -->
                           <div class="col-lg-3" style="margin-top:15px; color: black">
                              <input type="date" id="res_date" name="res_date" value="${rdto.res_date}"  readonly>
                           </div>
                      <div class="hr-line-dashed"></div>
                        </td>
                     </tr>
                     
                     
                     <tr>
                        <td><strong>시간</strong><br></td>
                     </tr>
                     <tr>
                        <td class="dashed">
                           <!-- 시간 -->
                           
                      <div class="col-lg-12" style="margin-top:15px; color: black">
                         <%-- <input type="text" name="selectTime" id="selectTime" value="${dto.res_hour}" style="display: none">선택 시간 : <span class="timeSelectedInfo">${dto.res_hour}</span> --%>
			         	 <input type="text" name="res_start" id="selectTime" value="${rdto.res_start}">
			         	 ~
			         	 <input type="text" name="res_end" id="selectTime" value="${rdto.res_end}">
                      </div>
                      <div class="hr-line-dashed"></div>
                        </td>
                     </tr>
                     
                     
   
                     <!-- 호실 -->
                     <tr>
                        <td><strong>호실</strong></td>
                     </tr>
                     <tr>
                        <td>
                           <!-- <div style="display:inline-block">
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn1"
                                 value="301호" style="margin: 10px">301호</button>
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn2"
                                  value="302호" style="margin: 10px">302호</button>
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn3"
                                  value="303호" style="margin: 10px">303호</button>
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn1"
                                 value="304호" style="margin: 10px">304호</button>
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn2"
                                  value="305호" style="margin: 10px">305호</button>
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn3"
                                  value="306호" style="margin: 10px">306호</button>
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn1"
                                 value="307호" style="margin: 10px">307호</button>
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn2"
                                  value="308호" style="margin: 10px">308호</button>
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn3"
                                  value="309호" style="margin: 10px">309호</button>
                           </div> -->
                           <div class="panel-heading" style="background-color: #e5e6e7; margin-top:15px; color: black">
                         <input type="text" name="room_name" id="selectRoom" style="display: none"><span class="roomSelectedInfo">${rdto.room_name}</span>
                         <%-- <input type="text" name="room_name" id="selectRoom" value="${rdto.room_name}"> --%>
                      </div>
  				
  						<div class="hr-line-dashed"></div> 
                        </td>
                     </tr>
   
                     <!-- 인원 -->
                     <tr>
                        <td><strong>인원</strong></td>
                     </tr>
                     <tr>
                        <td>
                           <div class="row" style="margin-top:15px; color: black">
                              <div class="col-3" style="width: auto;">
                                 <input type="button" id="GuestCountMinus" name="GuestCountMinus" class="btn btn-primary" value="－" />
                              </div>
                              <div class="col-4">
                                 <!-- <input type="text" id="GuestCount" name="GuestCount" maxlength="4" class="form-control text-center" value="0" readonly /> -->
                                 <input type="text" id="GuestCount" name="res_cnt" maxlength="4" class="form-control text-center" value="${rdto.res_cnt}" readonly>
                              </div>
                              <div class="col-3">
                                 <input type="button" id="GuestCountPlus" name="GuestCountPlus" class="btn btn-primary" value="＋" />
                              </div>
                              <div class="offset-1"></div>
                           </div>
                     <div class="hr-line-dashed"></div>   
                        </td>
                     </tr>
                     
                     <!-- 금액 -->
                     <tr>
                        <td><span><strong>금액</strong></span></td>
                     </tr>
                     <tr>
                        <td>
							<div class="col-4" style="margin-top:15px;">
							<input type="text" id="priceTotal" name="res_sales" 
							class="form-control text-center" value="${rdto.res_sales} 원" />
                     		</div>
                     <div class="hr-line-dashed"></div>   
                        </td>
                     </tr>
                     
                     <!-- 고객의 추가 요청사항 -->
                     <tr>
                        <td><span><strong>추가 요청사항</strong></span></td>
                     </tr>
                     <tr>
                        <td>
							<div class="form-group" style="margin-top:15px;">
							<textarea class="form-control" rows="3"
                         			name="res_indiv_request" style="margin-top:10px; color: black">
                         			${rdto.res_indiv_request}
							</textarea>
                     		</div>
                     <div class="hr-line-dashed"></div>   
                        </td>
                     </tr>
                     
                     <!-- 직원 기타메모 -->
                     <tr>
                        <td><strong>담당자 기타메모</strong></td>
                     </tr>
                     <tr>
                        <td>
                     
			         <div class="col-lg-12" style="margin-top:15px; color: black">
			         	<input type="text" id="res_memo" name="res_memo"
			         			value="${rdto.res_memo}" class="form-control">
			         </div>
			  				<div class="hr-line-dashed"></div>  
			                     </td>
			                     </tr>
                  		</table>                             
						<!-- 예약 테이블 끝 -->
						</form>
		                </div>
				                
				                
				        </div>
				    </div>
				</c:if>



<!-- ------------------------------- 예약상세정보 조회(호실) 끝 -->
			</div>
			</div>  
			</div>    
		</div>
	</div>  
</div>  




<!-- Mainly scripts -->
    <script src="${path}/resources/bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="${path}/resources/bootstrap/js/popper.min.js"></script>
    <script src="${path}/resources/bootstrap/js/bootstrap.js"></script>
    <script src="${path}/resources/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${path}/resources/bootstrap/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="${path}/resources/bootstrap/js/inspinia.js"></script>
    <script src="${path}/resources/bootstrap/js/plugins/pace/pace.min.js"></script>

    <!-- iCheck -->
    <script src="${path}/resources/bootstrap/js/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            });
        </script>





</body>

</html>