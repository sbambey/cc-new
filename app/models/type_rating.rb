class TypeRating < ActiveRecord::Base
	belongs_to :user
	belongs_to :fly
end
