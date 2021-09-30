<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting_tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>add_periodic_inven</title>
</head>
<c:if test="${insertCnt == 0}">
	<script type="text/javascript">
		alert("재고실사 등록에 실패했습니다. 다시 시도해주세요.");		
		window.history.back();
	</script>
</c:if>
<c:if test="${insertCnt != 0}">
	<script type="text/javascript">
		alert("재고실사 내역이 등록되었습니다.");		
		window.location="stock";
	</script>
</c:if>

<body>
</body>
</html>