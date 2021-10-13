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
            <p>Perfectly designed and precisely prepared admin theme with over 50 pages with extra new web app views.
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
            </p>
            <p>Login in. To see it in action.</p>
            <form class="m-t" role="form" action="${path}/login_check" method="post">
            <sec:csrfInput/>
                <div class="form-group">
                    <input type="text" name="id" class="form-control" placeholder="Id" required>
                </div>
                <div class="form-group">
                    <input type="password" name="login_PWD" class="form-control" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Login</button>
                <a href="#"><small>Forgot password?</small></a>
                <p class="text-muted text-center"><small>Do not have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="signIn">Create an account</a>
            </form>
            <p class="m-t"> <small>Creamy we app framework base on Bootstrap 3 &copy; 2021</small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="${path}/resources/bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="${path}/resources/bootstrap/js/popper.min.js"></script>
    <script src="${path}/resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
