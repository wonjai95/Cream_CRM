<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting_tags.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${updateCnt == 1}">
	<script type="text/javascript">
		alert("매입매출 전표 수정 성공했습니다!");
		window.self.close();
		opener.location.reload();
	</script>
</c:if>

<c:if test="${updateCnt == 0}">
	<script type="text/javascript">
		alert("매입매출 전표 수정에 실패했습니다!");
		window.history.back();
	</script>
</c:if>

</body>
</html>