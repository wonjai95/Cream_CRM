<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Creamy_home</title>

    <link href="../bootstrap/css/custom.css" rel="stylesheet">
    <link href="../bootstrap/css/fullcalendar.css" rel="stylesheet">
    <link href="../bootstrap/css/fullcalendar.print.css" rel='stylesheet' media='print'>

</head>

<body>
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <img alt="image" class="rounded-circle" src="../images/CRM/bootstrap/cat1.png" width="48px" height="48px"/>
                        <span class="block m-t-xs font-bold" style="color: white;">(${sessionScope.code})${sessionScope.id}</span>
                        <span class="text-muted text-xs block" style="color: white;">회사명자리</span>
                </div>
                <div class="logo-element">
                    IN+
                </div>
            </li>
            <li>
                <a href="home"><i class="fa fa-th-large"></i> <span class="nav-label">홈</span> <span class="fa arrow"></span></a>
            </li>
            <li>
                <a href="user"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">회원정보</span><span class="fa arrow"></span></a>
            </li>
            <li>
                <a href="reservation"><i class="fa fa-edit"></i> <span class="nav-label">예약</span><span class="fa arrow"></span></a>
            </li>
            <c:if test="${sessionScope.authority == '[ROLE_HOST]'}">
             <li>
                <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">회계</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="Accounting">손익계산서</a></li>
                    <li><a href="SGA_expenses">판매비와 관리비</a></li>
                 </ul>
            </li>
            </c:if>
            <li>
                <a href=""><i class="fa fa-globe"></i> <span class="nav-label">통계</span><span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level collapse">
                    <li><a href="userStatics">회원통계</a></li>
                    <li><a href="salesStatics">판매통계</a></li>
                 </ul>
            </li>
            <li>
                <a href="stock"><i class="fa fa-flask"></i> <span class="nav-label">재고</span><span class="fa arrow"></span></a>
            </li>
            <li>
                <a href="product"><i class="fa fa-flask"></i> <span class="nav-label">상품</span><span class="fa arrow"></span></a>
            </li>
             <c:if test="${sessionScope.authority == '[ROLE_HOST]'}">
            <li>
               <a href="employee"><i class="fa fa-table"></i> <span class="nav-label">직원</span><span class="fa arrow"></span></a>
            </li>
            </c:if>
            <li>
                <a href="review"><i class="fa fa-table"></i> <span class="nav-label">후기</span><span class="fa arrow"></span></a>
            </li>
             <li>
                <a href=""><i class="fa fa-globe"></i> <span class="nav-label">트렌드</span><span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level collapse">
                    <li><a href="snsCrawling">SNS</a></li>
                    <li><a href="newsCrawling">뉴스</a></li>
                 </ul>
            </li>
        </ul>

    </div>
</nav>

<!-- Mainly scripts -->


<!-- Full Calendar -->
<script src="../bootstrap/js/fullcalendar.min.js"></script>

</body>

</html>
