<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Creamy || kakaoPay </title>
<script type="text/javascript">

</script>
</head>
<body>
	<h1> kakaoPay 결제하기 </h1>
	
	<form method="post" action="kakaoPay">
	<sec:csrfInput/>
		<input type="button" name="kakaoPay"> 카카오페이로 결제하기 !!	
	</form>
</body>
</html>