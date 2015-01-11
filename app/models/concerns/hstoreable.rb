module Hstoreable
	extend ActiveSupport::Concern

	module ClassMethods

		def order_according_to_hstore_keys(ordered, unordered)
			new_ordered = {}
			ordered.each do |type, value|
				new_ordered[type] = unordered[type.to_s]  if unordered.key?(type.to_s)
			end
			new_ordered
		end
	end
end