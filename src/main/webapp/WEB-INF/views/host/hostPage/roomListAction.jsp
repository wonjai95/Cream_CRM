<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting_tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$(".page").click(function(e){
			e.preventDefault();
			var pageNum = $(this).attr("href");
			var room_stat = $("#room_stat").val();
			
			$.ajax({
				url:"roomList",
				type:"get",
				data:"pageNum="+pageNum+"&room_stat="+room_stat,
				success:function(response){
					$("#rooms").html(response);
				},
				error:function(){
					alert("오류");
				}
				
			});
		});
		
		
		$("#room_stat").change(function(){
			var room_stat = $(this).val();
			$.ajax({
				url:"roomList",
				type:"get",
				data:"room_stat="+room_stat,
				success:function(response){
					$("#rooms").html(response);
				},
				error:function(){
					alert("오류");
				}
				
			});
		});
	});
</script>
</head>
<body>

	<form action="" method="post" onsubmit="">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}">

		<div id="p_group" style="display: flex;">
			<div>
				<button type="button" class="btn btn-primary dim"
					onclick="setRoom();">호실 등록</button>
			</div>
			<div>
				<button type="button" class="btn btn-primary dim"
					onclick="detailRoom();">호실 수정</button>
			</div>
		</div>

		<table
			class="footable table table-stripped toggle-arrow-tiny footable-loaded tablet breakpoint"
			data-page-size="15">
			<thead>
				<tr>
					<th class="text-right footable-visible footable-last-column">
						<span class="footable-sort-indicator" onclick="unselected();">선택</span>
					</th>

					<th class="text-right footable-visible footable-last-column">
						<span class="footable-sort-indicator">호실 이름</span>
					</th>

					<th class="text-right footable-visible footable-last-column">
						<span class="footable-sort-indicator">호실상태
						<select name="room_stat" id="room_stat">
								<c:if test="${room_stat == null}">
									<option value="0" selected>전체</option>
									<option value="사용가능">사용가능</option>
									<option value="사용불가능">사용불가능</option>
								</c:if>
								
								<c:if test="${room_stat =='사용가능'}">
									<option value="0">전체</option>
									<option value="사용가능" selected>사용가능</option>
									<option value="사용불가능">사용불가능</option>
								</c:if>
								
								<c:if test="${room_stat =='사용불가능'}">
									<option value="0">전체</option>
									<option value="사용가능">사용가능</option>
									<option value="사용불가능" selected>사용불가능</option>
								</c:if>
								
						</select>
					</span>
					</th>

					<th class="text-right footable-visible footable-last-column">
						<span class="footable-sort-indicator">가격</span>
					</th>

					<th class="text-right footable-visible footable-last-column">
						<span class="footable-sort-indicator">최소인원</span>
					</th>

					<th class="text-right footable-visible footable-last-column">
						<span class="footable-sort-indicator">최대인원</span>
					</th>
				</tr>
			</thead>

			<tbody id = "addRoom">
				<c:forEach var="item" items="${list}">
					<tr class="footable-odd">
						<td class="footable-visible">&nbsp;&nbsp;
							<input type="radio" name="room_setting_code" value="${item.room_setting_code}">
						</td>
						<td class="footable-visible"><span>${item.room_name}</span></td>
						<td class="footable-visible"><span>${item.room_stat}</span></td>
						<td class="footable-visible"><span>${item.per_price}</span></td>
						<td class="footable-visible"><span>${item.min_cnt}</span></td>
						<td class="footable-visible"><span>${item.max_cnt}</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	
	
	<table>
		<tfoot>
			<tr>
				<td colspan="6" class="footable-visible">
					<ul class="pagination float-right">
						<c:if test="${cnt>0}">
						
							<c:if test="${startPage > pageBlock}">
								<li class="footable-page-arrow disabled">
								<a class="page" data-page="first" href="1">«</a>
								</li>
								<li class="footable-page-arrow disabled">
									<a class="page" data-page="prev" href="${startPage - pageBlock}">‹</a>
								</li>
							</c:if>
								
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
							
								<c:if test="${i == currentPage}">
									<li class="footable-page active">
										<a data-page="0">${i}</a>
									</li>
								</c:if>
								
								<c:if test="${i != currentPage}">
									<li class="footable-page">
										<a class="page" data-page="1" href="${i}">${i}</a>
									</li>
								</c:if>	
							</c:forEach>
							
							<c:if test="${pageCount > endPage}">
								<li class="footable-page-arrow">
									<a class="page" data-page="next" href="${startPage + pageBlock}">›</a>
								</li>
								<li class="footable-page-arrow">
									<a class="page" data-page="last" href="${pageCount}">»</a>
								</li>
							</c:if>
						</c:if>
					</ul>
				</td>
			</tr>
		</tfoot>
	</table>



	
	
</body>
</html>