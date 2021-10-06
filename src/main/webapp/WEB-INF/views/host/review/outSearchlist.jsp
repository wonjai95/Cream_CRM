<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/host/js/outReview.js"></script>
<style type="text/css">
	
	table{
		width : 90%;
		border: 1px solid gray;
		margin: 50px 5%;
	}
	
	th{
		border: 1px solid gray;
		text-align: center;
	}
	
	td{
		border: 1px solid gray;
	}

</style>
<script>
	$("document").ready(function(){
		
		$("tr[id^=index_]").click(function(){
			
			$("tr[id^=index_]").css("background","");
			
			 var thisTr = $(this);
		     var thisTd = $(this).children();
		     
		     var index = thisTd.find("input[name=radio_check]").val();
		     
		     var titlename = "h_title"+toString(index);
		     var urlname = "h_url"+toString(index);
		     
		     var title = thisTd.find("input[name^=h_title]").val();
		     var url = thisTd.find("input[name^=h_url]").val();
		     
		     $("input[name=rank]").val(index);
		     $("input[name=url]").val(url);
		     $("input[name=title]").val(title);
		     
		     $(this).css("background","#27efc7");

		})
		
	});
</script>
</head>
<body style="background-color: #fcfcfc">

	<form name="chace_searchform">

	<input type="hidden" name = "rank" value="">
	<input type="hidden" name = "url" value="">
	<input type="hidden" name = "title" value="">

	<table>
		<tr>
			<th width="4%"></th>
			<th width="38%">이름</th>
			<th width="38%">URL</th>
		</tr>
		<c:forEach var="url" items="${list_url}" varStatus="i">
		<tr id="index_${i.index}">
			<td style="display: none;">
				<input type="radio" name="radio_check" value="${i.index+1}">
				<input type="text" name="h_title${i.index}" value="${list_title.get(i.index)}">
				<input type="text" name="h_url${i.index}" value="${url}">
			</td>
			<td name="t_rank${i.index}">${i.index + 1}</td>
			<td name="t_title${i.index}">${list_title.get(i.index)}</td>
			<td name="t_url${i.index}">${url}</td>
		</tr>
		</c:forEach>
	</table>
	<div style="display: flex; justify-content: flex-end; margin-right: 55px; margin-bottom: 50px;">
		<button type="button" class="btn btn-primary" onclick="key_Return();" style="margin-right: 25px;">확인</button>
		<button type="button" class="btn btn-primary" onclick="window.close();">창닫기</button>
	</div>
	
	<div style="height: 30px;"></div>
	
	</form>

</body>
</html>