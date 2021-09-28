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

	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/completeDetail',  // 전송페이지 => 컨트롤러/basic1_next
			type : 'POST',						// 전송방식('GET', 'POST')
			dataType : {},						// 요청한 데이터 형식('html', 'xml', 'json', text', 'jsoup')
			success : function(data) {			// 콜백함수 - 전송에 성공했을때의 결과(= basic1_next.jsp)가 data 변수에 전달된다.
				$('#completeDetail').html(data);	// .html은 innerHTML과 같다. data 변수명은 내가 임의로 정하기 나름.
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
	            <h5>서비스 완료건에 대해 관리합니다.</h5>
	            
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
	                        <%-- ${udto.user_memo} --%>
	                        안녕하세요. 서울 신림동에 사는 강수현입니다. 사장님이 헤어 펌 잘하신다고 여기저기 소문이 많이 나서 가입합니다.
	                        잘 부탁드려요~!
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
	                        <span class="float-right"> 성별 : </span>
	                        ${udto.user_gender}
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 휴대폰 : </span>
	                        ${udto.user_ph}
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
	
<!-- ------------------------------- 예약등록표 시작 -->
	<div class="col-sm-8">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h3>예약 상세</h3>
	            <small>예약 코드 : ${dto.res_code}</small>
	        </div>
	        <div class="ibox-content">
<!-- form -->	<form action="" method="post" id="completeDetail">
				<sec:csrfInput/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" id="res_code" name="res_code" value="${dto.res_code}">
				<input type="hidden" id="user_id" name="user_id" value="${dto.user_id}">
				<input type="hidden" id="res_review_chk" name="res_review_chk" value="${dto.res_review_chk}">
				<input type="hidden" id="product_code" name="product_code" value="${dto.product_code}">
				<input type="hidden" id="res_detail_code" name="res_detail_code" value="${dto.res_detail_code}">
	                <!-- 예약 테이블 시작 -->
                    <table class="box">
                     <!-- 예약 상태 -->
                     <tr>
                        <td><strong>예약상태</strong></td>
                     </tr>
                     <tr>
                        <td>
                           <div class="col-lg-3" style="margin-top:15px; color: black">
                         <%-- <input type="text" name="selectType" id="selectType" style="display: none">형태 : <span class="stateSelectedInfo">${dto.res_state}</span> --%>
                         <input type="text" name="res_state" id="res_state" value="${dto.res_state}" readonly style="background-color:#DCDCDC">
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
                              <input type="date" id="res_date" name="res_date" value="${dto.res_date}" readonly style="background-color:#DCDCDC">
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
                      <div class="col-lg-3" style="margin-top:15px; color: black">
                         <%-- <input type="text" name="selectTime" id="selectTime" value="${dto.res_hour}" style="display: none">선택 시간 : <span class="timeSelectedInfo">${dto.res_hour}</span> --%>
			         	 <input type="text" name="res_hour" id="res_hour" value="${dto.res_hour}" readonly style="background-color:#DCDCDC">
                      </div>
                      <div class="hr-line-dashed"></div>
                        </td>
                     </tr>
                     
                     
   
                     <%-- <!-- 호실 -->
                     <tr>
                        <td><strong>호실</strong></td>
                     </tr>
                     <tr>
                        <td>
                           <div style="display:inline-block">
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn1"
                                 value="1실" style="margin: 10px">1실</button>
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn2"
                                  value="2실" style="margin: 10px">2실</button>
                              <button type="button" class="btn btn-outline btn-primary" class="roomBtn" id="roomBtn3"
                                  value="3실" style="margin: 10px">3실</button>
                           </div>
<!-- sql에서는 varchar(4)로 되어있어서 한글까지 넣으려면 sql을 다시 수정해야한다. -->
                           <div class="panel-heading" style="background-color: #e5e6e7; margin-top:15px; color: black">
                         <input type="text" name="selectRoom" id="selectRoom" style="display: none">호실 : <span class="roomSelectedInfo">${dto.res_room}호실</span>
                         <input type="text" name="res_room" id="selectRoom" value="${dto.res_room}">
                      </div>
                      
                      <div class="form-group row"><label class="col-lg-2 col-form-label">호실</label>

					        <div class="col-sm-4"><select class="form-control m-b" name="room">
					            <option>A301호</option>
					            <option>A302호</option>
					            <option>A303호</option>
					            <option>A304호</option>
					            <option>A305호</option>
					            <option>A306호</option>
					            <option>A307호</option>
					        </select></div>
					    </div>
  				
  						<div class="hr-line-dashed"></div> 
                        </td>
                     </tr> --%>
   
                     <!-- 인원 -->
                     <tr>
                        <td><strong>인원</strong></td>
                     </tr>
                     <tr>
                        <td>
                           <div class="row" style="margin-top:15px; color: black">
                                 <!-- <input type="text" id="GuestCount" name="GuestCount" maxlength="4" class="form-control text-center" value="0" readonly /> -->
                                 <input type="text" id="res_cnt" name="res_cnt" maxlength="4" class="form-control text-center" value="${dto.res_cnt}" readonly style="background-color:#DCDCDC">
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
                           <div class="col-lg-3" style="margin-top:15px; color: black">
                               <%-- <input type="text" name="selectManager" id="selectManager" style="display: none">담당자 : <span class="managerSelectedInfo">${dto.employee_code}</span> --%>
                               <input type="text" name="employee_code" id="employee_code" value="${dto.employee_code}" readonly style="background-color:#DCDCDC">
                           </div>
                           
                           <!-- 고객의 추가 요청사항 -->
                           <div class="form-group" style="margin-top:30px;">
                         <span><strong>추가 요청사항</strong></span>
                         <textarea class="form-control" rows="3"
                         			name="res_indiv_request" style="margin-top:10px; color: black" readonly style="background-color:#DCDCDC">
                         			${dto.res_indiv_request}
                         </textarea>
    <!-- textarea 다시 체크해 볼 것! -->
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
			         			value="${dto.res_memo}" class="form-control" readonly style="background-color:#DCDCDC">
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
				</div>
<!-- ------------------------------- 예약등록표 끝 -->
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