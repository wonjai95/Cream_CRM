<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting_user.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- 내가 쓴 js  -->
  <script src="${path}/resources/user/js/modifyUser.js"></script>

</head>


<c:if test="${updateCnt == 1}">
	<body onload="modi_success();">
</c:if>
<c:if test="${updateCnt == 0}">
	<body onload="modi_fail();">
</c:if>


</body>
</html>