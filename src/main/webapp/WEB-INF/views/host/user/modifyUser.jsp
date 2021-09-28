<!-- 
이름 : 장현정
작성날짜 : 2021-09-16 ~ 2021-09-16 
회원 등록 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../../setting.jsp" %> --%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title> 회원 수정 </title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script type="text/javascript" src="${path}/resources/host/js/modifyUser.js" defer></script>
</head>
<body>
<div id="wrapper">

	<!-- frame  -->
	<jsp:include page="../Frame.jsp" />
	
<div id="page-wrapper" class="gray-bg">

	<!-- nav bar  -->
	<jsp:include page="../navbar.jsp" />

<!-- ------------------------------- 중분류 '예약등록' 상단 흰색 표기란 시작 -->
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-8">
        <h2>예약등록</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="home">Home</a>
            </li>
            <li class="breadcrumb-item">
                회원 정보
            </li>
            <li class="breadcrumb-item active">
                <strong>회원 수정</strong>
            </li>
        </ol>
    </div>
</div>
<!-- ------------------------------- 중분류 '예약등록' 상단 흰색 표기란 끝 -->

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
	    <div class="col-lg-12">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h5>회원 정보를 수정합니다.</h5>
	            
	            &nbsp;&nbsp;&nbsp;
	            <button type="button" class="btn btn-primary btn-lg"
	            		onclick="insertReservation"> 회원 수정
	            </button>
	            
	        </div>

	            </div>
	        </div>
	      </div>    
	    </div> 
	    <!-- ------------------------------- 회원 정보 출력 시작 -->
	<div class="col-sm-8">
	    <div class="ibox ">
	        <div class="ibox-title">
	            <h5>회원 수정</h5>
	        </div>
	        <div class="ibox-content">
	            <form method="get" name="modifyUser">
	                <div class="hr-line-dashed"></div>
	                <div class="form-group row"><label class="col-lg-2 col-form-label">회원번호</label>
	                    <div class="col-lg-10"><input type="text" value="U1234111" class="form-control"></div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                
	                <div class="form-group row"><label class="col-sm-2 col-form-label">이름</label>
	                    <div class="col-lg-10"><input type="text" value="장현정" class="form-control"></div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                
	                <div class="form-group row"><label class="col-lg-2 col-form-label">성별</label>
	
	                    <div class="col-sm-4"><select class="form-control m-b" name="user_gender">
	                        <option>남</option>
	                        <option>여</option>
	                    </select></div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                
					<div class="form-group" style="display: flex;">
	                	<label class="col-lg-2 col-form-label">생년월일 </label>
	                    <div class="input-group date" style="width: 80%;">
	                     	<input name="sign_birth1" type="text" class="form-control" placeholder="1999" maxlength="4">
	                     	<input name="sign_birth2" type="text" class="form-control" placeholder="01" maxlength="2">
	                     	<input name="sign_birth3" type="text" class="form-control" placeholder="01" maxlength="2">
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                
	                <div class="form-group" style="display: flex;">
	                <label class="col-lg-2 col-form-label">이메일</label>
	
	                    <input type="text" name="email1" class="form-control" maxlength="100" style="width:200px">
						&nbsp; @ &nbsp;
						<input type="text" name="email2" class="form-control" maxlength="100" style="width:200px">
						<select name="email3" class="form-control" style="width:100px" onchange="selectEmailChk();">
							<option value="0"> 직접 입력 </option>
							<option value="naver.com"> naver </option>
							<option value="google.com"> google </option>   
							<option value="nate.com"> nate </option>   
							<option value="daum.net"> daum </option>  
						</select>
	                </div> 
	                <div class="hr-line-dashed"></div>
	                
	                
	             <div class="form-group" style="display: flex;">
                	<label class="col-lg-2 col-form-label"> 주소 </label>
                    <div class="input-group date" style="width: 80%;">
                     	<input name="sign_zipcode" id="postcode" type="text" class="form-control" placeholder="postcode">
                     	<div style="width: 5px; align-self: center;"></div>
                     	<input type="button" onclick="addressSearch()" class="btn btn-primary btn-xs" style="margin: 2px 4px;" value="주소검색">
                    </div>
                 </div>
                 <div class="form-group" style="display: flex;">
                	<label class="col-lg-2 col-form-label"></label>
                    <div class="input-group date" style="width: 80%;">
                     	<input name="sign_sido" id="sido" type="text" class="form-control" placeholder="sido">
                     	<input name="sign_gugun" id="sigungu" type="text" class="form-control" placeholder="gu/gun">
                    </div>
                 </div>
                 <div class="form-group" style="display: flex; margin-bottom: 20px;">
                	<label class="col-lg-2 col-form-label"></label>
                    <div class="input-group date" style="width: 80%;">
                     	<input name="sign_address" id="detail_address" type="text" class="form-control" placeholder="address">
                    </div>
                 </div>
	                
	                
	                
	                
                <div class="hr-line-dashed"></div>
                
                <div class="form-group row"><label class="col-lg-2 col-form-label">전화번호</label>
					<div class="col-lg-10"><input type="text" value="010-1111-1111" class="form-control"></div>
					
                </div>
                <div class="hr-line-dashed"></div>   
	            </form>
	        </div>
	    </div>
	</div>
<!-- ------------------------------- 회원 수정 끝 -->
	       
	  </div> 
	  
	</div>
</body>
</html>