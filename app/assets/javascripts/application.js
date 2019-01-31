// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// This directory is uncommented --> require rails-ujs
//

//= require activestorage
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
//= require turbolinks
//= require jquery.raty.js
//= require_tree .
//= require jquery.elevateZoom-3.0.8.min


$(document).on('turbolinks:load', function()  {
  $( ".icon_frame").mouseenter(function() {
    var parent = $(this).parent()
    $("p", parent).show(),
    $( ".icon_frame i", parent ).hide(this);
  });
  $( ".icon_frame" ).mouseleave(function() {
    var parent = $(this).parent()
    $("p", parent).hide(),
    $( ".icon_frame i" ).show(this);
  });
  $( "#product_card_showbtn").mouseenter(function() {
    pre_col = $(this).css("background-color")
    $(this).css("background-color", "white");
    $(this).css("color", pre_col)

  });
  $( "#product_card_showbtn" ).mouseleave(function() {
    $(this).css("background-color", pre_col);
    $(this).css("color", "white")
  });


  $("#navbtn_toggle").click(function() {
    if ($("#navbarTogglerDemo01").hasClass("show")) {
      console.log("NAVBARTOGGLE-ON")
      $("#placeholding_element").css("height", "0em");
    } else {
      console.log("NAVBARTOGGLE-OFF")
      $("#placeholding_element").css("height", "38em");
    }
  });

});
