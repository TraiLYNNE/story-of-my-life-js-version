// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
    $('#bookshelf .link').on('click', function(e) {
        e.preventDefault();
        $.get(this.href).success(function(resp){
            $('#bookshelf').html(resp);
        });
    });
});