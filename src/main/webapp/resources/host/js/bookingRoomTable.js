$(document).ready(function() {
   
    function calTotalPrice() {
       var cnt = $("#GuestCount").val();
       var per_price = $("#per_price").val();
       
       var priceTotal = parseInt(cnt) * parseInt(per_price);
       $("#priceTotal").val(addComma(priceTotal));
    };
   
    // 호실 tr 선택
    $("td[class^=roomTr]").click(function() {
       var per_price = $(this).find("input[name=per_price]").val();
       var min_cnt = $(this).find("input[name=min_cnt]").val();
       var max_cnt = $(this).find("input[name=max_cnt]").val();
       
       $("#per_price").val(per_price);
       $("#min_cnt").val(min_cnt);
       $("#max_cnt").val(max_cnt);
       
       $("#GuestCount").attr("value", min_cnt);
       $("#per_price").attr("value", per_price);
       calTotalPrice();
       
    });
   
   
    // 호실 선택
    $("button[id^=roomBtn]").click(function() {
       var roomClick = $(this).attr('value');
       console.log("호실 클릭 : " + roomClick);
       var roomName = $(this).text();
       $('#selectRoom').val(roomClick);
       $('input[name=room_setting_code]').val(roomClick);
       $('.roomSelectedInfo').html(roomName);
       $('#room_name').val(roomName);
       
       // 선택한 시간과 요일
       var selectDate = $("input[name=selectDate]").val();
       var selectRoom = roomClick;
       var selectDay =  $("#chkDay").val();
       console.log("selectDate : " + selectDate);
       console.log("selectDay : " + selectDay + ", selectRoom : " + selectRoom);
       var host_code = $("input[name=host_code]").val();
       
       var header = $("meta[name='_csrf_header']").attr("content");
       var token = $("meta[name='_csrf']").attr("content");
       console.log("header : " + header);
       console.log("token : " + token);
       
       $.ajax({
          url : "roomTimeTable",
          type : "Post",
          data : "selectDay=" + selectDay + "&selectRoom=" + selectRoom + "&host_code=" + host_code
                   + "&selectDate=" + selectDate,
          beforeSend : function(jqXHR, settings) {
             console.log("beforesend 진행");
               jqXHR.setRequestHeader(header, token);
          },
          success : function(result) {
             $("#roomDetail").html(result);
          },
          error : function(error) {
           console.log(error);  
           $("#roomDetail").html("예약 가능한 호실이 없습니다.");
          }
          
       });
       
    });
    
    
    // 이용시간 계산 - 시작 시간 변경시
    $("input[name=res_start]").change(function() {
       var startTime = $(this).val();
       var endTime = $("input[name=res_end]").val();
       var calTime = 0;
       console.log("startTime : " + startTime);
       console.log("endTime : " + endTime);
       
       var getDate = $(".res_date").text();
       var curDate = getToday();
       console.log("선택 날짜 : " + getDate);
       console.log("현재 날짜 : " + curDate);
       
       // 당일 예약일 경우, 현재시간보다 2시간 이후에 대해서만 예약 가능
       if(getDate == curDate) {
          var now = new Date();
          var curHours = now.getHours();
          console.log("현재시간 : " + curHours);
          
          if(curHours == startTime || parseInt(curHours) + 1 == startTime || parseInt(curHours) + 2 == startTime) {
             alert("예약이 불가능한 시간입니다!");
             $(this).val("");
          }
          
       }
       
       if(startTime != "" && endTime != "") {
          calTime = parseInt(endTime) - parseInt(startTime);
          $("#use_time").val(calTime);
          if(calTime <= 0) {
             alert("시간을 다시 입력해주세요.");
             $("input[name=res_start]").val("");
             $("input[name=res_end]").val("");
          } else {
             $("input[name=calTime]").val(calTime);
             $(".calTime").html(calTime);
             $("#GuestCountMinus").click();
          }
       }
       
    });
    
    // 이용시간 계산 - 종료 시간 변경시
    $("input[name=res_end]").change(function() {
       var startTime = $("input[name=res_start]").val();
       var endTime = $(this).val();
       var calTime = 0;
       console.log("startTime : " + startTime);
       console.log("endTime : " + endTime);
       
       if(startTime != "" && endTime != "") {
          calTime = parseInt(endTime) - parseInt(startTime);
          $("#use_time").val(calTime);
          if(calTime <= 0) {
             alert("시간을 다시 입력해주세요.");
             $("input[name=res_start]").val("");
             $("input[name=res_end]").val("");
          } else {
             $("input[name=calTime]").val(calTime);
             $(".calTime").html(calTime);
             $("#GuestCountMinus").click();
          }
       }
       
    });
    
    
    //천단위 콤마 함수
    function addComma(value){
         value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         return value; 
    };
    
    // 현재 날짜 format
    function getToday(){
        var date = new Date();
        var year = date.getFullYear();
        var month = ("0" + (1 + date.getMonth())).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);

        return year + "-" + month + "-" + day;
    };
    
});