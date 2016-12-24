module Searchable
	extend ActiveSupport::Concern

	module ClassMethods

		def search(search)
			if search
				where("lower(flies.name) LIKE :q OR lower(airlines.name) LIKE :q", {q: "%#{search.downcase}%"})
			else
				all
			end
		end
	end
end