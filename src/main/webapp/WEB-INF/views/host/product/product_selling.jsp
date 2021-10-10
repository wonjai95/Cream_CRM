<!-- 
이름 : 장현정
작성날짜 : 2021-09-16 ~ 2021-09-16 
회원에게 상품 판매 처리
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title> 상품 판매 </title>
<script type="text/javascript" src="${path}/resources/host/js/product_selling.js"></script>
</head>
<body>
<form action="selling_action" name="">
<div id="wrapper">

<!-- 버튼 클릭시 전달할 상품정보 코드 -->   
<input type="hidden" value="0" name="product_typeOfSales_hidden">
<input type="hidden" value="0" name="product_name_hidden">
<input type="hidden" value="0" name="product_price_hidden">
<input type="hidden" value="0" name="product_rentalPeriod_hidden">


<!-- 버튼 클릭시 전달할 버튼 코드 -->   
<input type="hidden" value="0" name="cash_btn_hidden">



<!-- ------------------------------- 판매 정보 시작 -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
	    <div class="col-lg-12">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h5>상품판매를 진행합니다.</h5>
	            
	            &nbsp;&nbsp;&nbsp;
	            <button type="submit" id="selling" class="btn btn-primary btn-lg"> 상품 판매 </button>
	            
	        </div>
<!-- ------------------------------- 판매 정보 끝 -->

<!-- ------------------------------- 회원정보 시작 -->
<div class="row">
<div class="col-sm-4">
<div class="ibox selected">
	<div class="ibox-content">
	    <div class="tab-content">
	        <div id="contact-1" class="tab-pane active">    
	            
	            <div class="row m-b-lg">
	                <div class="col-lg-4 text-center">     
	                    <h2><input type="hidden" name="user_name" value="${dto_user.user_name}">${dto_user.user_name}</h2>    
	
	                    <div class="m-b-sm">
	                        <img alt="image" class="rounded-circle" src="img/a2.jpg" style="width: 62px">
	                    </div>
	                </div>              
	                <div class="col-lg-8">
	                    <strong>
	                        	자기소개
	                    </strong>
	
	                    <p>
	                       <input type="hidden" name="user_memo" value="${dto_user.user_memo}">${dto_user.user_memo}
	                    </p>
	                    <button type="button" class="btn btn-primary btn-sm btn-block"><i class="fa fa-envelope"></i> Send Message
	                    </button>
	                </div>
	            </div>
	            <div class="client-detail">
	            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="full-height-scroll" style="overflow: hidden; width: auto; height: 100%;">
	
	                <strong>기본정보</strong>
	
	                <ul class="list-group clear-list">
	                    <li class="list-group-item fist-item">
	                        <span class="float-right"> 회원번호 : </span>
	                        <input type="hidden" name="user_code" value="${dto_user.user_code}">${dto_user.user_code}
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 이름 : </span>
	                        <input type="hidden" name="user_name" value="${dto_user.user_name}">${dto_user.user_name}
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 담당자 : </span>
	                      	<input type="hidden" name="employ_name" value="employ_name조인해야함">employ_name조인해야함
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 휴대폰 : </span>
	                        <input type="hidden" name="user_ph" value="${dto_user.user_ph}">${dto_user.user_ph}
	                    </li>
	                    <li class="list-group-item">
	                        <span class="float-right"> 주소 : </span>
	                        <input type="hidden" name="user_address" value="(${dto_user.zipcode})${dto_user.user_address}">(${dto_user.zipcode})${dto_user.user_address}
	                    </li>
	                    
	                    <hr>
	                    <li class="list-group-item">
	                        <span class="float-right"> 총 구매 : </span>
	                        <input type="hidden" name="" value="">
	                    </li>
	                    <li class="list-group-item">  
	                        <span class="float-right"> 총 금액 : </span>
	                        <input type="hidden" name="" value="">
	                    </li>         
	                </ul>
	                <strong>Notes</strong>
	                <p>
	                    만성 두피건조증이 있습니다. 무쪼록 잘 부탁드려요.
	                </p>
	                <hr>
	                
	                <div class="slimScrollBar" style="background-color: rgb(0, 0, 0); width: 7px; position: absolute; top: 42px; opacity: 0.4; display: none; border-top-left-radius: 7px; border-top-right-radius: 7px; border-bottom-right-radius: 7px; border-bottom-left-radius: 7px; z-index: 99; right: 1px; height: 412.88936627282493px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-top-left-radius: 7px; border-top-right-radius: 7px; border-bottom-right-radius: 7px; border-bottom-left-radius: 7px; background-color: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
	            </div>
	            </div>
	        </div>
	      </div>  
	    </div>    
	  </div>      
	</div>
<!-- ------------------------------- 회원정보 끝 -->
	
<!-- ------------------------------- 상품 판매 시작 -->
	<div class="col-sm-4">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h5>상품 판매</h5>
	        </div>
	        
	        <div class="ibox-content m-b-sm border-bottom">  
	            
	            
	            <div class="col-sm-5" style="display: flex">
					<div class="form-group">    
						<select name="" id="" class="form-control">
							<option value="판매형태" selected="">판매형태</option>
							<option value="서비스">서비스</option>
							<option value="기간">기간</option>
						</select>
					</div>
					
					<div class="form-group">
					
						<select name="" id="" class="form-control">
							<option value="1" selected="">상품 그룹</option>
							<option value="2">회원권</option>
							<option value="3">정액제</option>
							<option value="4">염색</option>
							<option value="4">펌</option>
						</select>
					</div>
				</div>
				<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 300px;">
	            <div class="scroll_content" style="overflow: hidden; width: auto; height: 300px;">


				<fieldset>
	            <table class="table table-hover" data-page-size="15">
					<thead>
		            <tr>
		                <th>판매유형</th>
		                <th>상품명</th>
		                <th>가격</th>
		                <th>이용기간</th>
		            </tr>
		            </thead>
		            <c:forEach var="dto_product" items="${dto_product}" varStatus="status">
					<input type="hidden" name="product_code" value="${dto_product.product_code}">
		            <tbody>
			            <tr class="product${status.index}" id="product${status.index}">
			                <td id="product_typeOfSales${status.index}">${dto_product.product_typeOfSales}<input type="hidden" name="product_typeOfSales${status.index}" value="${dto_product.product_typeOfSales}"></td>
			                <td id="product_name${status.index}">${dto_product.product_name}<input type="hidden" name="product_name${status.index}" value="${dto_product.product_name}"></td>
			                <td id="product_price${status.index}">${dto_product.product_price}<input type="hidden" name="product_price${status.index}" value="${dto_product.product_price}"></td>
			                <td id="product_rentalPeriod${status.index}">${dto_product.product_rentalPeriod}<input type="hidden" name="product_rentalPeriod${status.index}" value="${dto_product.product_rentalPeriod}"></td>
			            </tr>
						
		            </tbody>
		            </c:forEach>
		           
				</table>
				</fieldset>
				</div>
				</div>
	                
	                <div class="hr-line-dashed"></div>
	        </div>
	        
	    </div>
	   <!-- ------------------------------- 장바구니 시작 -------------------------------------------------->
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h5>장바구니</h5>
	        </div>
	        <div class="ibox-content m-b-sm border-bottom">  
	        
	                <div class="col-sm-10">
	                    <button type="button" id="add_btn" class="btn btn-outline btn-primary">추가</button>
	                    <button type="button" id="del_btn" class="btn btn-outline btn-primary">삭제</button>
	                 </div>
                
	            <table class="footable table table-stripped toggle-arrow-tiny footable-loaded tablet breakpoint" data-page-size="15">
					<thead>
		            <tr>
		                <th>장바구니 상품</th>
		                <th>옵션</th>
		                <th>가격</th>
		            </tr>
		            </thead>
		            <tbody>
			            <tr class="cartList">
			                <td id="cart_product_name"><input type="hidden" name="cart_product_name" value=""></td>
			                <td id="cart_product_typeOfSales"><input type="hidden" name="cart_product_typeOfSales" value=""></td>
			                <td id="cart_product_price"><input type="hidden" name="cart_product_price" value=""></td>    
			            </tr>
			            
		            </tbody>
				</table>
	                
	                <div class="hr-line-dashed"></div>
	        </div>
	    </div> 
	</div>
	 
<!-- -------------------------------상품 판매 끝 -->

<!-- ------------------------------- 결제정보 시작 -->
	<div class="col-sm-4">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h5>결제 정보</h5>
	        </div>
	        <div class="ibox-content">
	                <div class="form-group row">
	                <label class="col-sm-3 col-form-label">결제 금액</label>
	                    <div class="col-lg-8" id="total_payment"><input type="hidden" name="total_payment"></div>
	                </div>
	                <hr>
	                <div class="hr-line-dashed"></div>
	                
	                <div class="form-group  row">
	                <label class="col-sm-3 col-form-label">납부 방법</label>
	                	<input type="hidden" name="payment_option" value="">
		                <div class="col-sm-8" name="">  
		                	<table>   
		                	<tr><td>
			                    <input type="button" name="cash_btn" id="cash_btn" value="현금" class="btn btn-outline btn-primary" >
			                    <input type="button" name="credit_btn" id="credit_btn" value="카드" class="btn btn-outline btn-primary" >
			                    <input type="button" name="bank_btn" id="bank_btn" value="무통장" class="btn btn-outline btn-primary" >
			                    <input type="button" name="kakao_btn" id="kakao_btn" value="카카오페이" class="btn btn-outline btn-primary" onclick="kakaoPay();">
		                    </td></tr> 
		                    </table>
		                 </div>
		            </div>
		           
	                <div class="hr-line-dashed"></div> 
	                
	                <div class="form-group row">
	                <label class="col-sm-3 col-form-label">금융 기관</label>

	                	<div id="banking" class="col-sm-8" style="display:flex;">
		                     <div class="col-sm-6">
		                     <select name="credit_select" id="credit_select" class="form-control">
								<option value="1" selected="">카드 선택</option>
	                             <option value="samsung">삼성카드</option> 
	                             <option value="bc">BC카드</option>
	                             <option value="kookmin">국민카드</option>
	                             <option value="hana">하나카드</option>
	                             <option value="shinhan">신한카드</option>
	                             <option value="lotte">롯데카드</option>
	                             <option value="hyundai">현대카드</option>
	                             <option value="nonghyup">농협카드</option>
	                             
                        	 </select>
                        	 </div> 
                        	 <div class="col-sm-6">
		                     <select name="credit_installment" id="credit_installment" class="form-control">
								<option value="1" selected="">일시불</option>
	                             <option value="2">2개월</option>
	                             <option value="3">3개월</option>
	                             <option value="4">4개월</option>
	                             <option value="5">5개월</option>
	                             <option value="6">6개월</option>
	                             <option value="7">7개월</option>
	                             <option value="8">8개월</option>
	                             <option value="9">9개월</option>
	                             <option value="10">10개월</option>
	                             <option value="11">11개월</option>
	                             <option value="12">12개월</option>
	                             <option value="20">20개월</option>
	                             <option value="24">24개월</option>
	                             <option value="36">36개월</option>
                        	 </select>
                        	 </div> 
		                </div> 
		                
		            </div> 
	                <div class="hr-line-dashed"></div> 
	                
	                <div class="form-group  row">
	                <label class="col-sm-3 col-form-label">판매 일자</label>
		                <div class="col-sm-8">
							<input name="sale_date" type="date" class="form-control">
		                </div>
		            </div> 
		            <div class="hr-line-dashed"></div> 
		            <div class="form-group  row">
	                <label class="col-sm-3 col-form-label">납부 일자</label>
		                <div class="col-sm-8">
						    <input type="date" class="form-control"> 
		                	<input type="radio" value="" onclick="">판매 일자와 같음
		                	<!-- ??????????????나중에 하자 현정아..체크박스.. -->
		                	<div class="icheckbox_square-green" style="position: relative;">             
		                	<input type="checkbox" class="i-checks" style="position: absolute; opacity: 0;">dd
		                	<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div>
		                	
		                </div>         
		            </div> 
	                <div class="hr-line-dashed"></div>
	                <div class="form-group  row">
	                <label class="col-sm-3 col-form-label">수납자</label>
		                <div class="col-sm-8">
			                     <select name="employee_name" id="" class="form-control">
			                     <option value="1" selected="">미지정</option>
									<c:forEach var="dto_emp" items="${dtos}">
 		                            	<option value="${dto_emp.employee_code}">${dto_emp.employee_name}</option> 
	                            	</c:forEach>
	                        	 </select>
                        </div>   
		            </div>    
		            <div class="hr-line-dashed"></div> 
	                <div class="form-group  row">
	                <label class="col-sm-3 col-form-label">납부 메모</label>
		                <div class="col-sm-8">
		                	<input type="text" name="sale_memo">
                        </div> 
		            </div>
	                <div class="hr-line-dashed"></div> 
	        </div>
	    </div>
	</div>
<!-- ------------------------------- 결제정보 끝 -->

			</div>  
			</div>    
		</div>
	</div>    
</div>
</div>
</form>
</body>
</html>