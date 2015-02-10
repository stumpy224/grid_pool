// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).on("page:change", function() {
  return init();
});

$(function() {
  init();
});

function init() {
	setActiveNavbarLink();
}

function setActiveNavbarLink() {
  if (window.location.pathname == '/')
    setActiveNavbarLinkToRoot();
  else if (window.location.pathname == '/bracket')
    setActiveNavbarToBracket();
  else if (window.location.pathname == '/grid')
    setActiveNavbarToGrid();
  else if (window.location.pathname == '/faq')
    setActiveNavbarToFaq();
}

function setActiveNavbarToRoot() {
  makeAllNavLinksInactive();
  $('#nav_link_to_results').addClass('active');
}

function setActiveNavbarToBracket() {
  makeAllNavLinksInactive();
  $('#nav_link_to_bracket').addClass('active');
}

function setActiveNavbarToGrid() {
  makeAllNavLinksInactive();
  $('#nav_link_to_grid').addClass('active');
}

function setActiveNavbarToFaq() {
  makeAllNavLinksInactive();
  $('#nav_link_to_faq').addClass('active');
}

function makeAllNavLinksInactive() {
  $('#nav_link_to_results').removeClass('active');
  $('#nav_link_to_bracket').removeClass('active');
  $('#nav_link_to_grid').removeClass('active');
  $('#nav_link_to_faq').removeClass('active'); 
}