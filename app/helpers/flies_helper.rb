module FliesHelper
	def bool_field(type, value, type_hash)
		if Fly.true?(value)
			"<p><span class='glyphicon glyphicon-ok' aria-hidden='true'></span>#{type_hash[type.to_sym]}</p>".html_safe
		end
	end
end
