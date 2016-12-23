addRecords = ->
	url = $('.pagination .next a').attr('href')
	if url
		$.getScript url + "&add_records=true"

toggleDetail = (desc) ->
	if desc.hasClass("hidden")
		desc.removeClass("hidden")
	else
		desc.addClass("hidden")

$(document).on 'keyup', '#jobs-search input', (event) ->
	$.get $('#jobs-search').attr('action'), $('#jobs-search').serialize(), null, 'script'
	return false

$(document).on 'click', '#add-records a', (event) ->
	addRecords()
	event.preventDefault()

$(document).on 'click', "[id^=airline-desc]", (event) ->
	active = $(event.currentTarget).hasClass("active")
	activeRecruitment = $(event.currentTarget).find(".text-green")
	if activeRecruitment.length != 0
		if active
			$(event.currentTarget).removeClass("active")
		else
			$(event.currentTarget).addClass("active")
		target = $(event.currentTarget).next()
		while target.hasClass("job-desc")
			toggleDetail(target)
			target = target.next()
	event.preventDefault()