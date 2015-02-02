module ApplicationHelper
	def full_title(title)
		if title.present?
			"flightcrew.io | #{title}"
		else
			"flightcrew.io"
		end
	end

	def convert_if_devise_key(key)
		if key == "notice"
			"success"
		elsif key == "alert"
			"danger"
		else
			key
		end
	end

	def display_image(img, class_name = "airline-table-logo")
		img.present? ? image_tag(img, class: class_name) : ""
	end

	def abbreviate(text)
		text[0...20] + "..."
	end

	def flash_messages
		return "" if flash.empty?
		flash.each do |key, value|
			key = convert_if_devise_key(key)
	    return "<div class='alert alert-#{key}' role='alert'>#{value}</div>".html_safe
	  end
	end

	def display_landing_page?
  	params[:controller].eql?("static_pages") and params[:action].eql?("landing")
  end
end
