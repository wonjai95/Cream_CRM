<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>INSPINIA | Data Tables</title>

<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../bootstrap/css/font-awesome.css" rel="stylesheet">
<link href="../bootstrap/css/table/datatables.min.css" rel="stylesheet">

<link href="../bootstrap/css/animate.css" rel="stylesheet">
<link href="../bootstrap/css/style.css" rel="stylesheet">

</head>
<body>
<div id="wrapper">

	<!-- frame  -->
	<jsp:include page="../Frame.jsp" />
	
<div id="page-wrapper" class="gray-bg">

	<!-- nav bar  -->
	<jsp:include page="../navbar.jsp" />

<!-- 직원 -->
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-8">
        <h2>회계</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="index.html">홈</a>
            </li>
            <li class="breadcrumb-item">
                	회계
            </li>
            <li class="breadcrumb-item active">
                <strong>손익계산서</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>손익계산서</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-wrench"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#" class="dropdown-item">Config option 1</a>
                        </li>
                        <li><a href="#" class="dropdown-item">Config option 2</a>
                        </li>
                    </ul>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">

            <div class="table-responsive">
                
            <table class="table table-striped table-bordered table-hover dataTables-example">
            
            <tbody>
            <tr class="gradeX">
               <td>과목</td>
               <td colspan="2" align="center">금액</td>
            </tr>
            <tr class="gradeC">
            	<td>매출액</td>
            	<td></td>
            	<td><fmt:formatNumber value="456680000" pattern="###,###,###"/></td>
            </tr>
            <tr class="table-danger">
            	<td>상품매출</td>
            	<td><fmt:formatNumber value="456680000" pattern="###,###,###" /></td>
            	<td></td>
            </tr>
            <tr class="gradeA">
            	<td>매출원가</td>
            	<td></td>
            	<td><fmt:formatNumber value="0" pattern="###,###,###" /></td>
            </tr>
            <tr class="gradeA">
            	<td>기초상품재고액</td>
            	<td><fmt:formatNumber value="35000000" pattern="###,###,###" /></td>
            	<td></td>
            </tr>
            
            <tr class="gradeA">
            	<td>당기상품재고액</td>
            	<td><fmt:formatNumber value="28767000" pattern="###,###,###" /></td>
            	<td></td>
            </tr>
            
            <tr class="gradeA">
            	<td>기말상품재고액</td>
            	<td><fmt:formatNumber value="63767000" pattern="###,###,###" /></td>
            	<td></td>
            </tr>
            
            <tr class="gradeA">
            	<td>매출총이익</td>
            	<td></td>
            	<td><fmt:formatNumber value="456680000" pattern="###,###,###" /></td>
            </tr>
            
             <tr class="gradeA">
            	<td>판매비와 관리비</td>
            	<td></td>
            	<td><fmt:formatNumber value="97726975" pattern="###,###,###" /></td>
            </tr>
            
             <tr class="gradeA">
            	<td>급여</td>
            	<td><fmt:formatNumber value="93000000" pattern="###,###,###" /></td>
            	<td></td>
            </tr>
            
             <tr class="gradeA">
            	<td>복리후생비</td>
            	<td><fmt:formatNumber value="2497520" pattern="###,###,###" /></td>
            	<td></td>
            </tr>
            
             <tr class="gradeA">
            	<td>소모품비</td>
            	<td><fmt:formatNumber value="2229455" pattern="###,###,###" /></td>
            	<td></td>
            </tr>
            
             <tr class="gradeA">
            	<td>수수료비용</td>
            	<td><fmt:formatNumber value="600000" pattern="###,###,###" /></td>
            	<td></td>
            </tr>
            
             <tr class="gradeA">
            	<td>영업이익</td>
            	<td></td>
            	<td><fmt:formatNumber value="350577585" pattern="###,###,###" /></td>
            </tr>
            
             <tr class="gradeA">
            	<td>영업외수익</td>
            	<td></td>
            	<td><fmt:formatNumber value="0" pattern="###,###,###" /></td>
            </tr>
            
             <tr class="gradeA">
            	<td>영업외비용</td>
            	<td></td>
            	<td><fmt:formatNumber value="0" pattern="###,###,###" /></td>
            </tr>
            
             <tr class="gradeA">
            	<td>법인세차감전이익</td>
            	<td></td>
            	<td><fmt:formatNumber value="350577585" pattern="###,###,###" /></td>
           	 </tr>
            
             <tr class="gradeA">
            	<td>법인세등</td>
            	<td></td>
            	<td><fmt:formatNumber value="0" pattern="###,###,###" /></td>
            </tr>
            
             <tr class="gradeA">
            	<td>당기순이익</td>
            	<td></td>
            	<td><fmt:formatNumber value="350577585" pattern="###,###,###" /></td>
            </tr>
            
            </tbody>
         
            </table>
                </div>

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