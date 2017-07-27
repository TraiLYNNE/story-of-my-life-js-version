$(function () {
	function Entry(id, time, mood, content) {
		this.id = id;
		this.time = time;
		this.mood = mood;
		this.content = content;
	}
	
	Entry.prototype.appendToDOM = function() {
		$(".entryTime").text('Time: ' + this.time);
		$(".entryMood").text('Mood: ' + this.mood);
		$(".entryContent").text(this.content);
	};
	
	
	$('form').submit(function(e) {
		e.preventDefault();
		
		var values = $(this).serialize();
		
		var entry = $.post('/entries', values);
			
		entry.done(function(resp) {
			var entry = new Entry(resp.id, resp.time, resp.mood, resp.content);
			
			entry.appendToDOM();
		});
	});
	
	$(".js-next").on("click", function(e) {
		e.preventDefault();
		
		var id = parseInt($(".js-next").attr("data-id"));
		
		$.get("/entries/" + id + "/next", function(resp) {
			var entry = new Entry(resp.id, resp.time, resp.mood, resp.content);
			
			entry.appendToDOM();
			
			$(".js-next").attr("data-id", entry.id);
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