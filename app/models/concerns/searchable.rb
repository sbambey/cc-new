module Searchable
	extend ActiveSupport::Concern

	module ClassMethods

		def search(search)
			if search
				where("lower(flies.name) LIKE :q OR lower(flies.base) LIKE :q OR lower(flies.equipment) LIKE :q OR lower(airlines.name) LIKE :q OR lower(type_ratings.designation) LIKE :q", {q: "%#{search.downcase}%"}).references(:airlines, :type_ratings)
			else
				all
			end
		end
	end
end