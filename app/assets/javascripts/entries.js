$(function () {
    $('form').submit(function(event) {
      //prevent form from submitting the default way
      event.preventDefault();
      alert("prevent default");
      
    });
});