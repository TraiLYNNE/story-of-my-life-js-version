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
	
	$('.js-more').on("click", function() {
		var nextId = parseInt($('.js-next').attr('data-id')) + 1;
		$.get("/entries/" + nextId + ".json", function(resp) {
			// body...
		});
	});
});