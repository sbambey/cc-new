#Use in rake tasks to determine whether scraped pages have changed
CONSISTENT = { 
	fully: { html: true, titles: true }, 
	check_required: { html: false, titles: true }, 
	changed: { html: false, titles: false } 
}