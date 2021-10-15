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
            <p>회원가입 진행 후 사업자 등록을 완료해주세요.</p>
            <form name="signInform" class="m-t" role="form" action="HostsignInAction" method="post" style="margin-top: 10px;">
            <sec:csrfInput/>
                <div class="form-group" style="display: flex;">
                    <div class="input-group date">
                    	<input type="text" name="sign_id" class="form-control" placeholder="아이디" required>
                    	<input type="button" onclick="" class="btn btn-primary btn-xs" style="margin: 2px 4px;" value="중복확인">
                    </div>
                </div>
                <div class="form-group" style="display: flex;">
                    	<input type="password" name="sign_PWD" class="form-control" placeholder="비밀번호" required>
                </div>
                <div class="form-group" style="display: flex;">
                    	<input type="text" name="sign_name" class="form-control" placeholder="이름" required>
                </div>
                <div class="form-group" style="display: flex;">
                    <div class="input-group date">
                     	<input name="sign_Email1" type="text" class="form-control" placeholder="email">
                     	<div style="width: 20px; align-self: center;">@</div>
                     	<input name="sign_Email2" type="text" class="form-control" placeholder="gmail.com">
                    </div>
                </div>
                <div class="form-group" style="display: flex;">
                    <div class="input-group date">
                     	<input name="sign_Phone1" type="text" class="form-control" placeholder="010" onkeyup="nextHp1();" maxlength="3">
                     	<div style="width: 20px; align-self: center;">-</div>
                     	<input name="sign_Phone2" type="text" class="form-control" placeholder="1111" onkeyup="nextHp2();" maxlength="4">
                     	<div style="width: 20px; align-self: center;">-</div>
                     	<input name="sign_Phone3" type="text" class="form-control" placeholder="1111" maxlength="4">
                    </div>
                </div>
                <div class="form-group" style="display: flex;">
                    	<input type="text" name="sign_compname" class="form-control" placeholder="회사명" required>
                </div>
                
              <div class="form-group" style="margin-bottom: 10px; margin-top: 10px;">
                        <div class="checkbox i-checks"><label> <input type="checkbox"><i></i> 이용약관에 동의합니다. </label></div>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">회원가입</button>

				<a href="signIn"><p class="text-muted text-center"><small>고객 회원가입</small></p></a>
				
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
