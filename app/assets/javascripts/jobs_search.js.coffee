addRecords = ->
	url = $('.pagination .next a').attr('href')
	if url
		$.getScript url + "&add_records=true"

jQuery ->
	$(document).on 'keyup', '#jobs-search input', (event) ->
		$.get $('#jobs-search').attr('action'), $('#jobs-search').serialize(), null, 'script'
		return false

	if $('.pagination').length
		$(document).on 'click', '#add-records a', (event) ->
			addRecords()
			event.preventDefault()