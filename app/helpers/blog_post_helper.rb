module BlogPostHelper
	def markdown(text)
	  options = {hard_wrap: true, autolink: true, no_intraemphasis: true}
	  @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
	  @markdown.render(text).html_safe
	end

	def abbreviated_content(content)
		doc = Nokogiri::HTML(content)
		return doc.css("p")[0..1].map(&:to_html).join("").html_safe
	end

	def header_time(time)
		time.strftime("%e %B %Y")
	end
end
