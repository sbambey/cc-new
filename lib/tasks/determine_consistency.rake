desc "Determines consistency of airlines and their opportunities"

task :determine_consistency => :environment do
	require 'nokogiri'
  require 'open-uri'

  Airline.all.each do |airline|

    if !airline.no_track

      puts "# Start - #{airline.name}"

      set = ScrapeNodeSet.create(airline: airline)
  	   
      #scrape overview page

    	overview_url = URI(airline.recruitment_overview_page)
    	doc = Nokogiri::HTML(open(overview_url))

      html_set = doc.css(airline.content_selector)

      html = ""
      html_set.each do |node|
        ht = node.try(:to_html)
        html += ht
      end

      html = html.encode('UTF-8', :invalid => :replace, :undef => :replace)

      titles = Array.new
      
      if airline.title_selector.present?
      	doc.css(airline.title_selector).to_a.each do |title|
    	    titles << title.text.encode('UTF-8', :invalid => :replace, :undef => :replace)
    	  end
      end

  	  set.nodes.create(node_type: ScrapeNode::TYPES[:parent], html: html, titles: titles, scrapeable: airline)

    	airline.flies.all.each do |fly|

        if !fly.no_track

      		#scrape fly page

      		opportunity_url = URI(fly.website)
      		doc = Nokogiri::HTML(open(opportunity_url))

          html_set = doc.css(fly.content_selector)

          html = ""
          html_set.each do |node|
            ht = node.try(:to_html)
            html += ht
          end

          html = html.encode('UTF-8', :invalid => :replace, :undef => :replace)

      		set.nodes.create(node_type: ScrapeNode::TYPES[:child], html: html, scrapeable: fly)

        end
    	end

    	notices = set.new_notices
  	  notices.each do |notice|
  	    notice.save
  	  end
    end
  end
end