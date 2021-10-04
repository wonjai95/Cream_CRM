<!-- 
이름 : 정지은
작성날짜 : 2021-09-19
후기 - 고객이 작성한 후기 확인
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	
	<script src="../resources/bootstrap/js/jquery-3.1.1.min.js"></script>
	
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="../resources/host/js/review.js"></script>

    <title> 후기조회 </title>

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
					<h2>후기</h2>
				</div>
			</div>


			<div class="wrapper wrapper-content animated fadeInRight ecommerce">

				<div class="row">
					<div class="col-lg-12">
						<div class="tabs-container">
							<ul class="nav nav-tabs">
								<li><a class="nav-link active" data-toggle="tab" href="#tab-1">고객 후기</a></li>
								<li><a class="nav-link" data-toggle="tab" href="#tab-2">후기 추적</a></li>
							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<div class="panel-body">
										<div class="ibox-content m-b-sm" style="padding-bottom: 0px; margin-bottom: 0px;">
											<div class="row">
												<div class="col-sm-2">
													<div class="form-group">
														<select name="" id="search_option" class="form-control">
															<option value="1" selected="">구분</option>
															<option value="2">글제목</option>
															<option value="3">작성자</option>
															<option value="4">등록일</option>
														</select>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<input type="text" id="search_key" name="" value="" placeholder="검색어"
															class="form-control">
													</div>
												</div>
								
												<div class="col-sm-2">
													<div class="form-group">
														<button id="search_btn" class="btn btn-primary dim" type="button">찾기</button>
													</div>
												</div>
											</div>
										</div>
										<div id="reviewList">
											<jsp:include page="userReview.jsp" />
										</div>
									</div>
								</div>
								<div id="tab-2" class="tab-pane">
									<jsp:include page="outReview.jsp" />
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
