# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

sm_breakpoint = 640
	
		
$(document).on "page:change", ->
	menu = $('header ul')
	view_width = $(window).width()
	
	# Force header nav ul to full screen width for small screens
	if view_width <= sm_breakpoint
		gap = (view_width - $(".center-wrap").width())/2	
		menu.css("width", view_width).css("right", -(gap))
		
	# Toggle nav when menu icon clicked	
	$('#menu-icon').click ->
		menu.slideToggle("fast")
	
	# Pull menu up after user chooses (taps) a link 
	if view_width <= sm_breakpoint
	 	$('header ul li a').click ->
			menu.delay(300).slideToggle("fast")

	
# Show nav ul in browser if page resized
$(window).resize ->
	menu = $('header ul')
	view_width = $(window).width()
	
	if view_width > sm_breakpoint
		menu.css('display', 'inline-block').css('width', 'auto').css("right", "0")
	else	
		gap = (view_width - $(".center-wrap").width())/2
		menu.css("width", view_width).css("right", -(gap))
			
		
		
		
		
		
		