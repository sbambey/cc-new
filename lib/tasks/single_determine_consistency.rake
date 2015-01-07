desc "Determines consistency of a single airline and its opportunities"

task :single_determine_consistency, [:airline] => :environment do |t, args|
  
	airline = Airline.friendly.find(args[:airline])

	if !airline.no_track

    set = ScrapeNodeSet.create(airline: airline)
	   
    #scrape overview page

  	overview_url = URI(airline.recruitment_overview_page)
  	doc = Nokogiri::HTML(open(overview_url))

  	html = doc.at_css(airline.content_selector).try(:to_html)

  	titles = Array.new

  	doc.css(airline.title_selector).to_a.each do |title|
	    titles << title.text
	  end

	  set.nodes.create(node_type: ScrapeNode::TYPES[:parent], html: html, titles: titles, scrapeable: airline)

  	airline.flies.all.each do |fly|

      if !fly.no_track

    		#scrape fly page

    		opportunity_url = URI(fly.website)
    		doc = Nokogiri::HTML(open(opportunity_url))

    		html = doc.at_css(fly.content_selector).to_html

    		set.nodes.create(node_type: ScrapeNode::TYPES[:child], html: html, scrapeable: fly)

      end
  	end

  	notices = set.new_notices
	  notices.each do |notice|
	    notice.save
	  end
  end
end