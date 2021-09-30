<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>Insert title here</title>
<style type="text/css">
body{background-color: white;}
</style>
<script type="text/javascript">

	$(function(){
		
		$("#room_name").blur(function() {
					var room_name = $(this).val();
					var room_setting_code = $("#room_setting_code").val();
					
					if (room_name != "") {
						$.ajax({
							type : "get",
							url : "chkRoomName",
							data : "room_name=" + room_name + "&room_setting_code=" +room_setting_code,
							success : function(result) {
								$("#chkName").css("display", "block").css(
										"color", "red").css("font-size",
										"10px");
								if (result != 0) {
									$("#chkName").html("호실 이름이 중복되었습니다.");
									$("#hiddenName").val("0");
								} else {
									//$("#chkName").html(room_name + " 은(는) 사용 가능합니다.");
									$("#chkName").css("display", "none");
									$("#hiddenName").val(room_name);
								}
							},
							error : function() {
								alert("오류");
							}

						});
					} else {
						$("#chkName").css("display", "none");
						$("#hiddenName").val("");
					}

				});
		
		
		$("#submitForm").click(function() {
			var frm = $("#frm").serialize();
			var header = $("meta[name='_csrf_header']").attr("content");
			var token = $("meta[name='_csrf']").attr("content");
			
			if(!$("#room_name").val()){
				alert("호실 이름을 입력해주세요");
				return;
			}else if($("#room_stat").val() == "0"){
				alert("호실 상태를 선택해주세요");
				return;
			}else if(!$("#per_price").val() || isNaN($("#per_price").val())){
				alert("가격을 올바른 값으로 입력하세요");
				return;
			}else if(!$("#min_cnt").val()){
				alert("최소 인원수를 입력해주세요");
				return;
			}else if(!$("#max_cnt").val()){
				alert("최대 인원수를 입력해주세요");
				return;
			}else if($("#hiddenName").val() != $("#room_name").val()){
				alert("중복확인을 다시하세요");
				return;
			}else if($("#hiddenName").val() == "0"){
				alert("호실 이름이 중복되었습니다");
				$("#room_name").val("");
				return;
			}
			
			$.ajax({
				type : "post",
				url : "modifyRoom",
				data : frm,
				dataType : 'json', // 저게뭔지는모르겠는데 아마 제이슨형식의 데이터타입이 리스판스결과 인듯..
				beforeSend : function(jqXHR, settings) {
					jqXHR.setRequestHeader(header, token);
				},
				async : false,
				success : function(response) {
					var temp = addHtml(response);
					
					$(opener.document).find("input[type=radio]:checked").parent().parent().replaceWith(temp);
					opener.alert("호실수정완료");
					window.close();
				},
				error : function() {
					alert("에러");
				}
			});
		});
		
		function addHtml(vo) {
			return '<tr class="footable-odd">'
			+ '<td class="footable-visible">&nbsp;&nbsp;&nbsp;'
			+ '<input type="radio" name="room_setting_code" value="'+ vo.room_setting_code +'">'
			+ '</td>'
			+ '<td class="footable-visible"><span>'+ vo.room_name +'</span></td>'
			+ '<td class="footable-visible"><span>'+ vo.room_stat +'</span></td>'
			+ '<td class="footable-visible"><span>'+ vo.per_price +'</span></td>'
			+ '<td class="footable-visible"><span>'+ vo.min_cnt +'</span></td>'
			+ '<td class="footable-visible"><span>'+ vo.max_cnt +'</span></td>'
			+ '</tr>';
		}
		
	});

</script>
</head>
<body>

	<div class="ibox-content">
		<h2>호실 등록</h2>
		<p class="font-bold">호실 상세</p>
		<form id="frm">
			<!-- <form action="setRoomAction" method="post" onsubmit="return chkform();"> -->
			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
			<input type="hidden" id="hiddenName" value="${vo.room_name}">
			<input type="hidden" name="room_setting_code" id="room_setting_code" value="${vo.room_setting_code}">
			<div class="form-group">
				<label>호실 이름</label> <input type="text" class="form-control"
					name="room_name" id="room_name" value="${vo.room_name}">
			</div>
			<p class="font-bold" id="chkName" style="display: none;"></p>
			<div class="form-group">
				<label>호실 상태</label> <select name=room_stat id="room_stat" 
					class="form-control">
					<option value="0">여부 선택</option>
					<c:if test="${vo.room_stat == '사용가능'}">
						<option value="사용가능" selected>사용가능</option>
					</c:if>
					
					<c:if test="${vo.room_stat != '사용가능'}">
						<option value="사용가능">사용가능</option>
					</c:if>
					
					<c:if test="${vo.room_stat == '사용불가능'}">
						<option value="사용불가능" selected>사용불가능</option>
					</c:if>
					
					<c:if test="${vo.room_stat != '사용불가능'}">
						<option value="사용불가능">사용불가능</option>
					</c:if>
				</select>
			</div>

			<div class="form-group">
				<label>1인당 가격</label> <input type="text" class="form-control"
					name="per_price" id="per_price" value="${vo.per_price}">
			</div>
			<div class="form-group">
				<label>최소 인원수</label> <input type="number" class="form-control"
					min="1" max="999" name="min_cnt" id="min_cnt" value="${vo.min_cnt}">
			</div>
			<div class="form-group">
				<label>최대 인원수</label> <input type="number" class="form-control"
					min="1" max="9999" name="max_cnt" id ="max_cnt" value="${vo.max_cnt}">
			</div>
			<div align="center">
				<div><br></div>
				<button class="btn btn-sm btn-primary m-t-n-xs" id="submitForm"
					type="button">
					<strong>수정</strong>
				</button>
			</div>
		</form>
		
	</div>

</body>
</html>