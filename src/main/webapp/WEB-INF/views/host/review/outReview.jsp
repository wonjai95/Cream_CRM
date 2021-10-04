<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/host/js/outReview.js"></script>
</head>
<body>
<div class="panel-body" style="height: 900px;">
	<!-- 버튼  -->
		<div class="form-group" style="margin-left: 40px; margin-top: 20px; margin-bottom: 10px;">
			<button id="chace_new_btn" class="btn btn-primary dim" type="button" onclick="newChace();">새 추적</button>
			<button id="chace_delete_btn" class="btn btn-primary dim" type="button" style="margin-right: 40px;">삭제</button>
			<button id="chace_search_btn" class="btn btn-primary dim" type="button">키워드 검색</button>
			<button id="chace_open_btn" class="btn btn-primary dim" type="button">후기 확인</button>
		</div>
		
	<div class="ibox-content" style="padding-bottom: 0px; margin-bottom: 0px; height: 80%;">
		<div class="row" style="height: 100%;">
			<div class="form-group" style="height: 85%;">
				<!-- 외부 후기 목록  -->
				<div>
					<table class ="table table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>추적상태</th>
								<th>키워드</th>
								<th>이름</th>
								<th>포스팅 URL</th>
								<th>노출 순위</th>
								<th>업데이트</th>
								<th>등록일자</th>
							</tr>
						</thead>
						<tbody>
						<%
							for(int i = 0; i < 5; i++){
						%>
							<tr>
								<td><%=i+1%></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
								
						<%	
							}
						
						%>
						</tbody>
						<tfoot style="border-bottom: 1px solid black;">
							<tr></tr>
						</tfoot>
					
					</table>
				</div>
				
				<!-- 후기별 그래프 출력부분  -->
				<iframe name="graph_window" src="outreview_graph" style="width: 100%; height: 100% ">
				</iframe>
			</div>
		</div>
	</div>
</div>


</body>
</html>