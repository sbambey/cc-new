manage_flight_experience = ->
	jQuery ->
		fe_options = [
		  $('#check_instrument')
		  $('#check_atp_qualifications')
		  $('#check_atp_written')
		  $('#check_multi_engine')
		  $('#check_float')
		]

		atpl_options = [
			$('#check_multi_engine')
			$('#check_float')
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
		manage_flight_experience()

manage_flight_experience()

$(document).ready(ready)
$(document).on('page:load', ready)