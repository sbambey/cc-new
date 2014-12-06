module DeviseHelper
	def errors?(resource, method)
		resource.errors.full_messages_for(method).any?
	end
end