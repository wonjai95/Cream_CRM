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

	<c:if test="${selectCnt != null}">
		<script type="text/javascript">
			alert("상품명 중복");
			window.history.back();
			
		</script>
	</c:if>

	<c:if test="${selectCnt == null}">
		<c:if test="${insertCnt == 1}">
			<script type="text/javascript">
				alert("등록 성공");
				self.close();
				opener.window.location = "product";
			</script>
		</c:if>

		<c:if test="${insertCnt != 1}">
			<script type="text/javascript">
				alert("등록 실패");
				window.history.back();
			</script>
		</c:if>
	</c:if>





</body>
</html>