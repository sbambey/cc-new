manage_flight_experience = ->
	jQuery ->
		fe_options = [
		  $('#check_instrument')
		  $('#check_atp_qualifications')
		  $('#check_atp_written')
		  $('#check_multi_engine')
		  $('#check_float')
		  $('#check_float_multi')
		]

		atpl_options = [
			$('#check_multi_engine')
			$('#check_float')
			$('#check_float_multi')
		]

		$("html").on "change", ".rating-select", (event) ->

			$.each fe_options, ->
				$(this).addClass 'hidden'
				$(this).find(':input[type=checkbox]').attr 'checked', false
				return

			if $(this).val() == "Commercial pilot"
				$.each fe_options, ->
				  $(this).removeClass 'hidden'
				  return

			if $(this).val() == "Restricted ATPL" or $(this).val() == "Unrestricted ATPL"
				$.each atpl_options, ->
				  $(this).removeClass 'hidden'
				  return

ready = ->
	jQuery ->
		fe_options = [
		  $('#check_instrument')
		  $('#check_atp_qualifications')
		  $('#check_atp_written')
		  $('#check_multi_engine')
		  $('#check_float')
		  $('#check_float_multi')
		]

		atpl_options = [
			$('#check_multi_engine')
			$('#check_float')
			$('#check_float_multi')
		]

		$.each fe_options, ->
			$(this).addClass 'hidden'
			return

		if $('.rating-select').val() == "Commercial pilot"
			$.each fe_options, ->
			  $(this).removeClass 'hidden'
			  return

		if $('.rating-select').val() == "Restricted ATPL" or $('.rating-select').val() == "Unrestricted ATPL"
			$.each atpl_options, ->
			  $(this).removeClass 'hidden'
			  return
		$('.selectpicker').selectpicker()

		manage_flight_experience()

$(document).ready(ready)
$(document).on('page:load', ready)