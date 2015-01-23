jQuery ->
	$('html').on 'click', '.remove-field', (event) ->
		$(this).parent().find('input[type=checkbox]').each ->
			if this.checked
				$(this).closest(".input-group").remove()
		event.preventDefault()

	$('html').on 'click', '.add-field', (event) ->
		new_input = $(
			'<div class="input-group added-input">' +
				'<span class="input-group-addon">' +
					'<input type="checkbox">' +
				'</span>' +
			  '<input type="text" name="fly[added_requirements][]" class="form-control" placeholder="Added requirement">' +
			'</div>')
		new_input.appendTo($("#to-append"))
		event.preventDefault()