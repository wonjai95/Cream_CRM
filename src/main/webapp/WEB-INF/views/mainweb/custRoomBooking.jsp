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
           <form action="salePage" method="post" id="custBookingForm">
           <sec:csrfInput/>
           <input type="hidden" id="user_id" name="user_id" value="${sessionScope.id}">
           <input type="hidden" id="user_code" name="user_code" value="${sessionScope.code}">
           <input type="hidden" id="res_date" name="res_date" value="${res_date}">   
           <input type="hidden" id="res_memo" name="res_memo">
           <input type="hidden" id="host_code" name="host_code" value="${host_code}">
           <input type="hidden" id="chkDay">
           <input type="hidden" id="comp_res" name="comp_res" value="${comp_res}">
           <input type="hidden" id="per_price" value="0">
           <input type="hidden" id="min_cnt" value="0">
           <input type="hidden" id="max_cnt" value="0">
           <input type="hidden" id="res_sales" name="res_sales" value="0">
           <input type="hidden" id="use_time" name="use_time" value="0">
           <input type="hidden" id="comp_address" name="comp_address" value="${comp_address}">
           <input type="hidden" id="room_name" name="room_name" value="">
           
                <div class="row">
                   <!-- col-lg-8  ?????? -->
                    <div class="col-lg-6 col-md-12">
                        <div class="ibox ">
                            <div class="ibox-content">
                              <div id="calendar"></div>
                            </div>
                            <div class="ibox-content" style="margin-top: 50px;">
                               <span style="font-size:24px;"><strong>??????????????? ???<br><br></strong></span>
                               <div id="map" style="width: auto; height:500px;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- col-lg-8 ??? -->
                    <!-- col-lg-4 ?????? -->
                    <div class="col-lg-6 col-md-12">
                       <!-- ibox ?????? -->
                        <div class="ibox ">
                            <div class="ibox-title">
                                <span class="label label-warning float-right">??????</span>
                                <span class="res_date"></span>
                            </div>
                            <div class="ibox-content">
                                <div class="row">
                                   <!-- ?????? ????????? ?????? -->
                                   <table class="box">
	                                    <tr>
	                                       <td><strong>??????</strong><br><br>
	                                       <small>?????? ????????? ???????????????, ????????? ????????? ??? ????????????.</small></td>
	                                    </tr>
	                                    <tr>
	                                       <td class="dashed">
	                                         <!-- ?????? ?????? -->
	                                         <div style="display:inline-block" id="roomTable">
	                                           
	                                         </div>
		                                     <div class="panel-heading" style="background-color: #e5e6e7; margin-top:15px; color: black">
		                                        <input type="text" name="selectRoom" id="selectRoom" style="display: none">?????? ?????? : <span class="roomSelectedInfo">??????</span>
		                                     </div>
	                                       </td>
	                                    </tr>
	                                 </table>         
	                            <!-- ????????? ????????? ?????? ???????????? ?????? res_start, res_end --> 
                               	<div class="col-lg-12" id="roomDetail">

					            </div>              
					            
					             <!-- ?????? -->
                                 <table class="box">
                                    <tr>
                                       <td><strong>??????</strong><br><br><small>??????????????? ????????? ???????????????.<br><br></small></td>
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
                                       <td><strong>??????</strong></td>
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
                                    <span><strong>?????? ????????????</strong></span>
                                    <textarea class="form-control" placeholder="?????? ??? ????????? ???????????????." rows="3"
                               			name="res_indiv_request" style="margin-top:10px; margin-bottom: 40px;"></textarea>
                           		</div>

                                  <!-- ?????? ????????? ??? -->
                                   <!-- ?????? ?????? ?????? -->
                                    <input type="submit" class="btn btn-primary btn-rounded btn-block" 
                                    	formaction="salePage" value="????????????" style="font-size: 26px;">
                                   <!-- ?????? ?????? ??? -->
                                 </div>
                             </div>
                         </div>  
                         <!-- ibox ??? -->
                     </div>
                      <!-- col-lg-6 ??? -->
                 </div>
              </form>
          </div>
      </div>
    
   </div>

</body>

</html>