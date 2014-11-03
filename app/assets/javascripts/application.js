// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/effect-highlight
//= require jquery.tagsinput
//= require questions

var onPage = function (controller, action) {
  return $("body." + controller + "-" + action).length
};

$(document).ready(function(){
  $(".dropdown-button").click(function(){
    $(".menu").toggleClass("show-menu");
    $(".menu > li").click(function(){
      $(".dropdown-button").html($(this).html());
      $(".menu").removeClass("show-menu");
    });
  });
});

$(document).ready(function() {
  $('.q h1').on('click', function () {
    $(this).parent().children('.content-box').slideToggle(500);
  })
});
