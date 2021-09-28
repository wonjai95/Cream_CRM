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

<body>
<form name ="passform">
<input type="hidden" name="newpw" value="${newpw}"> 

<c:if test="${check == 1}">
	<script type="text/javascript">
		success();
	</script>
</c:if>
<c:if test="${check == 0}">
	<script type="text/javascript">
	fail();
	</script>
</c:if>




${success}
</form>	
</body>
</html>