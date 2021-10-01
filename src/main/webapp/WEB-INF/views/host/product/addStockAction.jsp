<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${selectCnt == 1}">
		<script type="text/javascript">
			alert("재고명이 중복되었습니다.");
			window.history.back();
		</script>
	</c:if>

	<c:if test="${selectCnt != 1}">
		<c:if test="${insertCnt == 1}">
			<script type="text/javascript">
				alert("재고를 등록 하였습니다.");
				self.close();
				opener.window.location = "stock";
			</script>
		</c:if>

		<c:if test="${insertCnt != 1}">
			<script type="text/javascript">
				alert("등록 실패 잠시후 다시 시도해보세요.");
				window.history.back();
			</script>
		</c:if>
	</c:if>





</body>
</html>