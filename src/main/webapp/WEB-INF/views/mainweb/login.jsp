<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Login</title>

    <link href="${path}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path}/resources/bootstrap/css/font-awesome.css" rel="stylesheet">

    <link href="${path}/resources/bootstrap/css/animate.css" rel="stylesheet">
    <link href="${path}/resources/bootstrap/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">Cr+</h1>

            </div>
            <h3>Welcome to Creamy</h3>
            <p>고객예약을 간편하고 빠르게! 매장관리를 체계적이고 품격있게!<br>
모두의 일과를 최적의 상태로 관리해주는 간편통합시스템.
            </p>
            <p>로그인하세요. 여러분의 일과를 디자인해드립니다.</p>
            <form class="m-t" role="form" action="${path}/login_check" method="post">
            <sec:csrfInput/>
                <div class="form-group">
                    <input type="text" name="id" class="form-control" placeholder="아이디" required>
                </div>
                <div class="form-group">
                    <input type="password" name="login_PWD" class="form-control" placeholder="비밀번호" required>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">로그인</button>

                <a class="btn btn-sm btn-white btn-block" href="signIn">Creamy 가입하기</a>
            </form>
            <p class="m-t"> <small>© Copyright Creamy 2021</small> </p>   
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="${path}/resources/bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="${path}/resources/bootstrap/js/popper.min.js"></script>
    <script src="${path}/resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
