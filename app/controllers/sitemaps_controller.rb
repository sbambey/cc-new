class SitemapsController < ApplicationController
  def show
  	redirect_to "https://s3-us-west-2.amazonaws.com/sitemap-cockpitcareers/sitemaps/sitemap.xml.gz"
  end
end
