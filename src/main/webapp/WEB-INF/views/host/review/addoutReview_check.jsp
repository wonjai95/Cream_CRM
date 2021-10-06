<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function success(){
		opener.window.location="review";
		self.close();
	}
	
	function fail(){
		alert("등록실패, 다시시도해주세요");
		window.location="newchace";
	}

</script>

</head>
<c:if test="${insertCnt > 0}">
	<body onload="success();">
</c:if>

<c:if test="${insertCnt == 0}">
	<body onload="fail();">
</c:if>

</body>
</html>