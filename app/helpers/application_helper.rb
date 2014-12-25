module ApplicationHelper
	def active?(path)
		"active" if current_page?(path)
	end

	def convert_if_devise_key(key)
		if key == "notice"
			"success"
		elsif key == "alert"
			"danger"
		end
	end

	def flash_messages
		return "" if flash.empty?
		flash.each do |key, value|
			key = convert_if_devise_key(key)
	    return "<div class='alert alert-#{key} standard-margin'>#{value}</div>".html_safe
	  end
	end
end
