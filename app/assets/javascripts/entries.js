$(function(){
    $('form').submit(function(e) {
        e.preventDefault();
        
        var values = $(this).serialize();
        
        var entry = $.post('/entry', values);
        
        entry.done(function(data) {
            alert('new post created');
        });
    });
})