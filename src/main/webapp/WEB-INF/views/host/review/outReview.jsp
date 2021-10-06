<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/host/js/outReview.js"></script>
<script>
	$("document").ready(function(){
		
		$("tr[id^=index_]").click(function(){
			
			$("tr[id^=index_]").css("background","");
			
			var thisTr = $(this);
		    var thisTd = $(this).children();
		    
		    var keyword = thisTd.find("input[name^=h_keyword]").val();
		    var url = thisTd.find("input[name^=h_url]").val();
		    var code = thisTd.find("input[name^=h_code]").val();
		    
		    if(keyword != null){
		    	 $("input[name=search_keyword]").val(keyword);
				 $("input[name=search_url]").val(url);
				 $("input[name=delete_code]").val(code);
					
				    var graph = "outreview_graph?code="+code;
				    
				    $('#graph_window').attr('src', graph);
				    
					$(this).css("background","#27efc7");
		    }
		    else{
		    	 $("input[name=search_keyword]").val("");
				 $("input[name=search_url]").val("");
				 $("input[name=delete_code]").val("");
		    }
		    
		   
		})
	});

</script>
</head>
<body>

<div class="panel-body" style="height: 900px;">
	<!-- 버튼  -->
		<div class="form-group" style="margin-left: 40px; margin-top: 20px; margin-bottom: 10px;">
			<button id="chace_new_btn" class="btn btn-primary dim" type="button" onclick="newChace();">새 추적</button>
			<button id="chace_delete_btn" onclick="delete_post();" class="btn btn-primary dim" type="button" style="margin-right: 40px;">삭제</button>
			<button id="chace_search_btn" onclick="open_search();" class="btn btn-primary dim" type="button">키워드 검색</button>
			<button id="chace_open_btn" onclick="open_url();" class="btn btn-primary dim" type="button">후기 확인</button>
		</div>
		
	<div class="ibox-content" style="padding-bottom: 0px; margin-bottom: 0px; height: 80%;">
		<div class="row" style="height: 100%;">
			<div class="form-group" style="height: 85%;">
				<!-- 외부 후기 목록  -->
				<input type="hidden" id="search_keyword" name="search_keyword" value="">
				<input type="hidden" id="search_url" name="search_url" value="">
				<input type="hidden" id="delete_code" name="delete_code" value="">
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
								<th>하락한도</th>
								<th>업데이트</th>
								<th>등록일자</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="i" items="${number_list}">
							<tr id="index_${i}">
								
								<td>${i+1}</td>
								
								<c:if test="${i < out_list.size()}">
									<td style="display: none;">
										<input type="hidden" name="h_keyword${i}" value="${out_list.get(i).outreview_keyword}">
										<input type="hidden" name="h_url${i}" value="${out_list.get(i).outreview_url}">
										<input type="hidden" name="h_code${i}" value="${out_list.get(i).outreview_code}">
									</td>
									<c:if test="${out_list.get(i).outreview_chk eq 'Y'}">
										<td>추적중</td>
									</c:if>
									<c:if test="${out_list.get(i).outreview_chk eq 'N'}">
										<td>추적중지</td>
									</c:if>
									<td>${out_list.get(i).outreview_keyword}</td>
									<td>${out_list.get(i).outreview_title}</td>
									<td>${out_list.get(i).outreview_url}</td>
									<td>${out_list.get(i).outdetail_rank}</td>
									<td>${out_list.get(i).outreview_rankmax}</td>
									<td>${out_list.get(i).outreview_update}</td>
									<td>${out_list.get(i).outreview_date}</td>
								</c:if>
								
								<c:if test="${i >= out_list.size()}">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								</c:if>
							</tr>
						</c:forEach>
						</tbody>
						<tfoot style="border-bottom: 1px solid black;">
							<tr></tr>
						</tfoot>
					
					</table>
				</div>
				
				<!-- 후기별 그래프 출력부분  -->
				<iframe id="graph_window" name="graph_window" src="outreview_graph?code=${out_first_code}" style="width: 100%; height: 100% ">
				</iframe>
			</div>
		</div>
	</div>
</div>


</body>
</html>