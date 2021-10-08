<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting_user.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CRM</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center header-transparent">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo" style="display: flex;">
        <h1><a href="home" style="margin-left: 10px;">Creamy</a></h1>
      </div>
      <nav id="navbar" class="navbar">
        <ul>
	      <c:if test="${sessionScope.name != null}">
          	<li><a href="mypage" class="nav-link scrollto">${sessionScope.name}</a></li>
          </c:if>
          <li><a class="nav-link scrollto active" href="home">Home</a></li>
           <li class="dropdown"><a href="review_main"><span>review</span></a>
          <li class="dropdown"><a href=""><span>Reservation</span> <i class="bi bi-chevron-down"></i></a>
          	<ul>
                  <li><a href="selectHost">고객 예약</a></li>
          	</ul>
          </li>
          <c:if test="${sessionScope.id != null}">
          <li><a class="nav-link scrollto" href="logout">logout</a></li>
          </c:if>
          <c:if test="${sessionScope.id == null}">
          <li><a class="nav-link scrollto" href="login">login</a></li>
          </c:if>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

</body>

</html>