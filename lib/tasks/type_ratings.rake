desc "Adds type ratings"

task :type_ratings => :environment do
  require 'nokogiri'
  require 'open-uri'

  base_url = "https://www.findapilot.com"

  url = URI.join(base_url, "/blog/list-of-faa-airman-certificate-type-ratings-11/05/2010").to_s

  doc = Nokogiri::HTML(open(url))

  ratings = doc.css("table tr td:nth-of-type(3)").reject{|i| i.text.blank?}.collect{|i| i.text}
  
  ratings.each do |rating|
    TypeRating.create(designation: rating)
  end
end

