module Searchable
	extend ActiveSupport::Concern

	module ClassMethods

		def search(search)
			if search
				where("lower(name) LIKE ? OR lower(base) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
			else
				all
			end
		end
	end
end