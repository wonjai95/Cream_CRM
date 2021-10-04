<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    { year: '2008', value: 5 },
                    { year: '2009', value: 10 },
                    { year: '2010', value: 8 },
                    { year: '2011', value: 22 },
                    { year: '2012', value: 8 },
                    { year: '2014', value: 10 },
                    { year: '2015', value: 5 }
                ],
            xkey: 'year',
            ykeys: ['value'],
            resize: true,
            lineWidth:4,
            labels: ['Value'],
            lineColors: ['#1ab394'],
            pointSize:5,
        });
     
    });
    
    </script>

</body>
</html>