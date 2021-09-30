<!-- 
이름 : 장현정
작성날짜 : 2021-09-16 ~ 2021-09-16 
회원 등록 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/resources/user/js/modifyUser.js"></script>
<style type="text/css">
body {
	background-color: white;
}
</style>
</head>
<body>
	<div class="ibox-content">
		<form name="modifyUser" action="modify_user_action?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
			
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">회원 정보 수정</label>   
			</div>
			<div class="hr-line-dashed"></div>
			<div class="form-group  row">
				<label class="col-sm-2 col-form-label">회원코드</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="modify_code" value="${dto.user_code}">
					<input type="text" name="user_id" value="${dto.user_id}">
				</div>
			</div>

			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">회원명</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="modify_name" value="${dto.user_name}">
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">자기소개</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="modify_memo" value="${dto.user_memo}">
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">성별</label>
				<div class="col-sm-7">
					<c:if test="${dto.user_gender == 'M'}">
					<label class="col-sm-2 col-form-label"> 
						<input type="radio" name="modify_gender" value="M" checked><span>남</span>
						<input type="radio" name="modify_gender" value="F"><span>여</span>
					</label>   
					</c:if>
					<c:if test="${dto.user_gender != 'M'}">   
					<label class="col-sm-2 col-form-label"> 
						<input type="radio" name="modify_gender" value="M"><span>남</span>
						<input type="radio" name="modify_gender" value="F" checked><span>여</span>
					</label>  
					</c:if>
				</div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">생년월일</label>       
				<div class="col-sm-7" style="width: 80%;"> 
                  	<input type="date" name="modify_birth" class="form-control" id="modify_birth" value="${dto.user_birth}" required style="margin-right: 3px;">
                </div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group row">   
				<label class="col-sm-2 col-form-label">이메일</label>   
				<div class="col-sm-8 row">
					<input type="text" name="email1" class="form-control" maxlength="100" style="width:200px" value="${dto.user_email}">
						&nbsp; @ &nbsp;
						<input type="text" name="email2" class="form-control" maxlength="100" style="width:200px">
						<select name="email3" class="form-control row" style="width:100px" onchange="selectEmailChk();">        
							<option value="0"> 직접 입력 </option>
							<option value="naver.com"> naver </option>     
							<option value="google.com"> google </option>   
							<option value="nate.com"> nate </option>   
							<option value="daum.net"> daum </option>  
						</select>
				</div>
			</div>
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">주소</label>
			</div>
			<div class="col-sm-8 row"> 
				<div class="form-group" style="width: 15%;  margin-right: 20px; ">
               		<input type="text" name="modify_zipcode" class="form-control" id="postcode" placeholder="우편번호" required style="margin-right: 3px;">
           		</div>
           		<div class="form-group" style="width: 20%; display: flex;">  
               		<button type="button" onclick="addressSearch();" >주소 확인</button>
           		</div>
				<div class="form-group" style="width: 60%; display: flex; ">
                   	<input type="text" name="modify_sido" class="form-control" id="sido" required style="margin-right: 3px;"> 
                   	<input type="text" name="modify_gugun" class="form-control" id="sigungu" required style="margin-left: 3px;">
               	</div>
				<div class="form-group" style="width: 60%;">
                  	<input type="text" name="modify_address" class="form-control" id="" required>
              	</div>   
			</div>
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">전화번호</label>
				<div class="form-group row" style="width: 30%;">
					<input type="text" name="modifyp_hp1" class="form-control" id="name" placeholder="010" required style="margin-right: 3px;">
					<span style="padding-bottom: 13px; font-size: 30px;">&nbsp;-&nbsp;</span>   
	                <input type="text" name="modifyp_hp2" class="form-control" id="name" required style="margin-left: 3px;">
					<span style="padding-bottom: 13px; font-size: 30px;">&nbsp;-&nbsp;</span>  
					<input type="text" name="modifyp_hp3" class="form-control" id="name" required style="margin-left: 3px;">
				</div>
			</div>    
			
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">결혼기념일</label>       
				<div class="col-sm-7" style="width: 80%;"> 
                  	<input type="date" name="modify_wedding" class="form-control" id="modify_wedding" value="${dto.wedding_anniversary}" required style="margin-right: 3px;">
                </div>
			</div>
			
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">차량번호</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="modify_car" value="${dto.car_number}">
				</div>
			</div>
			
			
			  
			
			<div class="hr-line-dashed"></div>
			<div class="form-group row">
				<div align="center">
					<div class="col-sm-6 col-sm-offset-2">
						<input type="submit" class="btn btn-primary btn-sm" value="확인">
						<input type="button" class="btn btn-primary btn-sm" value="창 닫기"
							onclick="self.close();">
					</div>
				</div>
			</div>
			
			
			

		</form>
	</div>

</body>
</html>