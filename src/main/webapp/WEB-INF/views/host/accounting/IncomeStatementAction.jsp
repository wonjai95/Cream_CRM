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
<c:if test="${insertCnt == 1}">
	<script type="text/javascript">
		alert("결산 등록에 성공했습니다!");
		location.href = document.referrer;
	</script>
</c:if>

<c:if test="${insertCnt ==0}">
	<script type="text/javascript">
		alert("결산 등록에 실패했습니다.");
		history.back();
	</script>
</c:if>

</body>
</html>