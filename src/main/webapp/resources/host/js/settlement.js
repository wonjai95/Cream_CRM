$("document").ready(function(){
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
	  
	  
	  $("#accountForm").on("change", ".numEx", function() {
		  alert("change");
		 var currentNum = $(".numEx").val();
		 var changeNum = addComma(currentNum);
		 console.log("changeNum : " + changeNum);
		 $(".numEx").val(changeNum);
		 $(".numEx2").val(changeNum);
	  });
	  
	  
	  
});