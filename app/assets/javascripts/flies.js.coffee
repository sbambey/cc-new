# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('form').on 'click', '.remove-field', (event) ->
		$(this).parent().find('input[type=checkbox]').each ->
			if this.checked
				$(this).next().remove()
				$(this).remove()
		event.preventDefault()

	$('form').on 'click', '.add-field', (event) ->
		new_input = $('<input type="checkbox"><input class="form-control" type="text" name="fly[added_requirements][]" placeholder="Added requirement">')
		new_input.appendTo($("#to-append"))
		event.preventDefault()