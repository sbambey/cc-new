# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://flightcrew.io"

SitemapGenerator::Sitemap.public_path = 'tmp/'
# store on S3 using Fog
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new
# inform the map cross-linking where to find the other maps
SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['FOG_DIRECTORY']}.s3-us-west-2.amazonaws.com/"
# pick a namespace within your bucket to organize your maps
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  add jobs_path, changefreq: "daily", priority: 1.0
  add blog_path, priority: 0.7
  add mission_path, priority: 0.6
  add contact_path, priority: 0.5
  add airlines_path, priority: 0.7
  Airline.find_each do |airline|
    add airline_path(airline), priority: 0.8, lastmod: airline.updated_at
    airline.flies.each do |fly|
      add airline_fly_path(airline, fly), priority: 0.9, lastmod: fly.updated_at
    end
  end

  BlogPost.find_each do |post|
    add show_blog_post_path(post), priority: 0.9, lastmod: post.updated_at
  end
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
