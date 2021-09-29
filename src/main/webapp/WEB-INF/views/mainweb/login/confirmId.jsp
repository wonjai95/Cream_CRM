<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting_user.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- 내가 쓴 js  -->
   <script type="text/javascript" src="${path}/resources/host/js/signUp.js"></script>
  
</head>

<body>

<c:if test="${selectcnt != 0}">
	<script type="text/javascript">
		fail();
	</script>
</c:if>
<c:if test="${selectcnt == 0}">
	<script type="text/javascript">
	success();
	</script>
</c:if>

</body>
</html>