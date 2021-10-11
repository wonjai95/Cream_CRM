<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
<h3>카카오페이 결제 성공!!!</h3>
 
<%-- 결제일시:     [[${info.approved_at}]]<br/> --%>
<%-- 주문번호:    [[${info.partner_order_id}]]<br/>
상품명:    [[${info.item_name}]]<br/>
상품수량:    [[${info.quantity}]]<br/>
결제금액:    [[${info.total_amount}]]<br/>
결제방법:    [[${info.payment_method_type}]]<br/>
 --%> 
<h2>[[${info}]]</h2>
 
</body>
</html>
