/**
 * 	
 */

//---------------------------------------------------------
 
//새 추적 열기
 function newChace() {
	 
	 var url = "newchace";
	 window.open(url, "chace_view", "left=600,top=100, location=no, menubar=no, width=700, height=600");
 }
 

 //키워드 확인 입력
function keyword_Search(){
	
	if(!document.addoutReviewForm.chace_keyword.value)
		return false;
	
	 var url = "keywordSearch?keyword="+document.addoutReviewForm.chace_keyword.value;
	 window.open(url, "keyword_view", "left=700,top=50, location=no, menubar=no, width=800, height=800, scrollbars = yes");
	
}