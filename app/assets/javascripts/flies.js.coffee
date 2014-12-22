# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('form').on 'click', '.remove_field', (event) ->
		$(this).parent().parent().remove()
		event.preventDefault()

	$('form').on 'click', '.add_fields', (event) ->
		clone = $(this).parent().find("#requirements #hidden_field").clone().removeAttr("id")
		clone.appendTo($("#requirements"))
		event.preventDefault()