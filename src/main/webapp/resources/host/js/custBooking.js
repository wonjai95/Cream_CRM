$(document).ready(function() {
   
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green'
        });

    /* initialize the external events
     -----------------------------------------------------------------*/


    $('#external-events div.external-event').each(function() {
        $(this).data('event', {
            title: $.trim($(this).text()), // use the element's text as the event title
            stick: true // maintain when user navigates (see docs on the renderEvent method)
        });

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
            right: 'month'
        },
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar
        selectable: true,
        
        drop: function() {
            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }
        },
        
       dayClick: function(date, allDay, jsEvent, view) {
         $("#timeTable").html("");
         $("#roomTable").html("");
         $("#roomDetail").html("");
         $(".roomSelectedInfo").html("");
          
          if (date.isBefore(moment())) {
              alert("과거 날짜로 예약할 수 없습니다!")
           } else {
              m = date.format()
              console.log('Clicked on: ' + m);
              
              var host_code = $("input[name=host_code]").val();
              var getDay = new Date(m).getDay();
              $("#chkDay").val(getDay);
              
              var hours = new Date().getHours();
              var min = new Date().getMinutes();
              
              // 30분이 지나면 2타임 이후부터 예약 가능
              if(min > 30){
                 hours += 2;
              } else {
                 hours += 1;
              }
              
              // 시간 형식 hh:mm을 위한 0 삽입
              hours = hours < 10 ? "0" + hours : hours;
              
              // localTime은 24:00을 지원하지 않기 때문에 00:00으로 초기화
              hours = hours >= "24" ? "00" : hours;
              
              var getTime = hours + ":00";
              // 일 ~ 토 : 0~6
              console.log("요일 : " + getDay + ", 시간 : " + getTime);
              
              var header = $("meta[name='_csrf_header']").attr("content");
              var token = $("meta[name='_csrf']").attr("content");
              console.log("header : " + header);
              console.log("token : " + token);
              
              var comp_res = $("#comp_res").val();
              console.log("comp_res : " + comp_res);
              
              // 달력에 날짜 클릭시 comp_res가 "담당자"일 경우 bookingTimeTable 내용을 보여줌
              if(comp_res == "담당자") {
                 $.ajax({
                     url : "bookingTimeTable",
                     type : "Post",
                     data : "day=" + getDay + "&time=" + getTime + "&host_code=" + host_code + "&selectDate=" + m,
                     beforeSend : function(jqXHR, settings) {
                        console.log("beforesend 진행");
                          jqXHR.setRequestHeader(header, token);
                     },
                     success : function(result) {
                        $("#timeTable").html(result);
                     },
                     error : function(error) {
                      console.log(error);  
                      $("#timeTable").html("예약 가능한 시간이 없습니다.");
                     }
                  });
                 
              // 달력에 날짜 클릭시 comp_res가 "호실"일 경우 bookingRoomTable 내용을 보여줌
              } else if (comp_res == "호실") {
                 $.ajax({
                     url : "bookingRoomTable",
                     type : "Post",
                     data : "day=" + getDay + "&time=" + getTime + "&host_code=" + host_code + "&selectDate=" + m,
                     beforeSend : function(jqXHR, settings) {
                        console.log("beforesend 진행");
                          jqXHR.setRequestHeader(header, token);
                     },
                     success : function(result) {
                        $("#roomTable").html(result);
                     },
                     error : function(error) {
                      console.log(error);  
                      $("#roomTable").html("예약 가능한 시간이 없습니다.");
                     }
                  });
              } else {
                 alert("다시 시도해주세요.");
                 window.history.back();
              }
            $('.res_date').html(m);
           }
        }, 
    });

    // 최대, 최소 인원수 체크
    function chkCnt (newCnt) {
        var max_cnt = $("#max_cnt").val();
         var min_cnt = $("#min_cnt").val();
         
         if(newCnt > max_cnt) {
              alert("최대 인원수를 초과했습니다.");
              $("#GuestCount").val(max_cnt);
           } else if(newCnt < min_cnt) {
              alert("최소 인원수를 맞춰주세요.");
              $("#GuestCount").val(min_cnt);
           } else {
              $("#GuestCount").val(newCnt);
           }
    };
    
    // 인원수에 따른 총액 산출
    function calTotalPrice() {
       var cnt = $("#GuestCount").val();
       var per_price = $("#per_price").val();
       var totalTime = $("input[name=calTime]").val();
       console.log("totalTime : " + totalTime);
       var priceTotal = parseInt(cnt) * parseInt(per_price) * parseInt(totalTime);
       $("#priceTotal").val(addComma(priceTotal));
       $("#res_sales").val(priceTotal);
    };
    
    
    // 인원수 감소
    $("#GuestCountMinus").click(function(){
       var newCnt;
       var cnt = $("#GuestCount").val();
       if(cnt == 0) {
          newCnt = 0;
       } else {
          newCnt = parseInt(cnt) - 1;
       }
       
       chkCnt(newCnt);
       calTotalPrice()
    });
    
    
    // 인원수 증가
    $("#GuestCountPlus").click(function(){
       var newCnt;
       var cnt = $("#GuestCount").val();
       newCnt = parseInt(cnt) + 1;
       var max_cnt = $("#max_cnt").val();
       var min_cnt = $("#min_cnt").val();
       
       chkCnt(newCnt);
       calTotalPrice()
    });
    
    // 시간 선택
    $("button[id^=timeBtn]").click(function() {
       var timeClick = $(this).attr('value');
       $('#selectTime').val(timeClick);
       $('.timeSelectedInfo').html(timeClick);
    });
    
    // 수업 선택
    $("button[id^=typeBtn]").click(function() {
       var typeClick = $(this).attr('value');
       $('#selectType').val(typeClick);
       $('.typeSelectedInfo').html(typeClick);
    });
    
    // 호실 선택
    $("button[id^=roomBtn]").click(function() {
       var roomClick = $(this).attr('value');
       $('#selectRoom').val(roomClick);
       $('.roomSelectedInfo').html(roomClick);
    });
    
    // 담당자 선택
    $("td[class^=managerBtn]").click(function() {
       var managerClick = $(this).find(".managerBtn").attr('value');
       var employee_code = $(this).find("#employee_code").val();
       $('#selectManager').val(employee_code);
       $('.managerSelectedInfo').html(managerClick);
    });
    
    // 결제 상품 선택 
    $("tr[class^=proList]").click(function() {
       var productPrice = $(this).find("input[id^=price]").val();
       $('#ReserveProductSum').val(productPrice);
       
       var product_code = $(this).find("input[name=ReserveProduct]").val();
       $("#product_code").val(product_code);
       
       var productPrice_format = addComma(productPrice);
       $('.productSelectedInfo').html(productPrice_format);
       
    });
    
    
  //천단위 콤마 함수
  function addComma(value){
       value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
       return value; 
  };

  //천단위 콤마 함수
  function minusComma(value){
       value = value.toString().replace(/[^\d]+/g, "");
       return value; 
  };
  
   // 예약하기 버튼 클릭 시 필수 정보 부재시 alert 및 return false
   $("#custBookingForm").submit(function() {
      if($("#user_id").val() == "") {
         alert("로그인 후 예약을 진행하세요!");
         window.location="home";
         return false;
      } else if($("#GuestCount").val() == 0) {
         alert("예약 항목을 선택해주세요!");
         return false;
      } else if($("#priceTotal").val() == 0) {
         alert("예약 항목을 선택해주세요!");
         return false;
      } else if($("#ReserveProductSum").val() == 0) {
         alert("예약 항목을 선택해주세요!");
         return false;
      } else if($("#selectManager").val() == "") {
         alert("담당자를 선택해주세요!");
         return false;
      }
   });
  
  
  // -------------- 지도 api --------------
  
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  mapOption = {
      center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
      level: 3 // 지도의 확대 레벨
      };  
   
     // 지도를 생성합니다    
     var map = new kakao.maps.Map(mapContainer, mapOption); 
   
     // 주소-좌표 변환 객체를 생성합니다
     var geocoder = new kakao.maps.services.Geocoder();
   
     var comp_address = document.getElementById('comp_address').value;
     
     // 주소로 좌표를 검색합니다
     geocoder.addressSearch(comp_address, function(result, status) {
   
         // 정상적으로 검색이 완료됐으면 
          if (status === kakao.maps.services.Status.OK) {
   
             var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
   
             // 결과값으로 받은 위치를 마커로 표시합니다
             var marker = new kakao.maps.Marker({
                 map: map,
                 position: coords
             });
   
             // 인포윈도우로 장소에 대한 설명을 표시합니다
         var infowindow = new kakao.maps.InfoWindow({
             content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
             });
             infowindow.open(map, marker);
   
             // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
         map.setCenter(coords);
     } 
 });    
  
  
    
});