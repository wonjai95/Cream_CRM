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

<c:if test="${insertCnt == 1}">
	<script type="text/javascript">
		alert("결제 처리 및 예약 완료!!");
		window.location = "mypage";
	</script>
</c:if>

<c:if test="${insertCnt != 1}">
	<script type="text/javascript">
		alert("결제 처리 실패!! 다시 시도해주세요.");
		window.history.back();
	</script>
</c:if>

<c:if test="${insertCnt == 3}">
	<script type="text/javascript">
		alert("예약 처리 실패!! 다시 시도해주세요.");
		window.history.back();
	</script>
</c:if>

</body>
</html>