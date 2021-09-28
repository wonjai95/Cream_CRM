<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>employee_detail</title>

<script type="text/javascript" src="${path}/resources/host/js/employee_detail.js"></script>

</head>
<body style="background-color:white;">
	
<!-- Main -->
<div class="row">
    <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title"  style="padding:10px 21px;">
                <h4 style="display:inline-block;">회원정보</h4>
                	<!-- form태그 밖에서 submit를 하기 위한 방법 -->
                	<!-- 2. form에 지정한 id를 button의 form태그에 넣어주면 된다. -->
                		<div class="button-wrap" style="display:inline-block; float:right;">
							<button class="btn btn-primary btn-sm" type="submit" form="modify">수정</button>
							<button class="btn btn-white btn-sm" type="button" onclick="window.close();">취소</button>
						</div>
	            </div>
	            
	            <!-- 직원 정보 -- 시작 -->
	            <div class="ibox-content">
	            	<!-- 1. form태그에 id 지정하기 -->
	                <form action="employee_updateAction" method="get" id="modify">
	                	<table class="table">
				           
				            <tbody>
				            <tr class="" style="border-top:1px solid;">
				                <td>직원코드</td>
				                <td><input type="text" class="form-control" name="employee_code" style="width:50%;" value="${dtos.employee_code}" readonly></td>
				                <td>부서</td>
				                <td><input type="text" class="form-control" name="department" style="width:50%;" value="${dtos.department}"></td>
				            </tr>
				            <tr class="">
				                <td>직원ID</td>
				                <td><input type="text" class="form-control" name="employee_id" style="width:50%;" value="${dtos.employee_id}" readonly></td>
				                <td>직책</td>
				                <td><input type="text" class="form-control" name="position" style="width:50%;" value="${dtos.position}"></td>
				            </tr>
				            <tr class="">
				                <td>직원이름</td>
				                <td><input type="text" class="form-control" name="employee_name" style="width:50%;" value="${dtos.employee_name}"></td>
				                <td>직위</td>
				                <td><input type="text" class="form-control" name="duty" style="width:50%;" value="${dtos.duty}"></td>
				            </tr>
				            <tr class="">
				                <td>성별</td>
				                <td>
				                	<c:if test="${dtos.employee_gender == 'M'}">
				                		<input type="text" class="form-control" name="employee_gender" style="width:50%;" value="남성">
				                	</c:if>
				                	
				                	<c:if test="${dtos.employee_gender == 'F'}">
				                		<input type="text" class="form-control" name="employee_gender" style="width:50%;" value="여성">
				                	</c:if>
				                </td>
				                <td>업무</td>
				                <td><input type="text" class="form-control" name="job" style="width:50%;" value="${dtos.job}"></td>
				            </tr>
				            <tr class="">
				                <td>나이</td>
				                <td><input type="text" class="form-control" name="employee_age" style="width:50%;" value="${dtos.employee_age}"></td>
				                <td>고용형태</td>
				                <td><input type="text" class="form-control" name="employee_type" style="width:50%;" value="${dtos.employee_type}"></td>
				            </tr>
				            
				            <tr>
				            	<td>주소</td>
				                <td><input type="text" class="form-control" name="employee_address" style="width:50%;" value="${dtos.employee_address}"></td>
				                <td>연차</td>
				                <td><input type="text" class="form-control" name="annual_leave_cnt" style="width:25%" value="${dtos.annual_leave_cnt}"></td>
				            </tr>
				            
				            <tr>
				            	<td>핸드폰</td>
				                <td><input type="text" class="form-control" name="employee_ph" style="width:50%;" value="${dtos.employee_ph}"></td>
				                <td>입사날짜</td>
				                <td>
				                	<input type="date" class="form-control" name="employee_hireDate" style="width:50%;" value="${dtos.employee_hireDate}">
				                </td>
				            </tr>
				            
				            <tr class="">
				                <td>이메일</td>
				                <td><input type="text" class="form-control" name="employee_email" style="width:50%;" value="${dtos.employee_email}"></td>
				                <td>퇴사날짜</td>
				                <td>
				                	<c:if test="${dtos.employee_resignDate == null}">
				                		<input type="date" class="form-control" name="employee_resignDate" style="width:50%;" value="null">
				                	</c:if>
				                	
				                	<c:if test="${dtos.employee_resignDate != null}">
				                		<input type="date" class="form-control" name="employee_resignDate" style="width:50%;" value="${dtos.employee_resignDate}"> 
				                	</c:if>
				                </td>
				            </tr>
				            </tbody>
				         
				          </table>
							<div class="form-group row">
								<div class="col-sm-4 col-sm-offset-2">
							</div>
	                    </div>
	                </form>
	            </div>
            
            <!-- 직원 정보 -- 끝 -->
            
            <!-- 근태 / 휴가 / 급여 -- 시작 -->
            <div class="wrapper wrapper-content animated fadeInRight ecommerce" style="padding:12px 0px 12px 20px;">

            <div class="row">
                <div class="col-lg-12">
                    <div class="tabs-container">
                            <ul class="nav nav-tabs">
                                <li><a class="nav-link  active" data-toggle="tab" href="#tab-1"> 근태 </a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab-2"> 휴가 </a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab-3"> 급여 계약 </a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab-4"> 급여 지급 </a></li>
                            </ul>
                            <div class="tab-content">
                            
	                            <!-- 근태 시작 -->
								<!-- 근태 탭 끝 -->
	                                
	                            <!-- 휴가탭 시작 -->
	                            <!-- 휴가 탭 끝 -->
	                            
	                            <!-- 급여 계약 시작 -->
	                            <!-- 급여 계약 끝  -->
	                            
	                            <!-- 급여 지급 시작 -->
	                            <!-- 급여 지급 끝 -->
                                
                            </div>
	                    </div>
	                </div>
	            </div>
        	</div>
        	<!-- 근태 / 휴가 / 급여 -- 끝 -->
        	
        </div>
    </div>
</div>
                            
</body>
</html>