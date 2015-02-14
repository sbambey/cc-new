class FlyUserTypeRating < ActiveRecord::Base
	belongs_to :fly
	belongs_to :user
	belongs_to :type_rating
end
