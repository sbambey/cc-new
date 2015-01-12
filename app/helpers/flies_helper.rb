module FliesHelper
	def with_glyph(text)
		"<p class='with-glyph'><span class='glyphicon glyphicon-ok' aria-hidden='true'></span>#{text}</p>".html_safe
	end
end
