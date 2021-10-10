$(document).ready(function() {

	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/requestDetail',  // 전송페이지 => 컨트롤러/basic1_next
			type : 'POST',						// 전송방식('GET', 'POST')
			dataType : {},						// 요청한 데이터 형식('html', 'xml', 'json', text', 'jsoup')
			success : function(data) {			// 콜백함수 - 전송에 성공했을때의 결과(= basic1_next.jsp)가 data 변수에 전달된다.
				$('#requestDetail').html(data);	// .html은 innerHTML과 같다. data 변수명은 내가 임의로 정하기 나름.
			},				
			error : function() {
				alert('오류');
			}
		});
	});
	
	
	
	// 예약등록 버튼을 눌러 INSERT하기
	/* 	function insertReservation(){
			var qty = document.getElementById("c_quantity").value;
			var m_number = document.getElementById("m_number").value;
			m_number = document.getElementById("m_number").innerHTML;
			if(qty == 0){
				alert("수량을 입력해 주세요.");
			}else{
				var m_name = document.getElementById("m_name").innerHTML;
				var isTrue = confirm(m_name +" "+ qty + "개를 장바구니에 담으시겠습니까?");
				
				if(isTrue==true){
					window.location = 'cartPutAction.bo_od?c_quantity=' + qty + '&m_number=' + m_number;
				}
			}
		} */
	
	function insertReservation(){		
		var isTrue = confirm("해당 요청을 등록하시겠습니까?");
		
		if(isTrue==true){
			window.location = 'insertAction';
		} else {
			window.location = 'requestDetail';
		}
	}
	
	function modifyReservation(){		
		var isTrue = confirm("해당 요청을 수정하시겠습니까?");
		
		if(isTrue==true){
			return true;
			//window.location = 'modifyAction?res_code=${dto.res_code}&res_detail_code=${dto.res_detail_code}&res_state=${dto.res_state}&res_hour=${dto.res_hour}&res_room=${dto.res_room}&res_cnt=${dto.res_cnt}&employee_code=${dto.employee_code}&res_indiv_request=${dto.res_indiv_request}&res_memo=${dto.res_memo}';
		} else {
			return false;
			//window.location = 'requestDetail';
		}
	}
	
	function deleteReservation(){		
		var isTrue = confirm("해당 요청을 취소하시겠습니까?");
		
		if(isTrue==true){
			return true;
		} else {
			return false;
		}
	}
	
	function completeService(){		
		var isTrue = confirm("해당 서비스를 완료하시겠습니까?");
		
		if(isTrue==true){
			return true;
		} else {
			return false;
		}
	}
	
	
	
	
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