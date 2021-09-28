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
<title>INSPINIA | Data Tables</title>
<script>
</script>

</head>
<body>
<div class="ibox-content" style="margin: 0px; padding: 0px;">

	<table
		class="footable table table-stripped toggle-arrow-tiny footable-loaded tablet breakpoint"
		data-page-size="15">
		<thead>
			<tr>
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">유형</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">판매 내역</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">옵션</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">금액</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">판매 일자</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">납부 방법</span></th>
				
				<th class="footable-visible footable-sortable">
				<span class="footable-sort-indicator">금융 기관</span></th>
				
			</tr>
		</thead>
		<c:forEach var="dto" items="${dto}">
		<tbody>
			<tr class="footable-odd" style="">
				<td class="footable-visible"><input type="hidden" name="product_typeOfSales" value="${dto.product_typeOfSales}">${dto.product_typeOfSales}</td>
				<td class="footable-visible"><input type="hidden" name="product_name" value="${dto.product_name}">${dto.product_name}</td>
				<td class="footable-visible"><input type="hidden" name="product_group_name" value="${dto.product_group_name}">${dto.product_group_name}</td>
				<td class="footable-visible"><input type="hidden" name="product_price" value="${dto.product_price}">${dto.product_price}</td>
				<td class="footable-visible"><input type="hidden" name="sale_date" value="${dto.sale_date}">${dto.sale_date}</td>
				<td class="footable-visible"><input type="hidden" name="payment_option" value="${dto.payment_option}">${dto.payment_option}</td>
				<td class="footable-visible">카카오</td>
			</tr>   
			
		</tbody>
		</c:forEach>
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