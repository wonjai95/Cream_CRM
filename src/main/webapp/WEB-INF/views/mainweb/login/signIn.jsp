<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Register</title>

    <link href="${path}/resources/bootstrap/css/custom.css" rel="stylesheet">
    <link href="${path}/resources/bootstrap/css/datepicker3.css" rel="stylesheet">
    <script type="text/javascript" src="${path}/resources/host/js/signUp.js" defer></script>

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">Cr+</h1>
            </div>
            <h3>Easy Start With Creamy</h3>
            <form name="signInform" class="m-t" role="form" action="signInAction" method="post">
            <input type="hidden" name="hiddenId_dupChk" value="0">
            
            <sec:csrfInput/>   
                <div class="form-group" style="display: flex;">
                    <div class="input-group date">
                    	<input type="text" name="sign_id" class="form-control" placeholder="아이디" required>
                    	<input type="button" onclick="confirmId();" class="btn btn-primary btn-xs" style="margin: 2px 4px;" value="중복확인">
                    </div>
                </div>
                <div id ="div_IDok" style="display:none; font-size: 10px; color:navy; padding-right: 130px;"> 중복확인 성공</div>
                <div id ="div_ID" style="display:none; font-size: 10px; color: red; padding-right: 95px;"> ! 중복된 아이디. 다시 입력하세요</div>
                <div class="form-group" style="display: flex;">
                    	<input type="password" name="sign_PWD" class="form-control" placeholder="비밀번호" required>
                </div>
                <div class="form-group" style="display: flex;">
                    	<input type="text" name="sign_name" class="form-control" placeholder="이름" required>
                </div>
                <div class="form-group" style="display: flex;">
                    <div class="input-group date">
                     	<input name="sign_birth1" type="text" class="form-control" placeholder="1999" maxlength="4" required>
                     	<input name="sign_birth2" type="text" class="form-control" placeholder="01" maxlength="2" required>
                     	<input name="sign_birth3" type="text" class="form-control" placeholder="01" maxlength="2" required>
                    </div>
                </div>
                <div class="form-group" style="display: flex;">
                    <div class="input-group date">
                     	<input name="sign_Email1" type="text" class="form-control" placeholder="email" required>
                     	<div style="width: 20px; align-self: center;">@</div>
                     	<input name="sign_Email2" type="text" class="form-control" placeholder="gmail.com" required>
                    </div>
                </div>
                <div class="form-group" style="display: flex;">
                    <div class="input-group date">
                     	<input name="sign_Phone1" type="text" class="form-control" placeholder="010" onkeyup="nextHp1();" maxlength="3" required>
                     	<div style="width: 20px; align-self: center;">-</div>
                     	<input name="sign_Phone2" type="text" class="form-control" placeholder="1111" onkeyup="nextHp2();" maxlength="4" required>
                     	<div style="width: 20px; align-self: center;">-</div>
                     	<input name="sign_Phone3" type="text" class="form-control" placeholder="1111" maxlength="4" required>
                    </div>
                </div>
                <div class="form-group" style="display: flex;">
                    <div class="input-group date">
                     	<input name="sign_zipcode" id="postcode" type="text" class="form-control" placeholder="우편번호" required>
                     	<div style="width: 5px; align-self: center;"></div>
                     	<input type="button" onclick="addressSearch()" class="btn btn-primary btn-xs" style="margin: 2px 4px;" value="주소검색">
                    </div>
                </div>
                 <div class="form-group" style="display: flex;">
                    <div class="input-group date">
                     	<input name="sign_sido" id="sido" type="text" class="form-control" placeholder="시/도" required>
                     	<input name="sign_gugun" id="sigungu" type="text" class="form-control" placeholder="구/군" required>
                    </div>
                </div>
                <div class="form-group" style="display: flex; ">
                    <div class="input-group date">
                     	<input name="sign_address" id="detail_address" type="text" class="form-control" placeholder="주소" required>
                    </div>
                </div>
                <div class="form-group" style="display: flex; margin-bottom: 20px;">
                    <div class="input-group date">
                     	<select class="form-control m-b" name="sign_gender">
                     		<option value="M">남성</option>
                     		<option value="F">여성</option>
                     	</select>
                    </div>
                </div>
                 
                <div class="form-group" style="margin-bottom: 10px;">
                        <div class="checkbox i-checks"><label> <input type="checkbox"><i></i> 이용약관에 동의합니다. </label></div>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">회원가입</button>

				<a href="signIn_host"><p class="text-muted text-center"><small>사장님 회원가입</small></p></a>
				
                <a class="btn btn-sm btn-white btn-block" href="login">로그인</a>
            </form>
            <p class="m-t"> <small>© Copyright Creamy 2021</small> </p>
        </div>
    </div>

    <script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</body>

</html>
