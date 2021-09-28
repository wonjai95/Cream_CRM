$(document).ready(function() {

    
	// 예약상태 선택
    $("button[id^=stateBtn]").click(function() {
    	alert('상태변경하시겠어요?');
       var stateClick = $(this).attr('value');
       $('#selectState').val(stateClick);
       $('.stateSelectedInfo').html(stateClick);
    });
	
    // 인원수 감소
    $("#GuestCountMinus").click(function(){
       var newCnt;
       var cnt = $("#GuestCount").val();
       if(cnt == 0) {
          newCnt = 0;
       } else {
          newCnt = parseInt(cnt) - 1;
       }
       $("#GuestCount").val(newCnt);
       
    });
    
    // 인원수 증가
    $("#GuestCountPlus").click(function(){
       var newCnt;
       var cnt = $("#GuestCount").val();
         newCnt = parseInt(cnt) + 1;
       $("#GuestCount").val(newCnt);
       
    });
    
    // 시간 선택
    $("button[id^=timeBtn]").click(function() {
       var timeClick = $(this).attr('value');
       $('#selectTime').val(timeClick);
       $('.timeSelectedInfo').html(newTime);
    });
    
    
    
    // 호실 선택
    $("button[id^=roomBtn]").click(function() {
       var roomClick = $(this).attr('value');
       $('#selectRoom').val(roomClick);
       $('.roomSelectedInfo').html(roomClick);
    });
    
    // 담당자 선택
    $("button[id^=managerBtn]").click(function() {
       var managerClick = $(this).attr('value');
       $('#selectManager').val(managerClick);
       $('.managerSelectedInfo').html(managerClick);
    });
    
    // 결제 상품 선택 
    $("input[name=ReserveProduct]").click(function() {
       var productClick = $(this).attr('value');
       console.log(productClick);
       var productPrice = $('input[id$=price_'+productClick+']');
       console.log(productPrice.val());
       $('#ReserveProductSum').val(productPrice.val());
       
       var productPrice_format = addComma(productPrice.val());
       
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
   
  
  
    
});