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
			alert("이미 존재하는 그룹명 입니다.");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${selectCnt != 1}">
		<c:if test="${updateCnt == 1}">
			<script type="text/javascript">
				alert("수정성공");
				self.close();
				opener.document.location = "product";
			</script>
		</c:if>
		
		<c:if test="${updateCnt != 1}">
			<script type="text/javascript">
				alert("수정 실패 잠시후 다시 시도해주세요.");
				window.history.back();
			</script>
		</c:if>
	</c:if>

</body>
</html>