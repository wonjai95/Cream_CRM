<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
     <link href="${path}/resources/host/css/move_disable_style.css" rel="stylesheet">

    <title>Creamy_home</title>
</head>

<body>

<div id="wrapper">

	<!-- frame  -->
	<jsp:include page="Frame.jsp" />
	
<div id="page-wrapper" class="gray-bg">

	<!-- nav bar  -->
	<jsp:include page="navbar.jsp" />

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-8">
        <h2>홈</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Home</a>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content">
    <div class="row animated fadeInDown">
        <div class="col-lg-9">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>캘린더 </h5>
                </div>
                <div class="ibox-content">
                    <div id="calendar"></div>
                </div>
            </div>
        </div>
            <div class="col-lg-3">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>예약중 목록</h5>
                </div>
                <div class="ibox-content">
                    <div id='external-events'>
                        <p>${res_today[0].res_date} 현황</p>
                        <c:forEach var="day" items="${res_today}">
                        	<div class='home_div navy-bg'>${day.res_hour}시  - 이름 : ${day.user_name}</div>
                        </c:forEach>
                        <p class="m-t" style="border-top: 1px solid gray; padding-top: 5px;">
                                               인원 : ${res_today.size()}명
                        </p>
                    </div>
                </div>
            </div>
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>신규 등록</h5>
                </div>
                <div class="ibox-content">
                    <div id='external-events'>
                       <p>${res_today[0].res_date} 현황</p>
                       <c:forEach var="user" items="${res_user}">
                        	<div class='home_div navy-bg'>${user.user_name}</div>
                        </c:forEach>
                        <p class="m-t" style="border-top: 1px solid gray; padding-top: 5px;">
                           	인원 : ${res_user.size()}명
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</div>
</div>
<script>

    $(document).ready(function() {

            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green'
            });

        /* initialize the external events
         -----------------------------------------------------------------*/


        $('#external-events div.external-event').each(function() {

            // store data so the calendar knows to render an event upon drop
            $(this).data('event', {
                title: $.trim($(this).text()), // use the element's text as the event title
                stick: true // maintain when user navigates (see docs on the renderEvent method)
            });

            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 1111999,
                revert: true,      // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            });

        });


        /* initialize the calendar
         -----------------------------------------------------------------*/
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();

        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            editable: true,
            droppable: true, 
            drop: function() {
                if ($('#drop-remove').is(':checked')) {
                    $(this).remove();
                }
            },
            events: [
            	 <c:forEach var="img" items="${weather}" varStatus="i">                
            	 	{
            	 		 title: '  ${img.weather}',
                         start: new Date(y, m, d+${i.index}),
                         imageurl:"https://www.accuweather.com${img.icon}",
                        
                         <c:if test="${i.index == 0}">
                         color : "#fcf8e3",
                         </c:if>
                         <c:if test="${i.index != 0}">
                         color : "#ffffff",
                         </c:if>
                         
                         textColor : "#000000"
                },
                </c:forEach>
                
                <c:forEach var="vo" items="${res_list}" varStatus="i">                
           	 	{
                   title: '${vo.user_name}',
                   start: '${vo.res_date}T01:00:00',
                   url: 'http://localhost:3000/host_resdetail?host_code=${sessionScope.code}&code=${vo.res_code}',
               <c:if test="${i.index == res_list.size()}">
	           	 }
               </c:if>
	           <c:if test="${i.index != res_list.size()}">
      	 		},
      			</c:if>
               
               </c:forEach>
            ]
            , eventClick:function(event) {
                if(event.url) {
                    window.open(event.url,'reactview','width=500, height=500');
                    return false;
                }
            },
            eventRender:function(event, eventElement) {
            	
            	eventElement.find("span.fc-time").remove();
            	
                if(event.imageurl) {
                    eventElement.find("span.fc-title").prepend("<img src='" + event.imageurl +"' width='25' height='25' style='margin-right:40px;'>");
                }
            }

        });


    });

</script>
</body>

</html>
