<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- morris -->
 <link href="..${path}/resources/bootstrap/css/morris-0.4.3.min.css" rel="stylesheet">
 <script src="..${path}/resources/bootstrap/js/jquery-3.1.1.min.js"></script>

</head>
<body>
	<h5>Line Chart Example </h5>
   <div class="ibox-content">
       <div id="morris-one-line-chart"></div>
   </div>
	
	  <!-- Morris -->
    <script src="..${path}/resources/bootstrap/js/raphael-2.1.0.min.js"></script>
    <script src="..${path}/resources/bootstrap/js/morris.js"></script>
    
    <script>
    
    $(function() {

        Morris.Line({
            element: 'morris-one-line-chart',
                data: [
                	{ day: '${firstday}', rank: null },
                	{ day: '${beforeday}', rank: null },
                		
                	 <c:forEach var="vo" items="${graph_list}" varStatus="i">
	                	 <c:if test="${graph_list.size() > i.index}">
	                	 	{ day: '${vo.outdetail_date}', rank: ${vo.outdetail_rank * -1} },
	                	 </c:if>
                	 </c:forEach>
                	 { day: '${nextday}', rank: null },
                	 { day: '${finalday}', rank: null }
                ],
            xkey: 'day',
            ykeys: ['rank'],
            resize: true,
            lineWidth:4,
            labels: ['Rank'],
            lineColors: ['#1ab394'],
            pointSize:5,
            xLabels:"day",
            ymax:5,
            ymin:-35
        });
     
    });
    
    </script>

</body>
</html>