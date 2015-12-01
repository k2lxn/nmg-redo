# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

sm_breakpoint = 640

$(document).on "page:change", ->
	menu = $('header ul')
	
	# Toggle nav when menu icon clicked	
	$('#menu-icon').click (e) ->
		e.preventDefault();
		menu.slideToggle("fast");
	
	# Pull menu up after user chooses (taps) a link 
	if $(window).width() <= sm_breakpoint
	 	$('header ul li a').click ->
			menu.delay(300).slideToggle("fast");

	
# Show nav ul in browser if page resized
$(window).resize ->
	if $(window).width() > sm_breakpoint
		$('header ul').css('display', 'inline-block')
	