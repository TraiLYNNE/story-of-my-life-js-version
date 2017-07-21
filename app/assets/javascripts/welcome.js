// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
    $('#bookshelf .link').on('click', function(e) {
        $.get(this.href).success(function(resp){
            console.log(resp);
            $('#bookshelf').html(resp);
        });
        e.preventDefault();
    });
});