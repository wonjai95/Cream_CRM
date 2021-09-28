<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
  <title>CRM</title>
</head>

<body>

    <!-- ======= 상단 메뉴 ======= -->
    <section id="contact" class="contact section-bg">
      <div class="container">

        <div class="section-title" style="padding-bottom: 0px; padding-top: 50px;">
          <h2>매장 선택</h2>
        </div>
      </div>
      <div class="container">
        <div class="row mt-5 justify-content-center">
          <div class="col-lg-10">
            <div class="info-wrap">
              <div class="row">
                <div class="col-lg-4 info">
	                <sec:csrfInput/>
	                <div class="form-group">
	                    <input type="text" placeholder="검색어 입력" 
	                    	class="form-control" name="top-search" id="top-search">
	                </div>
                </div>
              </div>
            </div>
          </div>
          </div>
        </div>
        <!-- ======= 상단 메뉴 끝 ======= -->
        
</body>

</html>