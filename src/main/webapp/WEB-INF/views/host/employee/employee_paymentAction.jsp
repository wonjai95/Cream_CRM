<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee_paymentAction.jsp</title>
<style type="text/css">
body {
	background-color: white;
}

#g_product {
	text-shadow: aqua;
}
</style>
</head>
<body>
<c:if test="${insertCnt == 1 && selectCnt == 0}">
	<script type="text/javascript">
		alert("급여 지급에 성공했습니다!");
		history.back();
	</script>
</c:if>

<c:if test="${insertCnt == 0 && selectCnt == 1}">
	<script type="text/javascript">
		alert("이미 급여 지급이 된 상태입니다.\n다시 확인해주세요.");
		history.back();
	</script>
</c:if>

<c:if test="${insertCnt == 0 && selectCnt == 0}">
	<script type="text/javascript">
		alert("급여 지급에 실패했습니다.");
		history.back();
	</script>
</c:if>

<c:if test="${deleteCnt == 1}">
	<script type="text/javascript">
		alert("급여 지급 삭제에 성공했습니다!");
		history.back();
	</script>
</c:if>

<c:if test="${deleteCnt == 0}">
	<script type="text/javascript">
		alert("급여 지급 삭제에 실패했습니다.");
		history.back();
	</script>
</c:if>
</body>
</html>