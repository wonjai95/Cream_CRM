<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- 내가 쓴 js  -->
  <script src="${path}/resources/user/js/modifyUser.js"></script>

</head>
<body>
<h3> Loading to modify user info </h3>

<c:if test="${updateCnt == 1}">
	<script type="text/javascript">
		window.alert("회원 정보 수정 성공!!");
		window.close();
	</script>
</c:if>
<c:if test="${updateCnt == 0}">
	<script type="text/javascript">
		window.alert("회원 정보 수정 실패!!");
		window.history.back();
	</script>
</c:if>


</body>
</html>