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

	<c:if test="${vo == null}">
		<script type="text/javascript">
			alert("삭제할 상품이 존재하지 않음.");
		</script>		
	</c:if>
	
	<c:if test="${vo != null}">
		<c:if test="${deleteCnt == 1}">
			<script type="text/javascript">
				alert("선택 상품 삭제를 완료 하였습니다.");
				window.location = "product";
			</script>
		</c:if>
		
		<c:if test="${deleteCnt != 1}">
			<script type="text/javascript">
				alert("삭제 실패 잠시후 다시 시도해 주세요.");
			</script>
		</c:if>
	</c:if>

</body>
</html>