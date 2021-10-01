<!-- 
이름 : 장현정
작성날짜 : 2021-09-16 ~ 2021-09-19 
회원 정보 출력 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creamy | User Info</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Creamy | User Info </title>
<script type="text/javascript" src="${path}/resources/host/js/user.js"></script>
<script type="text/javascript">

function user_detail() {
	
	var url = "user_detail"
	window.open(url, "user_detail", "menubar=no, width=1300, height=800 ");
}


$("document").ready(function() {

   // 테이블에서 회원 선택시 회원 코드 hidden에 설정
   $("tr[class^=user]").click(function() {
      $("tr[class^=user]").css("background", "");
      
      var thisTr = $(this);
      var thisTd = $(this).children();
      var user_code = thisTd.eq(0).find("input[name^=user]").val();
      var user_name = thisTd.eq(1).find("input[name^=user]").val();
      var user_ph = thisTd.eq(2).find("input[name^=user]").val();
      var user_id = thisTd.eq(3).find("input[name^=user]").val();
      console.log("user_code : " + user_code);
      
      $("input[name=user_code_hidden]").val(user_code);
      $("input[name=user_name_hidden]").val(user_name);
      $("input[name=user_ph_hidden]").val(user_ph);
      $("input[name=user_id_hidden]").val(user_id);
      
      $(this).css("background", "#20c997");
      
      
      // 회원별 판매 내역 출력
	   var url = "user_sale?user_code=" + user_code
	   window.open(url, "user_sale", "menubar=no, width=800, height=800");
      
   });
   
   // 회원 정보 수정 버튼 클릭
   $("#user_modify_btn").click(function() {
	   if($("input[name=user_code_hidden]").val() == 0) {
         alert("회원을 선택하세요!");
         return false;
      } else {
	 	  var user_code = $("input[name=user_code_hidden]").val();
		  var user_name = $("input[name=user_name_hidden]").val();
	      var user_ph = $("input[name=user_ph_hidden]").val();
	      var user_id = $("input[name=user_id_hidden]").val();
	      
	      console.log(user_code);
	      
	      var url = "modify_user?user_code=" + user_code + "&user_id=" + user_id
	      window.open(url, "modify_user", "menubar=no, width=800, height=800");
      }
   });
   
   // 회원 삭제 버튼 클릭
   $("#user_del_btn").click(function() {
      if($("input[name=user_id_hidden]").val() == 0) {
         alert("회원을 선택하세요!");
         return false;
      } else {
         var user_code = $("input[name=user_code_hidden]").val();
         var user_name = $("input[name=user_name_hidden]").val();
         var user_ph = $("input[name=user_ph_hidden]").val();
         var user_id = $("input[name=user_id_hidden]").val();
         
         console.log(user_id);
         
         var url = "del_user_action?user_id=" + user_id + "&user_code=" + user_code
            window.open(url, "del_user_action", "menubar=no, width=800, height=800");
      }
   });
   
   // 판매 버튼 클릭
   $("#selling_btn").click(function() {
      if($("input[name=user_code_hidden]").val() == 0) {
         alert("회원을 선택하세요!");
         return false;
      } else {
         var user_code = $("input[name=user_code_hidden]").val();
         var user_name = $("input[name=user_name_hidden]").val();
         var user_ph = $("input[name=user_ph_hidden]").val();
         console.log(user_code);
         
         var url = "product_selling?user_code=" + user_code;
            window.open(url, "product_selling", "menubar=no, width=1500, height=800");
      }
   });
   
   
	// 회원별 판매내역 출력
   $("#user_sale").onclick(function() {
	   if($("input[name=user_code_hidden]").val() == 0) {
         alert("회원을 선택하세요!");
         return false;
      } else {
	 	  var user_code = $("input[name=user_code_hidden]").val();
	      console.log(user_code);
	      
	      var url = "user_sale?user_code=" + user_code
	      window.open(url, "user_sale", "menubar=no, width=800, height=800");
      }
   }); 
   
   
	
	
	
	
	
   
   // 창 닫기 클릭
   $("input[name=window_close]").click(function() {
      window.close();
   });
   
   
});






</script>
</head>
<body> 
<div id="wrapper">   

	<!-- frame  -->
	<jsp:include page="../Frame.jsp" />

<div id="page-wrapper" class="gray-bg">

	<!-- nav bar  -->
	<jsp:include page="../navbar.jsp" />
	
<!-- 버튼 클릭시 전달할 회원 코드 -->   
<input type="hidden" value="0" name="user_code_hidden">
<input type="hidden" value="0" name="user_name_hidden">
<input type="hidden" value="0" name="user_ph_hidden">
<input type="hidden" value="0" name="user_id_hidden">


<!-- 회원 -->
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-8">
        <h2>회원관리</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="index.html">Home</a>
            </li>
            <li class="breadcrumb-item">
                Extra pages
            </li>
            <li class="breadcrumb-item active">
                <strong>Calendar</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
        
        <table>
			<tr>
				<td><button type="button" class="btn btn-primary dim" id="user_modify_btn">회원 정보 수정</button></td>
				<td><button type="button" class="btn btn-primary dim" id="user_del_btn">회원 삭제 처리</button></td>
				<td><button type="button" class="btn btn-primary dim" id="selling_btn">판매</button></td> 
				<td><button type="button" class="btn btn-primary dim">회원 본인 인증</button></td>
			</tr>
		</table>
        
        <div class="ibox-content m-b-sm border-bottom"> 
			<div class="row">
				<div class="col-sm-2">
					<div class="form-group">
					
						<select name="" id="" class="form-control">
							<option value="1" selected="">전체 회원</option>
							<option value="2">등록 회원</option>
							<option value="3">최근 한달 등록 </option>
							<option value="4">최근 한달 판매 </option>
							<option value="5">최근 한달 예약 </option>
							<option value="6">최근 한달 등록 </option>
						</select>
					</div>
				</div>

				<div class="col-sm-2">
					<div class="form-group">
						<select name="" id="" class="form-control">
							<option value="1" selected="">상품 선택</option>
							<option value="2">[판매]염색 1회</option>
							<option value="3">[기간]회원권 1개월</option>
						</select>
					</div>
				</div>
				
				<div class="col-sm-2">
					<div class="form-group">
						<select name="" id="" class="form-control">
							<option value="1" selected="">담당자 선택</option>
							<option value="2">주수림</option>
							<option value="3">정지은</option>
							<option value="4">이시현</option>
							
						</select>
					</div>
				</div>

				<div class="col-sm-2">
					<div class="form-group">
						<input type="text" id="" name="" value=""
							placeholder="검색어" class="form-control">
					</div>
				</div>

				<div class="col-sm-2">
					<div class="form-group">
						<button class="btn btn-primary dim" type="button">찾기</button>
					</div>
				</div>
			</div>
		</div>

		<fieldset>
			<div class="wrapper wrapper-content">
				<div class="row">  
					<div class="col-lg-3">

						<div>
							<h5></h5>
							<form action="" name="">
								
								<div class="ibox">
				                    <div class="ibox-content">
								<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 600px;">
								<div class="scroll_content" style="overflow: hidden; width: auto; height: 600px;">
				                
								<table id="rowClick" class="table table-hover" data-page-size="15">
								
								<thead>
					            <tr>
					                <th>회원코드</th>
					                <th>회원명</th>
					                <th>연락처</th>
					            </tr>
					            </thead>
					            
					            <tbody>
					            <c:forEach var="dto" items="${dto}" varStatus="status">
						            <tr class="user${status.index}">
						                <td id="user_code${status.index}">${dto.user_code}<input type="hidden" name="user_code${status.index}" value="${dto.user_code}"></td>
						                <td id="user_name${status.index}">${dto.user_name}<input type="hidden" name="user_name${status.index}" value="${dto.user_name}"></td>
						                <td id="user_ph${status.index}">${dto.user_ph}<input type="hidden" name="user_ph${status.index}" value="${dto.user_ph}"></td>
						                <td id="user_id${status.index}"><input type="hidden" name="user_id${status.index}" value="${dto.user_id}"></td>
						            </tr>
						        </c:forEach>
					            </tbody>
								</table>
 								<div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 79.0514px;"></div>
					            <div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
				                
								</div>
								</div>
								</div>
								</div>
							</form>
						</div>
					</div>
					
					<div class="col-lg-9 animated fadeInRight">
					
					<div class="tabs-container">
						<ul class="nav nav-tabs">   
							<li><a id="user_sale" class="nav-link active" data-toggle="tab" href="#tab-1">판매</a></li>
							<li><a id="user_reservation" class="nav-link" data-toggle="tab" href="#tab-2">예약</a></li>
						</ul>
						
						<div class="tab-content">
						<div id="tab-1" class="tab-pane active">
							<jsp:include page="user_sale.jsp"/>
						</div>
						
						<div id="tab-2" class="tab-pane">
							<jsp:include page="user_reservation.jsp"/>
						</div> 
						</div>
						
					</div>
					</div> 
			</div>
		</div>
		</fieldset>
    </div>
    </div>
</div>
</div>
</div>

<!-- Mainly scripts -->
<script src="${path}/resources/bootstrap/js/moment.min.js"></script>
<script src="${path}/resources/bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="${path}/resources/bootstrap/js/popper.min.js"></script>
<script src="${path}/resources/bootstrap/js/bootstrap.js"></script>
<script src="${path}/resources/bootstrap/js/jquery.metisMenu.js"></script>
<script src="${path}/resources/bootstrap/js/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${path}/resources/bootstrap/js/inspinia.js"></script>
<script src="${path}/resources/bootstrap/js/pace.min.js"></script>

<!-- jQuery UI  -->
<script src="${path}/resources/bootstrap/js/jquery-ui.min.js"></script>

<!-- iCheck -->
<script src="${path}/resources/bootstrap/js/icheck.min.js"></script>

<!-- Full Calendar -->
<script src="${path}/resources/bootstrap/js/fullcalendar.min.js"></script>

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function(){
            $('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    { extend: 'copy'},
                    {extend: 'csv'},
                    {extend: 'excel', title: 'ExampleFile'},
                    {extend: 'pdf', title: 'ExampleFile'},

                    {extend: 'print',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');

                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                    }
                    }
                ]

            });

        });

    </script>

</body>
</html>