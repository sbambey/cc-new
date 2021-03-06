desc "Determines consistency of airlines and their opportunities"

task :determine_consistency => :environment do
	require 'nokogiri'
  require 'open-uri'

  Airline.order("name ASC").each do |airline|

    if !airline.no_track

      puts "# Start - #{airline.name}"
  	   
      #scrape overview page

    	overview_url = URI(airline.recruitment_overview_page)

    	begin
        doc = Nokogiri::HTML(open(overview_url))
      rescue => ex
        puts ex
        next
      end

      set = ScrapeNodeSet.create(airline: airline)

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

  	  set.nodes.create(node_type: ScrapeNode::TYPES[:parent], html: ActionController::Base.helpers.strip_tags(html).gsub(/\s+/, ""), titles: titles, scrapeable: airline)

    	airline.flies.all.each do |fly|

        if !fly.no_track

      		#scrape fly page

      		opportunity_url = URI(fly.posting_website)

          begin
      		  doc = Nokogiri::HTML(open(opportunity_url))
          rescue => ex
            puts ex
            next
          end

          html_set = doc.css(fly.content_selector)

          html = ""
          html_set.each do |node|
            ht = node.try(:to_html)
            html += ht
          end

          html = html.encode('UTF-8', :invalid => :replace, :undef => :replace)

      		set.nodes.create(node_type: ScrapeNode::TYPES[:child], html: ActionController::Base.helpers.strip_tags(html).gsub(/\s+/, ""), scrapeable: fly)

        end
    	end

    	notices = set.new_notices
  	  notices.each do |notice|
  	    notice.save
  	  end
    end
  end
end