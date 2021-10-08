<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${chk eq 'N'}">
		<script type="text/javascript">
			window.location="loginfail";
		</script>
	</c:if>

	<c:if test="${authority eq '[ROLE_USER]'}">
		<script type="text/javascript">
			window.location="firsthome";
		</script>
	</c:if>
	
	<c:if test="${authority eq '[ROLE_HOST]'}">
		<script type="text/javascript">
			window.location="${path}/host/firsthome";
		</script>
	</c:if>
	
	<c:if test="${authority eq '[ROLE_EMP]'}">
		<script type="text/javascript">
			window.location="${path}/host/fist_emphome";
		</script>
	</c:if>


</body>
</html>