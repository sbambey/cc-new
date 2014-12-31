module Hstoreable
	extend ActiveSupport::Concern

	module ClassMethods

		def true?(string_value)
			true if string_value == "1"
		end

		def to_sb(bool)
			bool == "1" ? "True" : "False"
		end

		def order_according_to_hstore_keys(ordered, unordered)
			new_ordered = {}
			ordered.each do |type, value|
				new_ordered[type] = unordered[type.to_s]  if unordered.key?(type.to_s)
			end
			return new_ordered
		end
	end
end