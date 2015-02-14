class TypeRating < ActiveRecord::Base
	has_many :fly_user_type_rating, dependent: :destroy
	has_many :users, through: :fly_user_type_rating
	has_many :flies, through: :fly_user_type_rating
end
