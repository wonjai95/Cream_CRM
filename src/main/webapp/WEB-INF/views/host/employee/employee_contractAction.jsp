<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee_contractAction.jsp</title>
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
<c:if test="${insertCnt == 1 && updateCnt == 1}">
	<script type="text/javascript">
		alert("급여계약 갱신에 성공했습니다!");
		window.self.close();
	</script>
</c:if>

<c:if test="${insertCnt == 1 && updateCnt == 0}">
	<script type="text/javascript">
		alert("급여계약이 등록됐습니다!");
		window.self.close();
	</script>
</c:if>

<c:if test="${insertCnt == 0 && updateCnt == 0}">
	<script type="text/javascript">
		alert("급여계약 등록에 실패했습니다.");
		history.back();
	</script>
</c:if>

<c:if test="${deleteCnt == 1}">
	<script type="text/javascript">
		alert("급여계약 삭제에 성공했습니다!");
		history.back();
	</script>
</c:if>

<c:if test="${deleteCnt == 0}">
	<script type="text/javascript">
		alert("급여계약 삭제에 실패했습니다.");
		history.back();
	</script>
</c:if>

</body>
</html>