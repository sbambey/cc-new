module Hstoreable
	extend ActiveSupport::Concern

	module ClassMethods
		def to_sb(bool)
			bool == "1" ? "True" : "False"
		end
	end
end