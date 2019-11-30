$(function(){

  $(".product-list").hide();
  $(".list__item.exhibiting").on("click", function(e){
    $(".main").remove();
    $('.product-list').show();
    console.log('kita');
    e.preventDefault();
  });

})