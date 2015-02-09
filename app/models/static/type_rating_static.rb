class TypeRatingStatic < ActiveRecord::Base
	self.table_name = "type_ratings_static"

	def self.designations
		designations = []
		all.each do |t|
			designations << t.designation
		end
		return designations
	end
end
