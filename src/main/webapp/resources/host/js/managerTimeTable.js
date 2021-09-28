$(document).ready(function() {
	
    // 담당자 선택
    $("button[id^=managerBtn]").click(function() {
       console.log("managerBtn click");
       var employeeBtn = $(this).attr('value');
       $('#selectManager').val(employeeBtn);
       $('.managerSelectedInfo').html(employeeBtn);
    });
    
    
});