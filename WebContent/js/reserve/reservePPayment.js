$(document).ready(function(){
	
	// 시간 선택
	$('#disableTimeRangesExample').timepicker({
		'disableTimeRanges' : [ [ '1am', '2am' ], [ '3am', '4:01am' ] ]
	});

	$('#disableTimeRangesExample').keydown(function() {	// 직접 입력 막기
		$(this).val("");
	});
	
});