<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
<script type="text/javascript">
	function setRoom() {
		var url = "setRoom";
		window.open(url, "호실 등록",
						"width=800, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}

	function unselected() {
		var names = document.getElementsByName("room_setting_code");
		for (var i = 0; i < names.length; i++) {
			if (names[i].checked == true) {
				names[i].checked = false;
				break;
			}
		}
	}

	function detailRoom() {
		var names = document.getElementsByName("room_setting_code");
		var room_setting_code = "";
		for (var i = 0; i < names.length; i++) {
			if (names[i].checked == true) {
				room_setting_code = names[i].value;
				break;
			}
		}

		if (room_setting_code == "") {
			alert("호실을 선택하세요");
			return;
		}

		var url = "detailRoom?room_setting_code=" + room_setting_code;
		window.open(url, "호실 상세",
						"width=800, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
	
</script>
</head>
<body>

	<div class="panel-body">
		<fieldset>
			<div class="wrapper wrapper-content">
				<div class="row">
					<div class="col-lg-9 animated fadeInRight">
						<div class="ibox-content" style="margin: 0px; padding: 0px; border: none;"  id="rooms" >
							
						</div>
					</div>
				</div>
			</div>
		</fieldset>
	</div>

</body>
</html>