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
			alert("그룹명 중복");
			window.history.back();
		</script>
	</c:if>

	<c:if test="${selectCnt != 1}">
		<c:if test="${insertCnt == 1}">
			<script type="text/javascript">
				alert("등록완료");
				window.opener.location.reload();
				window.close();
				//self.close();
				//opener.window.location = "${path}/host/product";
			</script>
		</c:if>
		
		<c:if test="${insertCnt != 1}">
			<script type="text/javascript">
				alert("등록실패");
				window.history.back();
			</script>
		</c:if>
	</c:if>

</body>
</html>