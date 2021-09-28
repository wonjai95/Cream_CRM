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
			alert("상품명이 중복되었습니다.");
			window.history.back();
		</script>
	</c:if>

	<c:if test="${selectCnt == null}">
		<c:if test="${updateCnt == 1}">
			<script type="text/javascript">
				alert("상품 수정 완료");
				self.close();
				opener.window.location = "product";
			</script>
		</c:if>

		<c:if test="${updateCnt != 1}">
			<script type="text/javascript">
				alert("상품 수정 실패 잠시후 다시 시도해 주세요.");
				window.history.back();
			</script>
		</c:if>

	</c:if>
	
	
	
</body>
</html>