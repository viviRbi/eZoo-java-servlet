/**
 * 
 */
$(document).ready(function(){
 
	// remove any error messages after 3 seconds
	setTimeout(function(){
		$(".alert").fadeOut("slow");
	} ,5000);
	
	
	
	//setup dataTables
	$(".ezoo-datatable").DataTable({
		stateSave: true,
		lengthChange: false,
		info:false
	});
	
    // Script to Activate the Carousel
    $('.carousel').carousel({
//        interval: 5000 //changes the speed
    });

	
//	$(".ezoo-simple-datatable").DataTable({
//		paging: false,
//		searching: false,
//		info: false,
//		ordering: false
//		
//	});	

	// Get FIRST schedule option and paste its value at the begining
	
	let selectSchedule = $("select[name='schedule_id'] option")

	if (selectSchedule.length >0){
		pasteThisScheduleSetValue(selectSchedule.val(),selectSchedule.filter(':selected'))
	} 
});

// Get schedule option and paste its value to edit feeding schedule

	function pasteThisSchedule(e){
	// get selected option by its value
		let id = e.value
		let selectedOption = $(e).find("option[value="+id+"]")
		pasteThisScheduleSetValue(id, selectedOption)	
	}
	
	function pasteThisScheduleSetValue(id, selectedOption){
		$("#updateFeedingSchedule input[name='feeding_time']").val(selectedOption.data('feeding_time'))
		$("#updateFeedingSchedule input[name='recurrence']").val(selectedOption.data('recurrence'))
		$("#updateFeedingSchedule input[name='food']").val(selectedOption.data('food'))
		$("#updateFeedingSchedule textarea[name='notes']").val(selectedOption.data('notes'))
		$("#updateFeedingSchedule input[name='schedule_id']").val(id)
		$("#deleteFeedingSchedule input[name='schedule_id']").val(id)
	}
	
	
	
	