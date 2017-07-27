$(function(){
    $('#entry-nav .all').on('click', function(e){
        e.preventDefault();
        
        $('#results').load(this.href);
    });
});
