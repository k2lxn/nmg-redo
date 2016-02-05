# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

sm_breakpoint = 695
	
# Remove fallback <select> if javascript is running


		
$(document).on "page:change", ->
	menu = $('header ul')
	view_width = $(window).width()


	# Use custom select widget if javascript enabled
	$('body').removeClass('no-widget')
	$('body').addClass('widget')
	
	# On-click to toggle select widget dropdown
	$('.select').click ->
		$(this).find('.opt-list').toggleClass('hidden')
		
	# Highlight select options on mouseover	
	$('.option').hover(
		-> $(this).addClass('highlight')
		-> $(this).removeClass('highlight')
	)
	
	# Show focus
	$('.select').focus(
		-> $(this).addClass('active')
	)
	
	# Unfocus
	$('.select').focusout(
		-> $(this).removeClass('active')
	)
	
	# Update select value (in native and custom widget)
	$('.option').click ->
		# Set selected value in native widget
		options = $(this).parent().children()	
		index = options.index(this)
		native_widget = $(this).parents('.select').prev()
		native_widget.prop("selectedIndex", index)
		
		# Set displayed value on custom widget
		value = $(this).parents('.select').children('span')
		value.html($(this).html())
	
	
	

		
		
		
		
		
		