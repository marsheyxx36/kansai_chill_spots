$(function(){
   
    $('.user_menu').on("click",function(){
        
        $("ul:not(:animated)", this).slideDown();
        
    });

    $('.user_menu').on("click",function(){
        $("ul:not(:animated)", this).slideUp();

    });


    });