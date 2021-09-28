<!-- 
이름 : 장현정
작성날짜 : 2021-09-16 ~ 2021-09-19 
회원 정보 페이지에서 예약 관련 출력 탭
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>INSPINIA | Data Tables</title>


</head>
<body>
<div class="ibox-content" style="margin: 0px; padding: 0px;">

	<table
		class="footable table table-stripped toggle-arrow-tiny footable-loaded tablet breakpoint"
		data-page-size="15">
		<thead>
			<tr>
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">예약 일자</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">시간</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">예약 유형</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">예약 상태</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">호실</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">상품</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">합계</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">인원</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">별도 요청</span></th>
				
				
			</tr>
		</thead>
		<tbody>
			<tr class="footable-odd" style="">
				<td class="footable-visible footable-first-column"><span
					class="footable-toggle"></span>2021-09-19</td>
				<td class="footable-visible">13시</td>
				<td class="footable-visible">안내</td>
				<td class="footable-visible">예약 부도</td>
				<td class="footable-visible">3실</td>
				<td class="footable-visible">염색 1회</td>
				<td class="footable-visible">150,000 원</td>
				<td class="footable-visible">1 명</td>
				<td class="footable-visible">잘 부탁드려요</td>
				
			</tr>
			
			<tr class="footable-odd" style="">
				<td class="footable-visible footable-first-column"><span
					class="footable-toggle"></span> 2021-09-20</td>
				<td class="footable-visible">18시</td>
				<td class="footable-visible">심층</td>
				<td class="footable-visible">예약중</td>
				<td class="footable-visible">12실</td>
				<td class="footable-visible">회원권 1개월</td>
				<td class="footable-visible">100,000 원</td>
				<td class="footable-visible">3 명</td>
				<td class="footable-visible">잘 부탁드려요</td>
			</tr>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="6" class="footable-visible">
					<ul class="pagination float-right">
						<li class="footable-page-arrow disabled"><a
							data-page="first" href="#first">«</a></li>
						<li class="footable-page-arrow disabled"><a
							data-page="prev" href="#prev">‹</a></li>
						<li class="footable-page active"><a
							data-page="0" href="#">1</a></li>
						<li class="footable-page"><a data-page="1"
							href="#">2</a></li>
						<li class="footable-page-arrow"><a
							data-page="next" href="#next">›</a></li>
						<li class="footable-page-arrow"><a
							data-page="last" href="#last">»</a></li>
					</ul>
				</td>
			</tr>
		</tfoot>
	</table>

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