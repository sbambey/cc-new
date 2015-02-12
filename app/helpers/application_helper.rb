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

  def search_bar_page?(controller, action)
  	pages = {"static_pages" =>  ["landing"], "board" => ["matched", "all"]}
  	pages.has_key?(controller) && pages[controller].include?(action) ? true : false
 	end

 	def job_board_page?(controller, action)
 		controller == "board" && action == "matched"
 	end

  def bts_will_paginate(relation, args = {})
  	if args[:endless]
  		("<div class='text-center' id='add-records'>" +
  			"<a href='#'><div>Show more</div><span class='glyphicon glyphicon-chevron-down' aria-hidden='true'></span></a>" +
  			"<div class='hidden'>#{will_paginate relation, renderer: BootstrapPagination::Rails}</div>" +
  		"</div>").html_safe
  	else
  		"<div class='text-center'>#{will_paginate relation, renderer: BootstrapPagination::Rails}</div>".html_safe
  	end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("shared/" + association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-success", data: {id: id, fields: fields.gsub("\n", " ")})
  end
end
