module ApplicationHelper
	def convert_if_devise_key(key)
		if key == "notice"
			"success"
		elsif key == "alert"
			"danger"
		else
			key
		end
	end

	def display_image(img)
		if img.present?
			image_tag img, class: "airline-table-logo"
		end
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
end
