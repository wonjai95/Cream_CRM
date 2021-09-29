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
	function chkform() {
		if (document.getElementById("room_stat").value == "0") {
			alert("예약 종류를 선택하세요")
			return false;
		} else if (document.getElementById("hiddenName") == "0") {
			alert("호실 이름이 중복되었습니다. 다시 확인 해주세요.");
			return false;
		}
	}

	$(function() {
		$("#room_name").blur(
				function() {
					var room_name = $(this).val();
					if (room_name != "") {
						$.ajax({
							type : "get",
							url : "chkRoomName",
							data : "room_name=" + room_name,
							success : function(result) {
								$("#chkName").css("display", "block");
								if (result == 1) {
									$("#chkName").html("호실 이름이 중복되었습니다.");
								} else {
									$("#chkName").html(
											room_name + " 은(는) 사용 가능합니다.").css(
											"color", "red").css("font-size",
											"10px");
									$("#hiddenName").val("1");
								}
							},
							error : function() {
								alert("오류");
							}

						});
					} else {
						$("#chkName").css("display", "none");
						$("#hiddenName").val("0");
					}

				});

		$("#submitForm").click(function() {
			var frm = $("#frm").serialize();
			var header = $("meta[name='_csrf_header']").attr("content");
			var token = $("meta[name='_csrf']").attr("content");

			$.ajax({
				type : "post",
				url : "addRoomAction",
				data : frm,
				dataType : 'json',
				beforeSend : function(jqXHR, settings) {
					jqXHR.setRequestHeader(header, token);
				},
				async : false,
				success : function(vo) {
					var temp = addHtml(vo);
					$(opener.document).find("#rooms").prepend(temp);
					window.close();

				},
				error : function() {
					alert("에러");
				}
			});
		});

		function addHtml(vo) {
			return '<tr class="footable-odd">'
			+ '<td class="footable-visible">&nbsp;&nbsp;'
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
		<p class="font-bold">호실 등록</p>
		<form id="frm">
			<!-- <form action="setRoomAction" method="post" onsubmit="return chkform();"> -->
			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
			<input type="hidden" id="hiddenName" value="0">
			<div class="form-group">
				<label>호실 이름</label> <input type="text" class="form-control"
					name="room_name" id="room_name" required>
			</div>
			<p class="font-bold" id="chkName" style="display: none;"></p>
			<div class="form-group">
				<label>호실 상태</label> <select name=room_stat id="room_stat"
					class="form-control">
					<option value="0" selected>여부 선택</option>
					<option value="사용가능">사용가능</option>
					<option value="사용불가능">사용불가능</option>
				</select>
			</div>

			<div class="form-group">
				<label>1인당 가격</label> <input type="text" class="form-control"
					name="per_price" required>
			</div>
			<div class="form-group">
				<label>최소 인원수</label> <input type="number" class="form-control"
					min="1" max="999" name="min_cnt" required>
			</div>
			<div class="form-group">
				<label>최대 인원수</label> <input type="number" class="form-control"
					min="1" max="9999" name="max_cnt" required>
			</div>
			<div align="center">
				<div><br></div>
				<button class="btn btn-sm btn-primary m-t-n-xs" id="submitForm"
					type="button">
					<strong>등록</strong>
				</button>
			</div>
		</form>
		
		<div id="div_result">ㄹㄹㄹㄹ</div>
	</div>

	

</body>
</html>