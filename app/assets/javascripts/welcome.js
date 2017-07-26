$(function(){
    $('#bookshelf .link').on('click', function(e) {
        e.preventDefault();
        
        $('#bookshelf').load('/books')
    });
});