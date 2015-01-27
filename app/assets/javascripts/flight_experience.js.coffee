jQuery ->
	$("html").on "change", ".rating-select", (event) ->
		$(".checkbox, #check_instrument, #check_atp_qualifications, #check_atp_written, #check_multi_engine").addClass("hidden")
		if $(this).val() == "Commercial pilot"
			$(".checkbox, #check_instrument, #check_atp_qualifications, #check_atp_written, #check_multi_engine").removeClass("hidden")
		if ($(this).val() == "Restricted ATPL" || $(this).val() == "Unrestricted ATPL")
			$(".checkbox, #check_multi_engine").removeClass("hidden")

ready = ->
	jQuery ->
		if $(".rating-select").val() == "Commercial pilot"
			$(".checkbox, #check_instrument, #check_atp_qualifications, #check_atp_written, #check_multi_engine").removeClass("hidden")
		if $(".rating-select").val() == "Restricted ATPL" || $(".rating-select").val() == "Unrestricted ATPL"
			$(".checkbox, #check_multi_engine").removeClass("hidden")

$(document).ready(ready)
$(document).on('page:load', ready)