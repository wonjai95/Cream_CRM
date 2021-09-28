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
	
	<c:if test="${insertCnt != 1}">
		<script type="text/javascript">
			alert("등록 실패... 잠시후 다시 시도해주세요...");
		</script>
	</c:if>
	
	<c:if test="${insertCnt == 1}">
		<script type="text/javascript">
			alert("사업자 등록을 하였습니다.");
			window.location = "hostPage";
		</script>
	</c:if>

</body>
</html>