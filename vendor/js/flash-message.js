$(document).on('turbolinks:load',function(){
	setTimeout(function() {
		$('#flash-messages-section').slideUp('500');
	}, 5000);
});