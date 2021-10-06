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

//키워드 입력으로 받아온 값들 다시 넘겨주기
function key_Return(){
	
	var rank = document.chace_searchform.rank.value;
	var title = document.chace_searchform.title.value;
	var url = document.chace_searchform.url.value;
	
	opener.document.addoutReviewForm.rank_level.value = rank;
	opener.document.addoutReviewForm.post_url.value = url;
	opener.document.addoutReviewForm.post_title.value = title;
	
	var level = opener.document.getElementById('id_rank');
	level.setAttribute("min", rank);
	
	opener.document.addoutReviewForm.rank_min.value = rank;
	
	
	self.close();
		
	
}

//왜 안먹히는지 모르겠어서 강제적으로 input number 고정
function set_rank(){
	var min = Number(document.addoutReviewForm.rank_min.value);
	var max = 30;
	
	if(document.addoutReviewForm.rank_level.value < min)
		document.addoutReviewForm.rank_level.value = min;
	
	else if(document.addoutReviewForm.rank_level.value > 30)
		document.addoutReviewForm.rank_level.value = 30;
}

function open_search(){
	
	var keyword =  $("input[name=search_keyword]").val();
	var url = 'https://search.naver.com/search.naver?where=view&sm=tab_jum&query='+keyword;
	
	
	window.open(url);
}

function open_url(){
	
	var url =  $("input[name=search_url]").val();
	
	
	window.open(url);
}

function delete_post(){
	
	var key = $("#delete_code").val();
	
	
	if(key == ''){
		alert("선택된 값이 없습니다.");
		return false;
	}
		
	
	 var url = "delete_outReview";
	 window.open(url, "del_view", "left=600,top=100, location=no, menubar=no, width=300, height=140");
}


