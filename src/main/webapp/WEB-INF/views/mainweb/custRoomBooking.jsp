<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>custBooking.jsp</title>

   <style type="text/css">
      table {
         border-collapse: separate;
         border-spacing: 0 20px;
      }
      
	.panel-heading { margin-bottom: 20px;}
	a:link {text-decoration: none;}
	h3 {font-size: 18px;}
	address {font-size: 14px;}
	
   </style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a24a16f3acffb8fc1ba508e3c65e6c76&libraries=services"></script>
<script type="text/javascript" src="${path}/resources/host/js/custBooking.js"></script>
</head>

<body class="top-navigation">
	
    <div id="wrapper">
        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom white-bg">
        <nav class="navbar navbar-expand-lg navbar-static-top" role="navigation">
            <a href="home" class="navbar-brand">CREAMY</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-reorder"></i>
            </button>

        </nav>
        </div>
        <div class="wrapper wrapper-content">
           <form action="insertBooking" method="post" id="custBookingForm">
           <sec:csrfInput/>
           <input type="hidden" id="user_id" name="user_id" value="${sessionScope.id}">
           <input type="hidden" id="res_date" name="res_date">   
           <input type="hidden" id="res_memo" name="res_memo">
           <input type="hidden" id="host_code" name="host_code" value="${host_code}">
           <input type="hidden" id="chkDay">
           <input type="hidden" id="comp_res" value="${comp_res}">
           <input type="hidden" id="per_price" value="0">
           <input type="hidden" id="min_cnt" value="0">
           <input type="hidden" id="max_cnt" value="0">
           <input type="hidden" id="res_sales" name="res_sales" value="0">
                <div class="row">
                   <!-- col-lg-8  시작 -->
                    <div class="col-lg-6 col-md-12">
                        <div class="ibox ">
                            <div class="ibox-content">
                              <div id="calendar"></div>
                            </div>
                            <div class="ibox-content" style="margin-top: 50px;">
                               <span style="font-size:24px;"><strong>찾아오시는 길<br><br></strong></span>
                               <div id="map" style="width: auto; height:500px;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- col-lg-8 끝 -->
                    <!-- col-lg-4 시작 -->
                    <div class="col-lg-6 col-md-12">
                       <!-- ibox 시작 -->
                        <div class="ibox ">
                            <div class="ibox-title">
                                <span class="label label-warning float-right">예약</span>
                                <span class="res_date"></span>
                            </div>
                            <div class="ibox-content">
                                <div class="row">
                                   <!-- 예약 테이블 시작 -->
                                   <table class="box">
	                                    <tr>
	                                       <td><strong>호실</strong><br><br>
	                                       <small>예약 날짜를 선택하시면, 호실을 선택할 수 있습니다.</small></td>
	                                    </tr>
	                                    <tr>
	                                       <td class="dashed">
	                                         <!-- 시간 선택 -->
	                                         <div style="display:inline-block" id="roomTable">
	                                           
	                                         </div>
		                                     <div class="panel-heading" style="background-color: #e5e6e7; margin-top:15px; color: black">
		                                        <input type="text" name="selectRoom" id="selectRoom" style="display: none">선택 호실 : <span class="roomSelectedInfo">호실</span>
		                                     </div>
	                                       </td>
	                                    </tr>
	                                 </table>         
	                            <!-- 예약한 호실에 대한 상세정보 표시 --> 
                               	<div class="col-lg-12" id="roomDetail">

					            </div>              
					            
					             <!-- 인원 -->
                                 <table class="box">
                                    <tr>
                                       <td><strong>인원</strong><br><br><small>방문하시는 인원을 선택하세요.<br><br></small></td>
                                    </tr>
                                    <tr>
                                       <td>
                                          <div class="row">
                                             <div class="col-3" style="width: auto;">
                                                <input type="button" id="GuestCountMinus" name="GuestCountMinus" class="btn btn-primary" value="-" style="color:white"/>
                                             </div>
                                             <div class="col-4">
                                                <input type="number" id="GuestCount" name="GuestCount" 
                                                	maxlength="4" class="form-control text-center" value="0" readonly />
                                             </div>
                                             <div class="col-3">
                                                <input type="button" id="GuestCountPlus" name="GuestCountPlus" class="btn btn-primary" value="+" style="color:white"/>
                                             </div>
                                             <div class="offset-1"></div>
                                          </div>
                                       </td>
                                    </tr>
                                  </table>
                                  
                                  <table class="box" style="margin-top:20px;">
                                    <tr>
                                       <td><strong>금액</strong></td>
                                    </tr>
                                    <tr>
                                       <td>
                                          <div class="row">
                                             <div class="col-4">
                                                <input type="text" id="priceTotal" name="priceTotal" maxlength="4" 
                                                	class="form-control text-center" value="0" readonly />
                                             </div>
                                             <div class="offset-1"></div>
                                          </div>
                                       </td>
                                    </tr>
				           		 </table>
				           		 
				           		 <div class="form-group" style="margin-top:40px;">
                                    <span><strong>추가 요청사항</strong></span>
                                    <textarea class="form-control" placeholder="필요 시 내용을 입력하세요." rows="3"
                               			name="res_indiv_request" style="margin-top:10px; margin-bottom: 40px;"></textarea>
                           		</div>
					                 
                                  <!-- 예약 테이블 끝 -->
                                   <!-- 결제 버튼 시작 -->
                                    <input type="submit" class="btn btn-primary btn-rounded btn-block" 
                                    	formaction="insertRoomBookingAction" value="예약하기" style="font-size: 26px;">
                                   <!-- 결제 버튼 끝 -->
                                 </div>
                             </div>
                         </div>
                         <!-- ibox 끝 -->
                     </div>
                      <!-- col-lg-6 끝 -->
                 </div>
              </form>
          </div>
      </div>
    
   </div>

</body>

</html>