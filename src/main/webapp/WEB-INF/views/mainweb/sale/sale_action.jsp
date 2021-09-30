<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Selling</title>
</head>
<body>

<c:if test="${insertCnt_room == 3}">
	<script type="text/javascript">
		alert("예약 가능한 시간이 아닙니다. 다시 확인해주세요.");
		window.history.back();
	</script>
</c:if>
<c:if test="${insertCnt_room == 2}">
	<script type="text/javascript">
		alert("부접한한 예약 시간입니다. 다시 확인해주세요.");
		window.history.back();
	</script>
</c:if>
<c:if test="${insertCnt_room == 1 && insertCnt_sale == 1}">
	<script type="text/javascript">
		alert("예약에 성공했습니다.");
		window.location='mypage';
	</script>
</c:if>
<c:if test="${insertCnt_room == 0}">
	<script type="text/javascript">
		alert("예약에 실패했습니다. 다시 시도해주세요.");
		window.history.back();
	</script>
</c:if>












<c:if test="${insertCnt_res == 1 && insertCnt_sale == 1}">
	<script type="text/javascript">
		alert("결제 처리 완료!!");
		self.close();
		opener.window.location = "mypage";
	</script>
</c:if>

<c:if test="${insertCnt_res != 1 && insertCnt_sale != 1}">
	<script type="text/javascript">
		alert("결제 처리 실패!! 다시 시도해주세요.");
		window.history.back();
	</script>
</c:if>

<c:if test="${insertCnt_res == 1 && insertCnt_sale != 1}">
	<script type="text/javascript">
		alert("결제 처리 실패!! 다시 시도해주세요.");
		window.history.back();
	</script>
</c:if>














</body>
</html>