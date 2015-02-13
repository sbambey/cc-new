module Searchable
	extend ActiveSupport::Concern

	module ClassMethods

		def search(search)
			if search
				where("lower(flies.name) LIKE :q OR lower(flies.base) LIKE :q OR lower(flies.equipment) LIKE :q OR lower(airlines.name) LIKE :q", {q: "%#{search.downcase}%"}).references(:airlines)
			else
				all
			end
		end
	end
end