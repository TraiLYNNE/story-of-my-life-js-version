$(function () {
	$('form').submit(function(e) {
		e.preventDefault();
			
		var values = $(this).serialize();
		var entry = $.post('/entries', values);
			
		entry.done(function(resp) {
			$('#entryMood').text(resp["mood"]);
			$('#entryContent').text(resp["content"]);
		});
	});
	
	$(".js-next").on("click", function() {
		var nextId = parseInt($(".js-next").attr("data-id")) + 1;
		$.get("/entries/" + nextId + ".json", function(resp) {
			$(".entryTime").text(resp["time"]);
			$(".entryMood").text(resp["mood"]);
			$(".entryContent").text(resp["content"]);
			
			$(".js-next").attr("data-id", resp["id"]);
		});

	});
	
	$(".js-prev").on("click", function() {
		var lastId = parseInt($(".js-prev").attr("data-id")) - 1;
		$.get("/entries/" + lastId + ".json", function(resp) {
			$(".entryTime").text(resp["time"]);
			$(".entryMood").text(resp["mood"]);
			$(".entryContent").text(resp["content"]);
			
			$(".js-prev").attr("data-id", resp["id"]);
		});

	});
});