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
			alert("삭제할 그룹이 없습니다.");
		</script>
	</c:if>
	
	<c:if test="${vo != null}">
		<c:if test="${deleteCnt == 1}">
			<script type="text/javascript">
				alert("삭제 성공.");
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