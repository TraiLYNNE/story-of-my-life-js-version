// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
    $('#bookshelf .link').on('click', function(){
        $.ajax({
            method: 'GET',
            url: '/books'
        }).done(function(data){
            console.log(data);
        });
    });
});


