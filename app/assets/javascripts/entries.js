$(function () {
	$('form').submit(function(event) {
		event.preventDefault();
			
		var values = $(this).serialize();
		var entry = $.post('/entries', values);
			
		entry.done(function(resp) {
			$('#entryMood').text(resp["mood"]);
			$('#entryContent').text(resp["content"]);
		});
	});
});