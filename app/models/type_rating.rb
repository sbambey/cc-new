class TypeRating < ActiveRecord::Base
	belongs_to :user
	belongs_to :fly

	validates :designation, inclusion: [*TypeRatingStatic.designations, ""]
	#validates_date :issuance, :after => lambda { Datetime.new(1930) }
end
