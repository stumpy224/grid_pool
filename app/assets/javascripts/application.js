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
  handleNavigationByYears();
  handleResultsLinkClick();
  handleBracketLinkClick();

  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });
}

function setActiveNavbarLink() {
  makeAllNavLinksInactive();
  if (window.location.pathname === '/' || window.location.pathname.indexOf("/?year") > -1)
    setActiveNavbarLinkToRoot();
  else if (window.location.pathname.indexOf("/bracket") > -1)
    setActiveNavbarLinkToBracket();
  else if (window.location.pathname.indexOf("/grid") > -1)
    setActiveNavbarLinkToGrid();
  else if (window.location.pathname.indexOf("/faq") > -1)
    setActiveNavbarLinkToFaq();
}

function setActiveNavbarLinkToRoot() {
  $('#nav_link_to_results').addClass('active');
}

function setActiveNavbarLinkToBracket() {
  $('#nav_link_to_bracket').addClass('active');
}

function setActiveNavbarLinkToGrid() {
  $('#nav_link_to_grid').addClass('active');
}

function setActiveNavbarLinkToFaq() {
  $('#nav_link_to_faq').addClass('active');
}

function makeAllNavLinksInactive() {
  $('#nav_link_to_results').removeClass('active');
  $('#nav_link_to_bracket').removeClass('active');
  $('#nav_link_to_grid').removeClass('active');
  $('#nav_link_to_faq').removeClass('active'); 
}

function handleNavigationByYears() {
  $('#navigate_to_2015').click(function() {
    navigate_by_year('2015');
  });
  $('#navigate_to_2014').click(function() {
    navigate_by_year('2014');
  }); 
}

function navigate_by_year(year) {
  var page = '/';
  if ( $('#nav_link_to_bracket').hasClass('active') ) {
    refreshBracket(year);
    return;
  }
  if ( $('#nav_link_to_grid').hasClass('active') )
    page += 'grid';
  if ( $('#nav_link_to_faq').hasClass('active') )
    page += 'faq';
  window.location.href = page + '?year=' + year;
}

function handleResultsLinkClick() {
  $('#refresh_results_link').click(function(e) { 
    e.stopPropagation();
    e.preventDefault();
    refreshResults("");
  });
}

function handleBracketLinkClick() {
  $('#bracket_link').click(function(e) {
    e.stopPropagation();
    e.preventDefault();
    refreshBracket("");
  });
}

function refreshBracket(year) {
  $('#wait_modal').modal('show');
  $.get("/refresh_bracket", function(data) {
    var yearParam = year.length > 0 ? year : getParameterByName("year");
    var queryString = yearParam.length > 0 ? '?year=' + yearParam : '';
    $('#wait_modal').modal('hide');
    window.location.href = '/bracket' + queryString;
  });
}

function refreshResults(year) {
  $('#wait_modal').modal('show');
  $.get("/refresh_results", function(data) {
    var yearParam = year.length > 0 ? year : getParameterByName("year");
    var queryString = yearParam.length > 0 ? '?year=' + yearParam : '';
    $('#wait_modal').modal('hide');
    window.location.reload();
  });
}

function getParameterByName(name) {
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
  var results = regex.exec(location.search);
  return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
