<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Register</title>

    <link href="${path}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path}/resources/bootstrap/css/font-awesome.css" rel="stylesheet">
    <link href="${path}/resources/bootstrap/css/custom.css" rel="stylesheet">
    <link href="${path}/resources/bootstrap/css/animate.css" rel="stylesheet">
    <link href="${path}/resources/bootstrap/css/style.css" rel="stylesheet">
    <link href="${path}/resources/bootstrap/css/datepicker3.css" rel="stylesheet">
    <script type="text/javascript" src="${path}/resources/host/js/signUp.js" defer></script>

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">Cr+</h1>
            </div>
            <h3>Register to Creamy</h3>
            <p>Create account to see it in action.</p>
            <form name="signInform" class="m-t" role="form" action="signInAction" method="post">
            <sec:csrfInput/>
                <div class="form-group" style="display: flex;">
               		<div style="width: 20%; align-self: center;">ID </div>
                    <div class="input-group date" style="width: 80%">
                    	<input type="text" name="sign_id" class="form-control" placeholder="ID" required>
                    	<input type="button" onclick="" class="btn btn-primary btn-xs" style="margin: 2px 4px;" value="중복확인">
                    </div>
                </div>
                <div class="form-group" style="display: flex;">
                	<div style="width: 20%; align-self: center;">PW </div>
                    <div style="width: 80%">
                    	<input type="password" name="sign_PWD" class="form-control" placeholder="Password" required></div>
                </div>
                <div class="form-group" style="display: flex;">
                	<div style="width: 20%; align-self: center;">NAME </div>
                    <div style="width: 80%">
                    	<input type="text" name="sign_name" class="form-control" placeholder="name" required></div>
                </div>
                <div class="form-group" style="display: flex;">
                	<div style="width: 20%; align-self: center;">Birth </div>
                    <div class="input-group date" style="width: 80%;">
                     	<input name="sign_birth1" type="text" class="form-control" placeholder="1999" maxlength="4">
                     	<input name="sign_birth2" type="text" class="form-control" placeholder="01" maxlength="2">
                     	<input name="sign_birth3" type="text" class="form-control" placeholder="01" maxlength="2">
                    </div>
                </div>
                <div class="form-group" style="display: flex;">
                	<div style="width: 20%; align-self: center;">Email </div>
                    <div class="input-group date" style="width: 80%;">
                     	<input name="sign_Email1" type="text" class="form-control" placeholder="email">
                     	<div style="width: 20px; align-self: center;">@</div>
                     	<input name="sign_Email2" type="text" class="form-control" placeholder="gmail.com">
                    </div>
                </div>
                <div class="form-group" style="display: flex;">
                	<div style="width: 20%; align-self: center;">Phone </div>
                    <div class="input-group date" style="width: 80%;">
                     	<input name="sign_Phone1" type="text" class="form-control" placeholder="010" onkeyup="nextHp1();" maxlength="3">
                     	<div style="width: 20px; align-self: center;">-</div>
                     	<input name="sign_Phone2" type="text" class="form-control" placeholder="1111" onkeyup="nextHp2();" maxlength="4">
                     	<div style="width: 20px; align-self: center;">-</div>
                     	<input name="sign_Phone3" type="text" class="form-control" placeholder="1111" maxlength="4">
                    </div>
                </div>
                <div class="form-group" style="display: flex;">
                	<div style="width: 20%; align-self: center;"> Address </div>
                    <div class="input-group date" style="width: 80%;">
                     	<input name="sign_zipcode" id="postcode" type="text" class="form-control" placeholder="postcode">
                     	<div style="width: 5px; align-self: center;"></div>
                     	<input type="button" onclick="addressSearch()" class="btn btn-primary btn-xs" style="margin: 2px 4px;" value="주소검색">
                    </div>
                </div>
                 <div class="form-group" style="display: flex;">
                	<div style="width: 20%; align-self: center;"></div>
                    <div class="input-group date" style="width: 80%;">
                     	<input name="sign_sido" id="sido" type="text" class="form-control" placeholder="sido">
                     	<input name="sign_gugun" id="sigungu" type="text" class="form-control" placeholder="gu/gun">
                    </div>
                </div>
                <div class="form-group" style="display: flex; margin-bottom: 20px;">
                	<div style="width: 20%; align-self: center;"></div>
                    <div class="input-group date" style="width: 80%;">
                     	<input name="sign_address" id="detail_address" type="text" class="form-control" placeholder="address">
                    </div>
                </div>
                
                 
                <div class="form-group" style="margin-bottom: 10px;">
                        <div class="checkbox i-checks"><label> <input type="checkbox"><i></i> Agree the terms and policy </label></div>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Register</button>

				<a href="signIn_host"><p class="text-muted text-center"><small>사장님 회원가입</small></p></a>
				
                <a class="btn btn-sm btn-white btn-block" href="login">Login</a>
            </form>
            <p class="m-t"> <small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small> </p>
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
