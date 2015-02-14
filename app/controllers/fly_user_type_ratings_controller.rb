class FlyUserTypeRatingsController < ApplicationController

	def create
		@fly_user_type_rating = FlyUserTypeRating.create(fly_user_type_rating_params)
	end

	private

	def fly_user_type_rating_params
		params.require(:fly_user_type_rating).permit(:type_rating_id, :fly_id, :user_id, :issuance, :current, :pic)
  end
end