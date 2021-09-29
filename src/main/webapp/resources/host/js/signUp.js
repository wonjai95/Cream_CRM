/**
 * 	
 */

//---------------------------------------------------------

 
 //전화번호 입력시 다음칸으로 넘기는 메서드
 function nextHp1(){
	 if(document.signInform.sign_Phone1.value.length >= 3){
		 document.signInform.sign_Phone2.focus();
	 }
 }
 function nextHp2(){
	 if(document.signInform.sign_Phone2.value.length >= 4){
		 document.signInform.sign_Phone3.focus();
	 }
 }
 
 
 //이메일입력
 function writemail(mail){
	 document.signInform.email2.value = mail.value; 
	 
 }
 
 
 //회원가입 - id 중복확인 페이지로 이동하는 메서드
 function confirmId() {
	 
	 var url = "confirmId?user_ID=" + document.signInform.sign_id.value;
	 window.open(url, "confirm", "left=800,top=300, location=no, menubar=no, width=400, height=200");
 }
 
 //중복된 아이디 있음
function fail(){
	 opener.document.getElementById("div_ID").style.display = "block";
	 opener.document.getElementById("div_IDok").style.display = "none";
	 self.close();
}

function success(){
	
	opener.document.getElementById("div_ID").style.display = "none";
	opener.document.getElementById("div_IDok").style.display = "block";
	opener.document.signInform.hiddenId_dupChk = 1;
	self.close();
}
 

//다음 주소입력 API
  function addressSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
            	
            	//우편번호
                document.getElementById('postcode').value = data.zonecode;
               
                //시도
                document.getElementById('sido').value = data.sido;
             
                //구군
                document.getElementById('sigungu').value = data.sigungu;
          
            }
        }).open();
    }
