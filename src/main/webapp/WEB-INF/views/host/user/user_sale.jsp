<!-- 
이름 : 장현정
작성날짜 : 2021-09-16 ~ 2021-09-19 
회원 정보 페이지에서 판매 관련 출력 탭
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Creamy_CRM | User Info </title>
</head>
<body>
<div class="panel-body">
${userCode}
${vo.userCode}
${vo.host_code}
<c:if test="${vo.comp_res == '담당자'}">
	<c:if test="${vo.user_code != null}">
		<iframe id="iframe" src="http://localhost:3000/user_sale?host_code=${sessionScope.code}%user_code=${vo.user_code}" style="width: 1000px; height: 1000px;"></iframe>
	</c:if>
	<c:if test="${vo.user_code == null}">
		<iframe src="http://localhost:3000/user_sale?host_code=${sessionScope.code}" style="width: 1000px; height: 1000px;"></iframe>
	</c:if>
</c:if>
<c:if test="${vo.comp_res == '호실'}">
	<c:if test="${vo.user_code != null}">
		<iframe src="http://localhost:3000/user_sale_room?host_code=${sessionScope.code}%user_code=${vo.user_code}" style="width: 1000px; height: 1000px;"></iframe>
	</c:if>
	<c:if test="${vo.user_code == null}">
		<iframe src="http://localhost:3000/user_sale_room?host_code=${sessionScope.code}" style="width: 1000px; height: 1000px;"></iframe>
	</c:if>
</c:if>  
      
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