module Searchable
	extend ActiveSupport::Concern

	module ClassMethods

		def search(search)
			if search
				where("name LIKE ? OR base LIKE ?", "%#{search}%", "%#{search}%")
			else
				all
			end
		end
	end
end