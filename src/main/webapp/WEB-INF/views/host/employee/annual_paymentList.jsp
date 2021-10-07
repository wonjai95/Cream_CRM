<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/setting_tags.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="list4" items="${paymentList}">
		<tr class="salary">
			<td>${list4.salary_payDate} <input type="hidden"
				name="salary_cd" value="${list4.salary_code}">
			</td>
			<td>${list4.pay_month}</td>
			<td><fmt:formatNumber value="${list4.salary}"
					pattern="###,###,###" /></td>
			<td><fmt:formatNumber value="${list4.income_tax}"
					pattern="###,###,###" /></td>
			<td><fmt:formatNumber value="${list4.national_pension}"
					pattern="###,###,###" /></td>
			<td><fmt:formatNumber value="${list4.employment_insurance}"
					pattern="###,###,###" /></td>
			<td><fmt:formatNumber value="${list4.health_insurance}"
					pattern="###,###,###" /></td>
			<td><fmt:formatNumber value="${list4.lt_care_insurance}"
					pattern="###,###,###" /></td>
			<td><fmt:formatNumber value="${list4.deduction_total}"
					pattern="###,###,###" /></td>
			<td><fmt:formatNumber value="${list4.loan_payment_amount}"
					pattern="###,###,###" /></td>
		</tr>
	</c:forEach>
</body>
</html>