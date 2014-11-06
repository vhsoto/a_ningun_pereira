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
//= require bootstrap-sprockets
//= require jquery_ujs

//= require jquery-ui

//= require turbolinks
//= require_tree .

var ready;
ready = function() {
  $(".alert").delay(3500).slideUp().fadeOut(2000);
  // $(".alert").alert();
  // window.setTimeout(function(){ $(".alert").alert('close');}, 2000);
  $("#js-mostrar-ocultar").click(function(){
  	var seleccionador;
  	seleccionador = "." + $(this).attr('data-selector') ; 
  	if ($(seleccionador).is(":visible")) {
  		$(seleccionador).removeClass("hide").slideUp();
  	} else {
  		$(seleccionador).hide().removeClass("hide").slideDown();
  	}
  	return false;
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);

