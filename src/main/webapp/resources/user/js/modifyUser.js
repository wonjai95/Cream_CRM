

//infopwcheck에서 사용하는 메서드
//비밀번호 확인 성공시 회원정보 수정 페이지로 이동
function success(){
	
	opener.document.modifyform.newpw.value= document.passform.newpw.value;
    var frm = opener.document.modifyform;
    frm.action = 'modifyInfo';
    frm.target ="_self";
    frm.method ="post";
    frm.submit();
	
	self.close();
}

//비밀번호 틀림 -> 실패 ->기존 비밀번호 확인하세요 띄우고 원래 페이지 띄워줌
function fail(){
	opener.document.getElementById("div_PWD_matchChk").style.display = "block";
	self.close();
}

//-----------------------------------------------------------------
//수정 성공
function modi_success(){
	alert("회원정보 수정 성공, 다시로그인하세요");
	location.href="logout";
			
}

//수정 실패
function modi_fail(){
	alert("회원정보 수정 실패. 다시시도하세요");
	location.href="modify_info";
}


//-----------------------------------------------------------------

//수정전에 비밀번호 체크하기
function modifyInfo_Check(test) {
	
	if(!document.modifyform.modify_newpw.value){
		document.getElementById("div_PWD_eqChk").style.display = "block";
		 return false;
	}
	else
		 document.getElementById("div_PWD_eqChk").style.display = "none";
	
	//새 비밀번호 & 비밀번호 확인 동일한지 체크
	 if(document.modifyform.modify_newpw.value != document.modifyform.modify_repw.value){
		 document.modifyform.modify_newpw.focus();
		 document.getElementById("div_PWD_eqChk").style.display = "block";
		 return false;
	 } else{
		 document.getElementById("div_PWD_eqChk").style.display = "none";
	 }
	 
	 //넘기기 전에 기존 비밀번호랑 맞는지 체크
	 var url = "infopwcheck?pw="+document.modifyform.pwChk.value
		+"&inputpw="+document.modifyform.modify_pw.value
		+"&newpw="+document.modifyform.modify_newpw.value;
	 
	 window.open(url, "confirm", "left=800,top=300, location=no, menubar=no, width=400, height=250");
	 
}

// email 자동 완성
function selectEmailChk() {
	// 직접 입력 - email2 초기화
	if(document.modifyUser.email3.value == 0) {
		document.modifyUser.email2.value = ""; // input 초기화
		document.modifyUser.email2.focus();
	//직접 입력이 아닌 경우 email3.value를 email2.value로 설정
	} else {
		document.modifyUser.email2.value = document.modifyUser.email3.value;
	}
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

