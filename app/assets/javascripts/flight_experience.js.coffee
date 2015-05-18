manage_flight_experience = (fe_options, atpl_options) ->
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

ready = ->
	fe_options = [
	  $('#check_instrument')
	  $('#check_atp_qualifications')
	  $('#check_atp_time_qualifications')
	  $('#check_atp_written')
	  $('#check_multi_engine')
	  $('#check_float')
	  $('#check_float_multi')
	  $('#check_cfi')
	  $('#check_cfii')
	  $('#check_mei')
	]

	atpl_options = [
		$('#check_multi_engine')
		$('#check_float')
		$('#check_float_multi')
		$('#check_cfi')
	  $('#check_cfii')
	  $('#check_mei')
	]

	manage_flight_experience(fe_options, atpl_options)

	$('.selectpicker').selectpicker()

	$("html").on "change", ".rating-select", (event) ->
		$.each fe_options, ->
			$(this).find(':input[type=checkbox]').attr 'checked', false
			return
		manage_flight_experience(fe_options, atpl_options)

$(document).ready(ready)
$(document).on('page:load', ready)