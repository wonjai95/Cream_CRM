/**
 * 
 */

$("document").ready(function(){
	
});

function numberWithCommas(x){
	$("input[type=number]").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}