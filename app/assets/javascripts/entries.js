$(function () {
	$('form').submit(function(event) {
		event.preventDefault();
			
		var values = $(this).serialize();
		var entry = $.post('/entries', values);
			
		entry.done(function(resp) {
			console.log(resp);
		});
	});
});