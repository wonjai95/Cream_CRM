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
<h3 style="color : black;"> Loading to delete user info </h3>
<c:if test="${ID == ID}">
	<c:if test="${deleteCnt == 1 && updateCnt == 1}">
		<script type="text/javascript">
			window.alert("회원 삭제 성공!!");
			window.close();
		</script>
	</c:if>
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
			window.alert("회원 삭제 실패!!");
			window.history.back();
		</script>
	</c:if>
</c:if>
</body>
</html>