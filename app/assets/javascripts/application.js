// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .



function showStoryChoices()
{
  $( "#welcome").removeClass("active visible");
  $( "#intro").addClass("play active visible");
  $( "#choices").addClass("active visible");
}

$(document).ready(function(){
  $("#start-button" ).click(function() {
    showStoryChoices();
  });
});

$(window).load(function() {
  $.urlParam = function(name){
      var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
      if (results==null){
         return null;
      }
      else{
         return results[1] || 0;
      }
  }

  if($.urlParam("show")) {
    showStoryChoices();
  }
});
