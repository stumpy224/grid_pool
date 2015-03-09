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
  if (window.location.pathname == '/' || window.location.pathname.indexOf("/?year") > -1)
    setActiveNavbarLinkToRoot();
  else if (window.location.pathname.indexOf("/bracket") > -1)
    setActiveNavbarLinkToBracket();
  else if (window.location.pathname.indexOf("/grid") > -1)
    setActiveNavbarLinkToGrid();
  else if (window.location.pathname.indexOf("/faq") > -1)
    setActiveNavbarLinkToFaq();
}

function setActiveNavbarLinkToRoot() {
  makeAllNavLinksInactive();
  $('#nav_link_to_results').addClass('active');
}

function setActiveNavbarLinkToBracket() {
  makeAllNavLinksInactive();
  $('#nav_link_to_bracket').addClass('active');
}

function setActiveNavbarLinkToGrid() {
  makeAllNavLinksInactive();
  $('#nav_link_to_grid').addClass('active');
}

function setActiveNavbarLinkToFaq() {
  makeAllNavLinksInactive();
  $('#nav_link_to_faq').addClass('active');
}

function makeAllNavLinksInactive() {
  $('#nav_link_to_results').removeClass('active');
  $('#nav_link_to_bracket').removeClass('active');
  $('#nav_link_to_grid').removeClass('active');
  $('#nav_link_to_faq').removeClass('active'); 
}

$(document).ready(function() {
  $('#navigate_to_2015').click(function() {
    navigate_by_year('2015');
  });
  $('#navigate_to_2014').click(function() {
    navigate_by_year('2014');
  });
});

$(document).ready(function() {
  $('.scrollToTop').click(function() {
    $('html, body').animate({
      scrollTop: 0
    }, 'normal');
  });
});

$(document).ready(function() {
  $('#bracketLink').click(function(e) { 
    e.stopPropagation();
    e.preventDefault();
    $('#wait_modal').modal('show');
    $.get("/refresh_bracket", function(data) {
      $('#wait_modal').modal('hide');
      window.location = '/bracket'
    });
  });
});

$(document).ready(function() {
  $('#refresh_results_link').click(function(e) { 
    e.stopPropagation();
    e.preventDefault();
    $('#wait_modal').modal('show');
    $.get("/refresh_results", function(data) {
      $('#wait_modal').modal('hide');
      $("#results_page").load(window.location.href + ' #results_page');
    });
  });
});

function navigate_by_year(year) {
  var page = '/';
  if ( $('#nav_link_to_bracket').hasClass('active') )
    page += 'bracket'
  if ( $('#nav_link_to_grid').hasClass('active') )
    page += 'grid'
  if ( $('#nav_link_to_faq').hasClass('active') )
    page += 'faq'
  window.location = page + '?year=' + year;
}
