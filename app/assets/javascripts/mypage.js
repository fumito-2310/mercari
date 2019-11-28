$(function(){

  $(".list__item").on("click", function(e){
    $(".main").remove();
    console.log('kita');
    e.preventDefault();
  });

})