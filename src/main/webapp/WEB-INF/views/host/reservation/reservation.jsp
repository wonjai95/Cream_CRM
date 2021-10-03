<!-- 
이름 : 이시현
작성날짜 : 2021-09-16 ~ 2021-09-16 
예약서비스를 확인할 수 있는 첫 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title> 예약조회 </title>
    
</head>
	<body>
	<div id="wrapper">

		<!-- frame  -->
		<jsp:include page="../Frame.jsp" />

		<div id="page-wrapper" class="gray-bg">

			<!-- nav bar  -->
			<jsp:include page="../navbar.jsp" />

			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-8">
				    <h2>예약조회</h2>
			        <ol class="breadcrumb">
			            <li class="breadcrumb-item">
			                <a href="home">Home</a>
			            </li>
			            <li class="breadcrumb-item active">
			                <strong>예약</strong>
			            </li>
			        </ol>
			    </div>
			</div>


			<div class="wrapper wrapper-content animated fadeInRight ecommerce">

				<div class="row">
					<div class="col-lg-12">
						<div class="tabs-container">
							<ul class="nav nav-tabs">
								<li><a class="nav-link active" data-toggle="tab" href="#tab-1">예약 요청</a></li>
								<li><a class="nav-link" data-toggle="tab" href="#tab-2">예약 조회</a></li>
							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<jsp:include page="requestReservation.jsp" />
								</div>
								
								<div id="tab-2" class="tab-pane">
									<jsp:include page="showReservation.jsp" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

    <!-- Page-Level Scripts -->
    <script>

        // Upgrade button class name
        $.fn.dataTable.Buttons.defaults.dom.button.className = 'btn btn-white btn-sm';

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
