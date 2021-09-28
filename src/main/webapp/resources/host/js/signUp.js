/**
 * 	
 */

//---------------------------------------------------------

//입력창 공백 체크&비밀번호 동일 체크 함수
 function signUpCheck(){
	 
	 //이름
	 if(!document.signInform.user_name.value){
		 document.signInform.user_name.focus();
		 document.getElementById("div_name").style.display = "block";
		 return false;
	 } else{
		 document.getElementById("div_name").style.display = "none";
	 }
	 
	 //아이디
	 if(!document.signInform.user_ID.value){
		 document.signInform.user_ID.focus();
		 document.getElementById("div_ID").style.display = "block";
		 return false;
	 } else{
		 document.getElementById("div_ID").style.display = "none";
	 }
	 
	 //비밀번호
	 if(!document.signInform.user_PWD.value){
		 document.signInform.user_PWD.focus();
		 document.getElementById("div_PWD").style.display = "block";
		 return false;
	 } else{
		 document.getElementById("div_PWD").style.display = "none";
	 }
	 
	 //비밀번호 확인
	 if(!document.signInform.re_user_PWD.value){
		 document.signInform.re_user_PWD.focus();
		 document.getElementById("div_rePWD").style.display = "block";
		 return false;
	 } else{
		 document.getElementById("div_rePWD").style.display = "none";
	 }
	 
	 //비밀번호 -비밀번호 확인 동일체크
	 if(document.signInform.user_PWD.value != document.signInform.re_user_PWD.value){
		 document.signInform.re_user_PWD.focus();
		 document.getElementById("div_PWD_eqChk").style.display = "block";
		 return false;
	 } else{
		 document.getElementById("div_PWD_eqChk").style.display = "none";
	 }
	 
	 
	 //전화번호 
	 if(!document.signInform.hp1.value ||
		!document.signInform.hp2.value ||
		!document.signInform.hp3.value ){
		 document.signInform.hp1.focus();
		 document.getElementById("div_hp").style.display = "block";
		 return false;
	 } else{
		 document.getElementById("div_hp").style.display = "none";
	 }
	 
	 //주소 - 윗부분
	 if(!document.signInform.zipcode.value){
		 document.signInform.zipcode.focus();
		 document.getElementById("div_address").style.display = "block";
		 return false;
	 } else{
		 document.getElementById("div_address").style.display = "none";
	 }
	 
	 //주소 - 상세부분
	 if(!document.signInform.address.value){
		 document.signInform.address.focus();
		 document.getElementById("div_address_detail").style.display = "block";
		 return false;
	 } else{
		 document.getElementById("div_address_detail").style.display = "none";
	 }
	 
	 //id 중복체크
	 if(document.signInform.hiddenId_dupChk.value == "0"){
		 document.signInform.user_ID.focus();
		 document.getElementById("div_dup_ID").style.display = "block";
		 return false;
	 }
	 
 }
 
 
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
	 if(!document.signInform.user_ID.value){
		 document.signInform.user_ID.focus();
		 document.getElementById("div_ID").style.display = "block";
		 return false;
	 } else{
		 document.getElementById("div_ID").style.display = "none";
	 }
	 
	 var url = "confirmId?user_ID=" + document.signInform.user_ID.value;
	 window.open(url, "confirm", "left=800,top=300, location=no, menubar=no, width=400, height=200");
 }
 
 //중복확인창에서 회원가입창으로 이동시켜주기
 function setId(id) {
		opener.document.signInform.user_ID.value = id;
		opener.document.signInform.hiddenId_dupChk.value = 1;
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
