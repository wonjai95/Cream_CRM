<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/bootstrap/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet">
<script type="text/javascript" src="../resources/host/js/outReview.js"></script>

</head>
<body style="background-color: #fcfcfc">

<form action="addoutReview_Action" name="addoutReviewForm" method="post">
<sec:csrfInput/>	
<input type="hidden" name="rank_min" value="1">

	<table style="margin: 30px 50px; border-collapse: separate; border-spacing:15px; border: 1px solid gray;">
		<tr style="height: 80px;">	
			<th colspan="2" align="left" valign="top" style="padding-left: 10px;">	
				 <span>
				 	후기 추적 등록<br><br>
				 	<small>
				 	후기 추천은 내가 지정한 네이버 블로그 후기의 노출 순위를 지속적으로
				 	 모니터링하는 기능으로 설정한 순위 이하로 떨어질 경우 새로운 후기를
				 	등록하여 관리를 할 수 있습니다.<br><br>
				 	검색 순위는 최대 30위까지 제공하며, 30위를 벗어나면 더이상 추적을 진행하지 않습니다.
				 	</small>
				 	<br><br>	
				 	
				 </span>
			</th>
		</tr>
		<tr align="right">	
			<th>키워드&nbsp;&nbsp;</th>
			<td style="display: flex;">
				<div style="width: 60%; margin-right: 10px;">
				<input class="form-control" name="chace_keyword" type="text" required>
				</div>
				<div style="width: 25%" align="center">
				<button type="button" class="btn btn-primary btn-sm" onclick="keyword_Search()">키워드 확인</button>
				</div>
			</td>
		</tr>
		<tr align="right">	
			<th>포스팅 제목&nbsp;&nbsp;</th>
			<td style="display: flex;">
				<div style="width: 87%; margin-right: 10px;">
				<input name="post_title" class="form-control" type="text">
				</div>
			</td>
		</tr>
		<tr align="right">	
			<th>포스팅 URL&nbsp;&nbsp;</th>
			<td style="display: flex;">
				<div style="width: 87%; margin-right: 10px;">
				<input name="post_url" class="form-control" type="text">
				</div>
			</td>
		</tr>
		
		<tr align="right">	
			<th>하락한도&nbsp;&nbsp;</th>
			<td style="display: flex;">
				<div style="width: 14%; margin-right: 10px;">
					<input id="id_rank" name="rank_level" onchange="set_rank();" class="touchspin3" type="number" min="1" max="30">
				</div>
			</td>
		</tr>
	
	</table>
	<div style="display: flex; justify-content: flex-end; margin-right: 55px;">
		<button type="submit" class="btn btn-primary" style="margin-right: 25px;">확인</button>
		<button type="button" class="btn btn-primary" onclick="window.close();">창닫기</button>
	</div>
	
	</form>
	
	
	<!-- TouchSpin -->
 <script src="${path}/resources/bootstrap/js/jquery.bootstrap-touchspin.min.js"></script>
 
 <script>
 	
 $(".touchspin3").TouchSpin({
     verticalbuttons: true,
     buttondown_class: 'btn btn-white',
     buttonup_class: 'btn btn-white'
 });
 
 
 
 </script>
	

</body>
</html>