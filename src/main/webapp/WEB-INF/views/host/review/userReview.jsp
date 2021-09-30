<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<div class="wrapper wrapper-content">
			<div style="display: flex;">
				<div class="col-lg-9 animated fadeInRight" style="width: 100%;">
					<div class="ibox-content" style="margin: 0px; padding: 0px;">
			            <div class="row">
			                <div class="col-sm-8" style="width : 60%;">
			                    <div class="ibox">
			                        <div class="ibox-content">
			                            <h2>고객 후기</h2>
			                            <p>
			                                	고객님들의 후기를 볼 수 있습니다.
			                            </p>
			                            <div class="clients-list">
				                            <ul class="nav nav-tabs">
				                                <li><a class="nav-link active" data-toggle="tab" href="#tab-1"><i class="fa fa-user"></i> 후기목록</a></li>
				                            </ul>
				                            <div class="tab-content">
				                                <div id="tab-1" class="tab-pane active">
				                                    <div class="full-height-scroll">
				                                        <div class="table-responsive">
				                                            <table class="table table-hover">
				                                            	<thead>
								                                <tr>
								                                    <th>#</th>
								                                    <th>글 제목</th>
								                                    <th>작성자</th>
								                                    <th>고객번호</th>
								                                    <th>등록일</th>
								                                    <th>조회수</th>
								                                </tr>
								                                </thead>
				                                                <tbody>
				                                                <c:forEach var="vo" items="${list}">
				                                                	<tr style="border-bottom: #dee2e6 1px solid;">
					                                                	<td>${vo.review_code}</td>
					                                                    <td><a href="#${vo.review_code}" class="client-link">${vo.title}</a></td>
					                                                    <td> ${vo.user_name} </td>
					                                                    <td> ${vo.user_code}</td>
					                                                    <td> ${vo.regDate}</td>
					                                                    <td> &nbsp;&nbsp;&nbsp;${vo.readCnt}</td>
					                                                </tr>
				                                                </c:forEach>
				                                                </tbody>
				                                            </table>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			                <div class="col-sm-4" style="width : 40%;">
			                    <div class="ibox selected">
			                        <div class="ibox-content">
			                            <div class="tab-content">
			                		<c:forEach var="vo2" items="${list}" varStatus="i">
			                				<c:if test="${i.index == 0 }">
			                                	<div id="${vo2.review_code}" class="tab-pane active">
			                                </c:if>
			                                <c:if test="${i.index != 0 }">
			                               	 	<div id="${vo2.review_code}" class="tab-pane">
			                                </c:if>
			                                    <div class="row m-b-lg">
			                                        <div class="col-lg-4 text-center">
			                                            <h2>두부</h2>
			
			                                            <div class="m-b-sm">
			                                                <img alt="image" class="rounded-circle" src="../images/CRM/bootstrap/dog1.png"
			                                                     style="width: 62px">
			                                            </div>
			                                        </div>
			                                        <div class="col-lg-8">
			                                            <strong>
			                                                About me
			                                            </strong>
			                                            <p>
			                                                ${vo2.user_code} - ${vo2.review_code}
			                                            </p>
			                                        </div>
			                                    </div>
			                                    <div class="client-detail">
			                                    <div class="full-height-scroll">
													<strong>예약내역</strong>
			                                            <ul class="list-group clear-list">
			                                            <c:forEach var="res" items="${resmap.get(vo2.user_code)}">
			                                            	<li class="list-group-item">
			                                                    <span class="float-right"> ${res.res_date} </span>
			                                                    	 &emsp;${res.product_name} - <span style="color: purple;">${res.res_state}</span>
			                                                </li>
			                                            </c:forEach>
			                                            </ul>
			                                            <br>
			                                        <strong>후기 내용</strong>
			                                        <p>
			                                           	${vo2.content}
			                                        </p>
			                                        <hr/>
			                                        <strong>별점</strong>
			                                        <br>
			                                        	<img alt="" src="../images/main/star${vo2.star}.png" style="width: 130px; height: 40px;">
			                                        <hr/>
			                                        <strong>첨부 사진</strong>
			                                        <br>
			                                        <img alt="" src="../images/main/${vo2.review_img}" style="width: 200px; height: 200px;">
			                                        <hr/>
			                                    </div>
			                                    </div>
			                                </div>
			                                 </c:forEach>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			                
			            </div>
      					 </div>
				</div>
			</div>
	</fieldset>
<script>

    $(document).ready(function(){

        $(document.body).on("click",".client-link",function(e){
            e.preventDefault()
            $(".selected .tab-pane").removeClass('active');
            $($(this).attr('href')).addClass("active");
        });

    });


</script>




</body>

</html>