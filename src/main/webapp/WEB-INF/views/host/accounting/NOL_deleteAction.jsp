<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting_tags.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<c:if test="${deleteCnt == 1}">
	<script type="text/javascript">
		alert("매입매출 전표 삭제에 성공했습니다!");
		window.self.close();
		opener.location.reload();
	</script>
</c:if>

<c:if test="${deleteCnt == 0}">
	<script type="text/javascript">
		alert("매입매출 전표 삭제에 실패했습니다!");
		window.history.back();
	</script>
</c:if>
</body>
</html>