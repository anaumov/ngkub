//= require jquery
//= require jquery_ujs
//= require ckeditor/init
//= require_tree .
//= require_self
//= require twitter/bootstrap

$(document).ready(function(){
  $('#slides').slides({
			preload: true,
      container: 'slider',
      paginationClass: 'pic_navi',
      play: 5000,
	  })

  $("#ans_now").click(function () {
    $("div.answer").show("slow");
  })

  $("span.add_comment").click(function(){
    $(this).toggleClass('input');
    $("div.new_comment").slideToggle('slow');    
  })
  
  $('span.add_comment_bottom').click(function(){
    var current = $('a.back_lnk').offset().top;
   
    $('html').animate({
      scrollTop: '+=' + current + 'px'
    }, 1200, function() {
      $("div.new_comment").slideDown('slow');
      $('span.add_comment').addClass('input');
    });    
    
  })
})

