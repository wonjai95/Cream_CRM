
//이미지 화면에 바로 띄우기
 function insertImg(filename){
	 
	 var radio = document.getElementsByName('check_form');
		
		
		var click_state ="";
		
		for( i=0; i<radio.length; i++ ) {
			if(radio[i].checked) {
				click_state = radio[i].value;
			}
		}
		
		alert(click_state);
		
	 var name = "reviewform"+click_state;
	
	 
	 
	 var fileInput = filename.files[0].name;
	 
	 var imgPath = "../images/"+fileInput;
	 
	 document.forms[name].elements['img_url'].value
	 
	 /*document.reviewform.img_url.value = fileInput;*/
	 
	 var imgTag = document.getElementById("stock_img");
	imgTag.setAttribute("src","images/main/"+fileInput);
		
	 
 }
 
 function changestar(star){
	
	/*//라디오버튼 체크 확인
		var radio = document.getElementsByName('check_form');
		
		
		var click_state ="";
		
		for( i=0; i<radio.length; i++ ) {
			if(radio[i].checked) {
				click_state = radio[i].value;
			}
		}
		
		alert(click_state);
		
		var name = "reviewform"+click_state;
		
		 var star_v = document.getElementById("star_v");
		 star_v.setAttribute("value",star);*/
		
		/*document.name.star_v.value = star;*/
		
	 
	/*document.reviewform.star_v.value = star;*/

 }
 
 function check_radio(code){
	 var radio = document.getElementsByName('check_form');
	 
	 for( i=0; i<radio.length; i++ ) {
		 if(radio[i].value == code)
			radio[i].checked = true;
		}
	 
 }
 

