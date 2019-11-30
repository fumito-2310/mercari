$(function(){

  $(".product-list__contents").hide();
  $(".list__item.exhibiting").on("click", function(e){
    $(".main").remove();
    $('.product-list__contents').show();
    console.log('kita');
    e.preventDefault();
  });

})